import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:lxd/lxd.dart';
import 'package:lxd_x/lxd_x.dart';
import 'package:meta/meta.dart';
import 'package:rxdart/rxdart.dart';
import 'package:ubuntu_logger/ubuntu_logger.dart';

import 'features.dart';
import 'remote.dart';

final log = Logger('lxd_service');

abstract class LxdService {
  factory LxdService(LxdClient client) => _LxdService(client);

  Future<void> init();
  Future<void> dispose();

  List<LxdInstanceId>? get instances;
  Stream<List<LxdInstanceId>> get instanceStream;

  Stream<LxdInstanceId> get instanceAdded;
  Stream<LxdInstanceId> get instanceRemoved;
  Stream<LxdInstanceId> get instanceUpdated;

  Future<LxdInstance> getInstance(LxdInstanceId id);
  Future<LxdInstanceState> getInstanceState(LxdInstanceId id);
  Future<LxdOperation> createInstance(LxdImage image, {LxdRemote? remote});
  Future<LxdOperation> startInstance(LxdInstanceId id, {bool force = false});
  Future<LxdOperation> restartInstance(LxdInstanceId id,
      {bool force = false, Duration? timeout});
  Future<LxdOperation> stopInstance(LxdInstanceId id,
      {bool force = false, Duration? timeout});
  Future<LxdOperation> deleteInstance(LxdInstanceId id);
  Stream<LxdOperation> watchInstance(LxdInstanceId id);

  Future<List<String>> getProjects();

  Future<LxdOperation?> initFeature(
      LxdInstanceId id, LxdFeatureProvider feature, LxdImage image);
  Future<LxdImage> configureImage(LxdInstanceId id, LxdImage image);
  Future<void> configureFeature(
      LxdInstanceId id, LxdFeatureProvider feature, LxdImage image);
  Future<LxdOperation> stageFeatures(
      LxdInstanceId id, List<LxdFeatureProvider> features, LxdImage image);

  Future<bool> waitVmAgent(LxdInstanceId id,
      {Duration? timeout, Duration? interval});

  Future<LxdTerminal> execTerminal(LxdInstanceId id);

  Future<LxdOperation> getOperation(String id);
  Stream<LxdOperation> watchOperation(String id);
  Future<LxdOperation> waitOperation(String id);
  Future<void> cancelOperation(String id);
}

class _LxdService implements LxdService {
  _LxdService(this._client);

  final LxdClient _client;
  StreamSubscription? _events;
  final _instances = BehaviorSubject<List<LxdInstanceId>>();
  final _added = StreamController<LxdInstanceId>.broadcast();
  final _removed = StreamController<LxdInstanceId>.broadcast();
  final _updated = StreamController<LxdInstanceId>.broadcast();
  final _statuses = <LxdInstanceId, int>{};

  List<LxdInstanceId>? get instances => _instances.valueOrNull;
  Stream<List<LxdInstanceId>> get instanceStream => _instances.stream;

  Stream<LxdInstanceId> get instanceAdded => _added.stream;
  Stream<LxdInstanceId> get instanceRemoved => _removed.stream;
  Stream<LxdInstanceId> get instanceUpdated => _updated.stream;

