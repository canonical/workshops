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
}
