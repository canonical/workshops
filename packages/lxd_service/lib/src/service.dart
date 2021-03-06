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

  Future<LxdOperation> getOperation(String id);
  Stream<LxdOperation> getOperations(String id);
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

    final enabledFeatures = image.properties['features']?.split(',').toSet();
    bool hasFeature(LxdFeature feature) {
      return enabledFeatures?.contains(feature.name) == true;
    }

    for (final feature in LxdFeature.values.where(hasFeature)) {
      final instance = await _client.getInstance(name);
      await LxdFeature.create(feature, image).initInstance(client, instance);
    }
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
  Future<LxdOperation> getOperation(String id) => _client.getOperation(id);

  @override
  Stream<LxdOperation> getOperations(String id) {
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
