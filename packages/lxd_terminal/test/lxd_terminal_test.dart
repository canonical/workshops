import 'dart:async';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:lxd/lxd.dart';
import 'package:lxd_terminal/lxd_terminal.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'lxd_terminal_test.mocks.dart';

@GenerateMocks([LxdClient, LxdInstance, LxdOperation, WebSocket])
void main() {
  test('execute', () async {
    final instance = MockLxdInstance();
    when(instance.name).thenReturn('mine');
    when(instance.config).thenReturn({'user.name': 'me'});

    final exec = MockLxdOperation();
    when(exec.id).thenReturn('x');
    when(exec.metadata).thenReturn({
      'fds': {
        '0': 'fd0',
        'control': 'fdc',
      }
    });

    final wait = MockLxdOperation();
    when(wait.id).thenReturn('w');

    final client = MockLxdClient();
    when(client.execInstance(
      'mine',
      command: ['login', '-f', 'me'],
      environment: {'TERM': 'xterm-256color'},
      interactive: true,
      waitForWebSocket: true,
    )).thenAnswer((_) async => exec);

    final completer = Completer<LxdOperation>();
    when(client.waitOperation('x')).thenAnswer((_) => completer.future);

    final controller = StreamController<dynamic>(sync: true);

    final ws0 = MockWebSocket();
    when(client.getOperationWebSocket('x', 'fd0')).thenAnswer((_) async => ws0);
    when(ws0.listen(any)).thenAnswer((i) => controller.stream
        .listen(i.positionalArguments.first as void Function(dynamic)));
    when(ws0.close()).thenAnswer((_) => controller.close());

    final wsc = MockWebSocket();
    when(client.getOperationWebSocket('x', 'fdc')).thenAnswer((_) async => wsc);
    when(wsc.close()).thenAnswer((_) async {});

    final terminal = TestLxdTerminal(client, maxLines: 123);
    final result = terminal.execute(instance);

    await untilCalled(client.waitOperation('x'));

    verify(client.execInstance(
      'mine',
      command: ['login', '-f', 'me'],
      environment: {'TERM': 'xterm-256color'},
      interactive: true,
      waitForWebSocket: true,
    )).called(1);

    verify(client.getOperationWebSocket('x', 'fd0')).called(1);
    verify(client.getOperationWebSocket('x', 'fdc')).called(1);

    controller.add('bytes'.codeUnits);
    expect(terminal.written, ['bytes']);

    controller.add('string');
    expect(terminal.written, ['bytes', 'string\r\n']);

    controller.add('');
    expect(terminal.written, ['bytes', 'string\r\n']);

    await untilCalled(ws0.close());
    await untilCalled(wsc.close());

    completer.complete(wait);

    await expectLater(result, completes);
  });
}

class TestLxdTerminal extends LxdTerminal {
  TestLxdTerminal(super.client, {required super.maxLines});

  final written = <String>[];

  @override
  void write(String data) => written.add(data);
}
