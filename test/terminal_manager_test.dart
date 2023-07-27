import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:lxd/lxd.dart';
import 'package:lxd_service/lxd_service.dart';
import 'package:lxd_test/lxd_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:workshops/terminal/terminal_manager.dart';
import 'package:workshops/terminal/terminal_model.dart';

import 'terminal_manager_test.mocks.dart';

@GenerateMocks([LxdService, LxdTerminal])
void main() {
  test('life-cycle', () async {
    final key = Object();
    final instance = testInstance(id: const LxdInstanceId('test'));

    final start = testOperation(id: 'start');
    final exec = testOperation(id: 'exec');
    final completer = Completer<LxdOperation>();
    final lxd = MockLxdTerminal();
    when(lxd.id).thenReturn(exec.id);

    final service = MockLxdService();
    when(service.getInstance(instance.id)).thenAnswer((_) async => instance);
    when(service.startInstance(instance.id)).thenAnswer((_) async => start);
    when(service.waitOperation(start.id)).thenAnswer((_) async => start);
    when(service.execTerminal(instance.id)).thenAnswer((_) async => lxd);
    when(service.waitOperation(exec.id)).thenAnswer((_) => completer.future);
    when(service.waitVmAgent(instance.id)).thenAnswer((_) async => true);

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
