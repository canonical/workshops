import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:collection/collection.dart';
import 'package:lxd/lxd.dart';
import 'package:lxd_x/lxd_x.dart';
import 'package:rxdart/rxdart.dart';
import 'package:stdlibc/stdlibc.dart';

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
  Future<LxdInstance> getInstance(String name) => _client.getInstance(name);

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
    final username = Platform.environment['USERNAME'];
    if (username != null) {
      final start = await _client.startInstance(name);
      await _client.waitOperation(start.id);

      // sudo vs. wheel
      final group =
          await _client.pullFile(name, path: '/etc/group').then((data) {
        return data
            .split('\n')
            .firstWhereOrNull(
                (line) => line.startsWith('sudo:') || line.startsWith('wheel:'))
            ?.split(':')
            .firstOrNull;
      });

      // useradd
      final shell = Platform.environment['SHELL'];
      final useradd = await _client.execInstance(name, command: [
        'useradd',
        '--create-home',
        if (group != null) '--groups=$group',
        if (shell != null) '--shell=$shell',
        username,
      ]);
      await _client.waitOperation(useradd.id);

      // sudoers
      await _client
          .pushFile(name, path: '/etc/sudoers.d/90-lxd-toolbox', data: '''
# Created by LXD Toolbox on ${DateTime.now().toIso8601String()}

$username ALL=(ALL) NOPASSWD:ALL
Defaults:$username env_keep += \"LXD_DIR\"
''');

      // idmap
      final instance = await _client.getInstance(name);
      final uid = await _runCommand(name, ['id', '-u', username]);
      final gid = await _runCommand(name, ['id', '-g', username]);
      final config = <String, dynamic>{
        ...instance.config,
        'raw.idmap': '''
uid ${getuid()} $uid
gid ${getgid()} $gid
''',
      };

      // devices
      final devices = <String, dynamic>{
        ...instance.devices,
        ...jsonDecode(image.properties['devices'] as String)
            as Map<String, dynamic>,
      };
      final update = await _client
          .updateInstance(instance.copyWith(config: config, devices: devices));
      await _client.waitOperation(update.id);

      // restart
      final stop = await _client.stopInstance(name);
      await _client.waitOperation(stop.id);
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

    if (event != null) {
      final updated = event.toOperation().instances ?? [];
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

  Future<String> _runCommand(String instance, List<String> command) async {
    final exec = await _client.execInstance(
      instance,
      command: command,
      interactive: true,
      waitForWebSocket: true,
    );

    final fdc = exec.metadata!['fds']['control'] as String;
    final wsc = await _client.getOperationWebSocket(exec.id, fdc);

    final fd0 = exec.metadata!['fds']['0'] as String;
    final ws0 = await _client.getOperationWebSocket(exec.id, fd0);

    final controller = StreamController<String>();
    ws0.listen((data) {
      if (data is List<int>) {
        controller.add(utf8.decode(data));
      } else if (data == '') {
        ws0.close();
        wsc.close();
        controller.close();
      }
    });

    await waitOperation(exec.id);
    return controller.stream.join().then((value) => value.trim());
  }
}
