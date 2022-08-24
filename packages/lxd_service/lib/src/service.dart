import 'dart:async';

import 'package:lxd/lxd.dart';
import 'package:lxd_x/lxd_x.dart';
import 'package:rxdart/rxdart.dart';

import 'features.dart';
import 'remote.dart';

abstract class LxdService {
  factory LxdService(LxdClient client) => _LxdService(client);

  LxdClient get client;

  Future<void> init();
  Future<void> dispose();

  List<String>? get instances;
  Stream<List<String>> get instanceStream;

  Stream<String> get instanceAdded;
  Stream<String> get instanceRemoved;
  Stream<String> get instanceUpdated;

  Future<LxdInstance> getInstance(String name);
  Future<LxdOperation> createInstance(LxdImage image, {LxdRemote? remote});
  Future<LxdOperation> startInstance(String name, {bool force = false});
  Future<void> initInstance(String name, LxdImage image);
  Future<LxdOperation> stopInstance(String name, {bool force = false});
  Future<LxdOperation> deleteInstance(String name);
  Stream<LxdOperation> watchInstance(String instance);

  Future<LxdOperation> getOperation(String id);
  Stream<LxdOperation> watchOperation(String id);
  Future<LxdOperation> waitOperation(String id);
  Future<void> cancelOperation(String id);
}

class _LxdService implements LxdService {
  _LxdService(this._client);

  final LxdClient _client;
  StreamSubscription? _events;
  final _instances = BehaviorSubject<List<String>>();
  final _added = StreamController<String>.broadcast();
  final _removed = StreamController<String>.broadcast();
  final _updated = StreamController<String>.broadcast();
  final _statuses = <String, LxdStatusCode>{};

  List<String>? get instances => _instances.valueOrNull;
  Stream<List<String>> get instanceStream => _instances.stream;

  Stream<String> get instanceAdded => _added.stream;
  Stream<String> get instanceRemoved => _removed.stream;
  Stream<String> get instanceUpdated => _updated.stream;

  @override
  LxdClient get client => _client;

  @override
  Future<void> init() async {
    _instances.add(await _client.getInstances());

    // process ongoing operations to see if instances being started or stopped
    final allIds = await _client.getOperations();
    for (final ids in allIds.values) {
      for (final id in ids) {
        final operation = await _client.getOperation(id);
        _handleOperation(operation);
      }
    }

    // listen to all operation events that affect instances
    _events ??= _client.getEvents(types: {LxdEventType.operation}).where((ev) {
      return ev.toOperation().instances?.isNotEmpty == true;
    }).listen(_updateInstances);
  }

  @override
  Future<void> dispose() async {
    await _events?.cancel();
    await Future.wait<void>([
      _added.close(),
      _removed.close(),
      _updated.close(),
      _instances.close(),
    ]);
  }

  @override
  Future<LxdInstance> getInstance(String name) async {
    final instance = await _client.getInstance(name);

    // check for status override from pending/running operations
    final statusCode = _statuses[name]?.value;
    return statusCode != null
        ? instance.copyWith(statusCode: statusCode)
        : instance;
  }

  @override
  Future<LxdOperation> createInstance(LxdImage image, {LxdRemote? remote}) {
    return _client.createInstance(
      name: image.properties['name'],
      source: image,
      server: remote?.isLocal == false ? remote!.address : null,
    );
  }

  @override
  Future<LxdOperation> startInstance(String name, {bool force = false}) {
    return _client.startInstance(name, force: force);
  }

