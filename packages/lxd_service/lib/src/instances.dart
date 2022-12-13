import 'dart:async';

import 'package:lxd/lxd.dart';
import 'package:lxd_x/lxd_x.dart';
import 'package:rxdart/rxdart.dart';

import 'log.dart';

mixin LxdInstanceService on LxdClient {
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

  Future<void> init() async {
    _instances.add(await getInstances());

    // process ongoing operations to see if instances being started or stopped
    final allIds = await getOperations();
    for (final ids in allIds.values) {
      for (final id in ids) {
        final operation = await getOperation(id);
        _handleOperation(operation);
      }
    }

    // listen to all operation events that affect instances
    _events ??= getEvents(types: {LxdEventType.operation}).where((ev) {
      log.debug(ev);
      return ev.toOperation().getInstances()?.isNotEmpty == true;
    }).listen(_updateInstances);
  }

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
    final instance = await super.getInstance(id);

    // check for status override from pending/running operations
    final statusCode = _statuses[id];
    return statusCode != null
        ? instance.copyWith(statusCode: statusCode)
        : instance;
  }

  @override
  Future<LxdInstanceState> getInstanceState(LxdInstanceId id) async {
    final state = await super.getInstanceState(id);

    // check for status override from pending/running operations
    final statusCode = _statuses[id];
    return statusCode != null ? state.copyWith(statusCode: statusCode) : state;
  }

  Future<LxdOperation> updateInstanceConfig(
      LxdInstanceId id, Map<String, String> config) async {
    final instance = await getInstance(id);
    return super.updateInstance(instance.copyWith(config: config));
  }

  Future<void> _updateInstances([LxdEvent? event]) async {
    final newInstances = await getInstances();
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
      _handleOperation(operation);
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
