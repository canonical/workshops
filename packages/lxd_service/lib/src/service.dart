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

  List<String>? get instances;
  Stream<List<String>> get instanceStream;

  Stream<String> get instanceAdded;
  Stream<String> get instanceRemoved;
  Stream<String> get instanceUpdated;

  Future<LxdInstance> getInstance(String name);
  Future<LxdInstanceState> getInstanceState(String name);
  Future<LxdOperation> createInstance(LxdImage image, {LxdRemote? remote});
  Future<LxdOperation> startInstance(String name, {bool force = false});
  Future<LxdOperation> restartInstance(String name,
      {bool force = false, Duration? timeout});
  Future<LxdOperation> stopInstance(String name,
      {bool force = false, Duration? timeout});
  Future<LxdOperation> deleteInstance(String name);
  Stream<LxdOperation> watchInstance(String instance);

  Future<LxdOperation?> initFeature(
      String name, LxdFeatureProvider feature, LxdImage image);
  Future<LxdImage> configureImage(String instance, LxdImage image);
  Future<void> configureFeature(
      String name, LxdFeatureProvider feature, LxdImage image);
  Future<LxdOperation> stageFeatures(
      String name, List<LxdFeatureProvider> features, LxdImage image);

  Future<bool> waitVmAgent(String name,
      {Duration? timeout, Duration? interval});

  Future<LxdTerminal> execTerminal(String name);

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
  final _statuses = <String, int>{};

  List<String>? get instances => _instances.valueOrNull;
  Stream<List<String>> get instanceStream => _instances.stream;

  Stream<String> get instanceAdded => _added.stream;
  Stream<String> get instanceRemoved => _removed.stream;
  Stream<String> get instanceUpdated => _updated.stream;

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
      log.debug(ev);
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
    final statusCode = _statuses[name];
    return statusCode != null
        ? instance.copyWith(statusCode: statusCode)
        : instance;
  }

  @override
  Future<LxdInstanceState> getInstanceState(String name) async {
    final state = await _client.getInstanceState(name);

    // check for status override from pending/running operations
    final statusCode = _statuses[name];
    return statusCode != null ? state.copyWith(statusCode: statusCode) : state;
  }

  @override
  Future<LxdOperation> createInstance(LxdImage image, {LxdRemote? remote}) {
    return _client.createInstance(
      name: image.name,
      source: image,
      server: remote?.isLocal == false ? remote!.address : null,
    );
  }

  @override
  Future<LxdOperation> startInstance(String name, {bool force = false}) {
    return _client.startInstance(name, force: force);
  }

  @override
  Future<LxdOperation> restartInstance(
    String name, {
    bool force = false,
    Duration? timeout,
  }) {
    return _client.restartInstance(name, force: force, timeout: timeout);
  }

  @override
  Future<LxdOperation?> initFeature(
      String name, LxdFeatureProvider feature, LxdImage image) async {
    final instance = await _client.getInstance(name);
    return feature.init(_client, instance, image);
  }

  @override
  Future<LxdImage> configureImage(String instance, LxdImage image) async {
    final username = image.properties['user.name']!;
    return image.copyWith(
      properties: {
        ...image.properties,
        'user.uid': await _client.uid(instance, username),
        'user.gid': await _client.gid(instance, username),
      },
    );
  }

  @override
  Future<void> configureFeature(
      String name, LxdFeatureProvider feature, LxdImage image) async {
    final dirs = feature.getDirectories(image);
    for (final dir in dirs) {
      await _client.mkdir(name, dir);
    }

    final files = feature.getFiles(image);
    for (final file in files.entries) {
      await _client.pushFile(name, path: file.key, data: file.value);
    }
  }

  @override
  Future<LxdOperation> stageFeatures(
      String name, List<LxdFeatureProvider> features, LxdImage image) async {
    final instance = await _client.getInstance(name);
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
    String name, {
    bool force = false,
    Duration? timeout,
  }) {
    return _client.stopInstance(name, force: force, timeout: timeout);
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

  /// Waits for the VM agent to be ready, which is a pre-requisite for executing
  /// commands on the VM. The VM agent is up and running when the instance state
  /// reports that there are any running processes.
  @override
  Future<bool> waitVmAgent(
    String name, {
    Duration? timeout,
    Duration? interval,
  }) async {
    interval ??= const Duration(seconds: 1);
    var future = Future.doWhile(() async {
      final state = await _client.getInstanceState(name);
      if (state.processes > 0) return false;
      return Future.delayed(interval!, () => true);
    });
    if (timeout != null) {
      future = future.timeout(timeout, onTimeout: () => false);
    }
    final result = await future;
    return result is bool ? result : true;
  }

  Future<LxdTerminal> execTerminal(String name) async {
    final instance = await _client.getInstance(name);
    final user = instance.config['user.name'] ?? 'root';
    final op = await _client.execInstance(
      instance.name,
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
    void updateInstanceStatus(int statusCode) {
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