  @override
  Future<void> initInstance(String name, LxdImage image) async {
    final start = await _client.startInstance(name);
    await _client.waitOperation(start.id);

    final featureNames = image.properties['user.features']?.split(',').toSet();
    final features = LxdFeature.values
        .where((feature) => featureNames?.contains(feature.name) == true)
        .map(LxdFeature.create);

    final init = LxdFeatureContext(
      image: image,
      username: image.properties['user.username']!,
    );

    for (final feature in features) {
      final instance = await _client.getInstance(name);
      await feature.init(client, instance, init);
    }

    final restart = await client.restartInstance(name);
    await client.waitOperation(restart.id);

    final context = init.copyWith(
      uid: await client.uid(name, init.username),
      gid: await client.gid(name, init.username),
    );

    for (final feature in features) {
      final dirs = feature.getDirectories(context);
      for (final dir in dirs) {
        await client.mkdir(name, dir);
      }

      final files = feature.getFiles(context);
      for (final file in files.entries) {
        await client.pushFile(name, path: file.key, data: file.value);
      }
    }

    final stop = await client.stopInstance(name);
    await client.waitOperation(stop.id);

    final instance = await _client.getInstance(name);
    final update = await _client.updateInstance(
      instance.copyWith(
        config: {
          ...instance.config,
          for (final feature in features) ...feature.getConfig(context),
        },
        devices: {
          ...instance.devices,
          for (final feature in features) ...feature.getDevices(context),
        },
      ),
    );
    await _client.waitOperation(update.id);
  }

  @override
  Future<LxdOperation> stopInstance(String name, {bool force = false}) {
    return _client.stopInstance(name, force: force);
  }

  @override
  Future<LxdOperation> deleteInstance(String name) {
    return _client.deleteInstance(name);
  }

  @override
  Stream<LxdOperation> watchInstance(String instance) {
    return _client
        .getEvents()
        .where((event) => event.isOperation)
        .map((event) => LxdOperation.fromJson(event.metadata!))
        .where((op) => op.instances?.contains(instance) == true);
  }

  @override
  Future<LxdOperation> getOperation(String id) => _client.getOperation(id);

  @override
  Stream<LxdOperation> watchOperation(String id) {
    return _client
        .getEvents()
        .where((event) => event.isOperation && event.metadata?['id'] == id)
        .map((event) => LxdOperation.fromJson(event.metadata!));
  }

  @override
  Future<LxdOperation> waitOperation(String id) => _client.waitOperation(id);

  @override
  Future<void> cancelOperation(String id) => _client.cancelOperation(id);

  Future<void> _updateInstances([LxdEvent? event]) async {
    final newInstances = await _client.getInstances();
    final newInstanceSet = Set.of(newInstances);
    final oldInstanceSet = Set.of(instances ?? const <String>[]);

    final added = newInstanceSet.difference(oldInstanceSet);
    for (final instance in added) {
      _added.add(instance);
    }

    final removed = oldInstanceSet.difference(newInstanceSet);
    for (final instance in removed) {
      _removed.add(instance);
    }

    if (event?.type == LxdEventType.operation) {
      final operation = event!.toOperation();
      _handleOperation(operation);
      final updated = operation.instances ?? [];
      for (final instance in updated) {
        final name = instance.split('/').last;
        if (!added.contains(name) &&
            !removed.contains(name) &&
            oldInstanceSet.contains(name)) {
          _updated.add(name);
        }
      }
    }

    _instances.add(newInstances);
  }

  void _handleOperation(LxdOperation operation) {
    void updateInstanceStatus(LxdStatusCode statusCode) {
      for (final instance in operation.instances!) {
        // override the status while an operation is pending/running
        if (operation.isPending || operation.isRunning) {
          _statuses[instance] = statusCode;
        } else {
          _statuses.remove(instance);
        }
      }
    }

    // see https://github.com/lxc/lxd/issues/10625
    switch (operation.description) {
      case 'Starting instance':
        updateInstanceStatus(LxdStatusCode.starting);
        break;
      case 'Restarting instance':
        // TODO: no such status code as "restarting"
        updateInstanceStatus(LxdStatusCode.starting);
        break;
      case 'Stopping instance':
        updateInstanceStatus(LxdStatusCode.stopping);
        break;
    }
  }
}
