import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:lxd/lxd.dart';
import 'package:lxd_service/lxd_service.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:workshops/terminal/terminal_manager.dart';
import 'package:workshops/terminal/terminal_model.dart';

import 'terminal_manager_test.mocks.dart';

@GenerateMocks([LxdService, LxdTerminal])
void main() {
  test('life-cycle', () async {
    final key = Object();
    final instance = testInstance(name: 'test');

    final start = testOperation(id: 'start');
    final exec = testOperation(id: 'exec');
    final completer = Completer<LxdOperation>();
    final lxd = MockLxdTerminal();
    when(lxd.id).thenReturn(exec.id);

    final service = MockLxdService();
    when(service.startInstance(instance.name)).thenAnswer((_) async => start);
    when(service.waitOperation(start.id)).thenAnswer((_) async => start);
    when(service.execTerminal(instance.name)).thenAnswer((_) async => lxd);
    when(service.waitOperation(exec.id)).thenAnswer((_) => completer.future);

    final manager = TerminalManager(service);

    final created = Completer<TerminalModel>();
    final closed = Completer<TerminalModel>();

    manager.listen(
      onCreate: (k, terminal) {
        expect(k, key);
        expect(terminal.state, TerminalState.none);
        created.complete(terminal);
      },
      onClose: (k, terminal) {
        expect(k, key);
        expect(terminal.state, TerminalState.running);
        closed.complete(terminal);
      },
    );

    final model = manager.get(key, instance);
    expect(await created.future, model);

    await untilCalled(service.waitOperation(exec.id));
    completer.complete(exec);

    expect(await closed.future, model);

    await manager.dispose();
    expect(model.isDisposed, isTrue);
  });
}

LxdInstance testInstance({
  required String name,
  int? statusCode,
  Map<String, String>? config,
}) {
  return LxdInstance(
    architecture: 'amd64',
    config: config ?? {},
    createdAt: DateTime.now(),
    description: '',
    devices: {},
    ephemeral: false,
    expandedConfig: {},
    expandedDevices: {},
    lastUsedAt: DateTime.now(),
    location: '',
    name: name,
    profiles: [],
    project: '',
    restore: '',
    stateful: false,
    status: '',
    statusCode: statusCode ?? LxdStatusCode.stopped,
    type: LxdInstanceType.container,
  );
}

LxdOperation testOperation({
  String? description,
  String? id,
  List<String>? instances,
  int? statusCode,
  Map<String, dynamic>? metadata,
}) {
  return LxdOperation(
    createdAt: DateTime.now(),
    description: description ?? '',
    error: '',
    id: id ?? '',
    location: '',
    mayCancel: false,
    metadata: metadata,
    resources: {'instances': instances ?? []},
    status: '',
    statusCode: statusCode ?? 200,
    type: LxdOperationType.task,
    updatedAt: DateTime.now(),
  );
}