  @override
  Future<void> init() async {
    _instances.add(await _client.getAllInstances());

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
      log.debug(ev);
      return ev.toOperation().getInstances()?.isNotEmpty == true;
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
  Future<LxdInstance> getInstance(LxdInstanceId id) async {
    final instance = await _client.getInstance(id);

    // check for status override from pending/running operations
    final statusCode = _statuses[id];
    return statusCode != null
        ? instance.copyWith(statusCode: statusCode)
        : instance;
  }

  @override
  Future<LxdInstanceState> getInstanceState(LxdInstanceId id) async {
    final state = await _client.getInstanceState(id);

    // check for status override from pending/running operations
    final statusCode = _statuses[id];
    return statusCode != null ? state.copyWith(statusCode: statusCode) : state;
  }

  @override
  Future<List<String>> getProjects() => _client.getProjects();

  @override
  Future<LxdOperation> createInstance(LxdImage image, {LxdRemote? remote}) {
    return _client.createInstance(
      name: image.name,
      project: image.project,
      source: image,
      server: remote?.isLocal == false ? remote!.address : null,
    );
  }

  @override
  Future<LxdOperation> startInstance(LxdInstanceId id, {bool force = false}) {
    return _client.startInstance(id, force: force);
  }

  @override
  Future<LxdOperation> restartInstance(
    LxdInstanceId id, {
    bool force = false,
    Duration? timeout,
  }) {
    return _client.restartInstance(id, force: force, timeout: timeout);
  }

  @override
  Future<LxdOperation?> initFeature(
      LxdInstanceId id, LxdFeatureProvider feature, LxdImage image) async {
    final instance = await _client.getInstance(id);
    return feature.init(_client, instance, image);
  }

  @override
  Future<LxdImage> configureImage(LxdInstanceId id, LxdImage image) async {
    final username = image.properties['user.name']!;
    return image.copyWith(
      properties: {
        ...image.properties,
        'user.uid': await _client.uid(id, username),
        'user.gid': await _client.gid(id, username),
      },
    );
  }

  @override
  Future<void> configureFeature(
      LxdInstanceId id, LxdFeatureProvider feature, LxdImage image) async {
    final dirs = feature.getDirectories(image);
    for (final dir in dirs) {
      await _client.mkdir(id, dir);
    }

    final files = feature.getFiles(image);
    for (final file in files.entries) {
      await _client.pushFile(id, path: file.key, data: file.value);
    }
  }

  @override
  Future<LxdOperation> stageFeatures(LxdInstanceId id,
      List<LxdFeatureProvider> features, LxdImage image) async {
    final instance = await _client.getInstance(id);
    return _client.updateInstance(
      instance.copyWith(
        config: {
          ...instance.config,
          for (final feature in features) ...feature.getConfig(image),
        },
        devices: {
          ...instance.devices,
          for (final feature in features) ...feature.getDevices(image),
        },
      ),
    );
  }

  @override
  Future<LxdOperation> stopInstance(
    LxdInstanceId id, {
    bool force = false,
    Duration? timeout,
  }) {
    return _client.stopInstance(id, force: force, timeout: timeout);
  }

  @override
  Future<LxdOperation> deleteInstance(LxdInstanceId id) {
    return _client.deleteInstance(id);
  }

  @override
  Stream<LxdOperation> watchInstance(LxdInstanceId id) {
    return _client
        .getEvents(project: id.project)
        .where((event) => event.isOperation)
        .map((event) => LxdOperation.fromJson(event.metadata!))
        .where(
            (op) => op.getInstances(project: id.project)?.contains(id) == true);
  }

  /// Waits for the VM agent to be ready, which is a pre-requisite for executing
  /// commands on the VM. The VM agent is up and running when the instance state
  /// reports that there are any running processes.
  @override
  Future<bool> waitVmAgent(
    LxdInstanceId id, {
    Duration? timeout,
    Duration? interval,
  }) async {
    interval ??= const Duration(seconds: 1);
    var future = Future.doWhile(() async {
      final state = await _client.getInstanceState(id);
      if (state.processes > 0) return false;
      return Future.delayed(interval!, () => true);
    });
    if (timeout != null) {
      future = future.timeout(timeout, onTimeout: () => false);
    }
    final result = await future;
    return result is bool ? result : true;
  }

  Future<LxdTerminal> execTerminal(LxdInstanceId id) async {
    final instance = await _client.getInstance(id);
    final user = instance.config['user.name'] ?? 'root';
    final op = await _client.execInstance(
      instance.id,
      command: ['login', '-f', user],
      environment: {'TERM': 'xterm-256color'},
      interactive: true,
      waitForWebSocket: true,
    );

    Future<WebSocket> getWebSocket(String id) {
      final fd = op.metadata!['fds'][id] as String;
      return _client.getOperationWebSocket(op.id, fd);
    }

    final wsc = await getWebSocket('control');
    final ws0 = await getWebSocket('0');
    return LxdTerminal(op, wsc, ws0);
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
    final newInstances = await _client.getAllInstances();
    final newInstanceSet = Set.of(newInstances);
    final oldInstanceSet = Set.of(instances ?? const <LxdInstanceId>[]);

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
      _handleOperation(operation, project: event.project);
      final updated = operation.getInstances(project: event.project) ?? [];
      for (final instance in updated) {
        if (!added.contains(instance) &&
            !removed.contains(instance) &&
            oldInstanceSet.contains(instance)) {
          _updated.add(instance);
        }
      }
    }

    _instances.add(newInstances);
  }

  void _handleOperation(LxdOperation operation, {String? project}) {
    void updateInstanceStatus(int statusCode) {
      for (final instance in operation.getInstances(project: project)!) {
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

class LxdTerminal {
  @visibleForTesting
  LxdTerminal(this._op, this._wsc, this._ws0);

  final LxdOperation _op;
  WebSocket? _ws0;
  WebSocket? _wsc;
  StreamSubscription? _sub;

  String get id => _op.id;
  LxdOperation get operation => _op;

  void write(String data) => _ws0?.add(utf8.encode(data));

  void listen(void Function(String data) onData) {
    _sub = _ws0!.listen((data) async {
      if (data is List<int>) {
        onData(utf8.decode(data));
      } else if (data is String) {
        if (data.isEmpty) {
          // TODO: proper way to detect exit
          await close();
        } else {
          onData('$data\r\n');
        }
      } else {
        throw UnsupportedError('$data');
      }
    });
  }

  void resize(int width, int height) => _wsc?.sendTermSize(width, height);

  Future<void> close() async {
    await _sub?.cancel();
    await _ws0?.close();
    await _wsc?.close();
    _sub = null;
    _ws0 = null;
    _wsc = null;
  }
}
