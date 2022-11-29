import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:lxd/lxd.dart';
import 'package:lxd_service/lxd_service.dart';
import 'package:lxd_test/lxd_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import 'lxd_service_test.mocks.dart';

const fooId = LxdInstanceId('foo');
const barId = LxdInstanceId('bar');
const bazId = LxdInstanceId('baz');

@GenerateMocks([LxdClient, WebSocket])
void main() {
  test('init', () async {
    final client = MockLxdClient();
    final events = StreamController<LxdEvent>();
    when(client.getEvents(types: {LxdEventType.operation}))
        .thenAnswer((_) => events.stream);
    when(client.getInstances()).thenAnswer((_) async => [fooId]);
    when(client.getOperations()).thenAnswer((_) async => {
          'running': ['op']
        });
    when(client.getOperation('op')).thenAnswer((_) async =>
        testOperation(id: 'op', statusCode: LxdStatusCode.running));

    final service = LxdService(client);
    expect(service.instances, isNull);

    await service.init();
    verify(client.getEvents(types: {LxdEventType.operation})).called(1);
    verify(client.getInstances()).called(1);
    verify(client.getOperations()).called(1);
    verify(client.getOperation('op')).called(1);

    expect(service.instances, [fooId]);
    expect(service.instanceStream, emits([fooId]));

    expect(service.instanceAdded, neverEmits(anything));
    expect(service.instanceRemoved, neverEmits(anything));
    expect(service.instanceUpdated, neverEmits(anything));

    await service.dispose();
  });

  test('create instance', () async {
    final image = testImage(fingerprint: 'f', properties: {'name': 'foo'});
    const lxd = LxdRemote(name: 'r', address: 'lxd', protocol: 'lxd');
    const ss = LxdRemote(name: 'r', address: 'ss', protocol: 'simplestreams');

    final op = testOperation();
    final client = MockLxdClient();
    when(client.createInstance(
            name: 'foo', source: image, server: anyNamed('server')))
        .thenAnswer((_) async => op);

    final service = LxdService(client);

    await service.createInstance(image);
    verify(client.createInstance(name: 'foo', source: image, server: null))
        .called(1);

    await service.createInstance(image, remote: lxd);
    verify(client.createInstance(name: 'foo', source: image, server: null))
        .called(1);

    await service.createInstance(image, remote: ss);
    verify(client.createInstance(name: 'foo', source: image, server: 'ss'))
        .called(1);
  });

  test('start instance', () async {
    final op = testOperation();
    final client = MockLxdClient();
    when(client.startInstance(fooId, force: anyNamed('force')))
        .thenAnswer((_) async => op);

    final service = LxdService(client);

    await service.startInstance(fooId);
    verify(client.startInstance(fooId, force: false)).called(1);

    await service.startInstance(fooId, force: false);
    verify(client.startInstance(fooId, force: false)).called(1);

    await service.startInstance(fooId, force: true);
    verify(client.startInstance(fooId, force: true)).called(1);
  });

  test('restart instance', () async {
    final op = testOperation();
    final client = MockLxdClient();
    when(client.restartInstance(fooId,
            force: anyNamed('force'), timeout: anyNamed('timeout')))
        .thenAnswer((_) async => op);

    final service = LxdService(client);

    await service.restartInstance(fooId);
    verify(client.restartInstance(fooId, force: false, timeout: null))
        .called(1);

    await service.restartInstance(fooId, force: true);
    verify(client.restartInstance(fooId, force: true, timeout: null)).called(1);

    await service.restartInstance(fooId, force: false, timeout: Duration.zero);
    verify(client.restartInstance(fooId, force: false, timeout: Duration.zero))
        .called(1);
  });

  test('stop instance', () async {
    final op = testOperation();
    final client = MockLxdClient();
    when(client.stopInstance(fooId,
            force: anyNamed('force'), timeout: anyNamed('timeout')))
        .thenAnswer((_) async => op);

    final service = LxdService(client);

    await service.stopInstance(fooId);
    verify(client.stopInstance(fooId, force: false, timeout: null)).called(1);

    await service.stopInstance(fooId, force: true);
    verify(client.stopInstance(fooId, force: true, timeout: null)).called(1);

    await service.stopInstance(fooId, force: false, timeout: Duration.zero);
    verify(client.stopInstance(fooId, force: false, timeout: Duration.zero))
        .called(1);
  });

  test('delete instance', () async {
    final op = testOperation();
    final client = MockLxdClient();
    when(client.deleteInstance(fooId)).thenAnswer((_) async => op);

    final service = LxdService(client);

    await service.deleteInstance(fooId);
    verify(client.deleteInstance(fooId)).called(1);
  });

  test('instance added', () async {
    final client = MockLxdClient();
    final events = StreamController<LxdEvent>();
    when(client.getEvents(types: {LxdEventType.operation}))
        .thenAnswer((_) => events.stream);
    when(client.getInstances()).thenAnswer((_) async => [fooId]);
    when(client.getOperations()).thenAnswer((_) async => {});

    final service = LxdService(client);
    await service.init();

    when(client.getInstances()).thenAnswer((_) async => [fooId, barId]);

    events.add(LxdEvent(
      type: LxdEventType.operation,
      metadata: testOperation(instances: ['bar']).toJson(),
      timestamp: DateTime.now(),
    ));

    await expectLater(service.instanceAdded, emits(barId));
    expect(service.instanceRemoved, neverEmits(anything));
    expect(service.instanceUpdated, neverEmits(anything));

    expect(service.instances, [fooId, barId]);
    expect(service.instanceStream, emits([fooId, barId]));

    await service.dispose();
  });

  test('instance removed', () async {
    final client = MockLxdClient();
    final events = StreamController<LxdEvent>();
    when(client.getEvents(types: {LxdEventType.operation}))
        .thenAnswer((_) => events.stream);
    when(client.getInstances()).thenAnswer((_) async => [fooId, barId]);
    when(client.getOperations()).thenAnswer((_) async => {});

    final service = LxdService(client);
    await service.init();

    when(client.getInstances()).thenAnswer((_) async => [barId]);

    events.add(LxdEvent(
      type: LxdEventType.operation,
      metadata: testOperation(instances: ['foo']).toJson(),
      timestamp: DateTime.now(),
    ));

    expect(service.instanceAdded, neverEmits(anything));
    await expectLater(service.instanceRemoved, emits(fooId));
    expect(service.instanceUpdated, neverEmits(anything));

    expect(service.instances, [barId]);
    expect(service.instanceStream, emits([barId]));

    await service.dispose();
  });

  test('intance updated', () async {
    final client = MockLxdClient();
    final events = StreamController<LxdEvent>();
    when(client.getEvents(types: {LxdEventType.operation}))
        .thenAnswer((_) => events.stream);
    when(client.getInstances()).thenAnswer((_) async => [fooId, barId, bazId]);
    when(client.getOperations()).thenAnswer((_) async => {});

    final service = LxdService(client);
    await service.init();

    events.add(LxdEvent(
      type: LxdEventType.operation,
      metadata: testOperation(instances: ['bar']).toJson(),
      timestamp: DateTime.now(),
    ));

    expect(service.instanceAdded, neverEmits(anything));
    expect(service.instanceRemoved, neverEmits(anything));
    await expectLater(service.instanceUpdated, emits(barId));

    expect(service.instances, [fooId, barId, bazId]);
    expect(service.instanceStream, emits([fooId, barId, bazId]));

    await service.dispose();
  });

  test('instance status', () async {
    final foo = testInstance(id: fooId);
    final bar = testInstance(id: barId);
    final baz = testInstance(id: bazId);

    final starting = testOperation(
      id: 'p',
      description: 'Starting instance',
      statusCode: LxdStatusCode.pending,
      instances: ['foo'],
    );
    final stopping = testOperation(
      id: 'r',
      description: 'Stopping instance',
      statusCode: LxdStatusCode.running,
      instances: ['bar'],
    );
    final restarting = testOperation(
      id: 's',
      description: 'Restarting instance',
      statusCode: LxdStatusCode.success,
      instances: ['baz'],
    );

    final client = MockLxdClient();
    final events = StreamController<LxdEvent>();
    when(client.getEvents(types: {LxdEventType.operation}))
        .thenAnswer((_) => events.stream);
    when(client.getInstances()).thenAnswer((_) async => [fooId, barId, bazId]);
    when(client.getInstance(fooId)).thenAnswer((_) async => foo);
    when(client.getInstance(barId)).thenAnswer((_) async => bar);
    when(client.getInstance(bazId)).thenAnswer((_) async => baz);
    when(client.getOperations()).thenAnswer((_) async => {
          'pending': ['p'],
          'running': ['r'],
          'success': ['s'],
        });
    when(client.getOperation('p')).thenAnswer((_) async => starting);
    when(client.getOperation('r')).thenAnswer((_) async => stopping);
    when(client.getOperation('s')).thenAnswer((_) async => restarting);

    final service = LxdService(client);
    await service.init();

    events.add(LxdEvent(
      type: LxdEventType.operation,
      metadata: starting.toJson(),
      timestamp: DateTime.now(),
    ));

    await expectLater(service.instanceUpdated, emits(fooId));

    expect(await service.getInstance(fooId),
        foo.copyWith(statusCode: LxdStatusCode.starting));
    expect(await service.getInstance(barId),
        bar.copyWith(statusCode: LxdStatusCode.stopping));
    expect(await service.getInstance(bazId),
        baz.copyWith(statusCode: LxdStatusCode.stopped));

    await service.dispose();
  });

  test('watch instance', () async {
    final client = MockLxdClient();
    final events = StreamController<LxdEvent>();
    when(client.getEvents()).thenAnswer((_) => events.stream);

    final service = LxdService(client);
    final stream = service.watchInstance(fooId);

    final foo = testOperation(id: 'f', instances: ['foo']);
    final bar = testOperation(id: 'b', instances: ['bar']);

    stream.listen(
      expectAsync1((value) => expect(value, foo), count: 1),
    );

    events.add(LxdEvent(
      type: LxdEventType.operation,
      metadata: foo.toJson(),
      timestamp: DateTime.now(),
    ));

    events.add(LxdEvent(
      type: LxdEventType.operation,
      metadata: bar.toJson(),
      timestamp: DateTime.now(),
    ));
  });

  test('get operation', () async {
    final op = testOperation();
    final client = MockLxdClient();
    when(client.getOperation('foo')).thenAnswer((_) async => op);

    final service = LxdService(client);

    expect(await service.getOperation('foo'), op);
    verify(client.getOperation('foo')).called(1);

    expect(await service.getOperation('foo'), op);
  });

  test('watch operation', () async {
    final client = MockLxdClient();
    final events = StreamController<LxdEvent>();
    when(client.getEvents()).thenAnswer((_) => events.stream);

    final service = LxdService(client);
    final stream = service.watchOperation('foo');

    final foo = testOperation(id: 'foo');
    final bar = testOperation(id: 'bar');

    stream.listen(
      expectAsync1((value) => expect(value, foo), count: 1),
    );

    events.add(LxdEvent(
      type: LxdEventType.operation,
      metadata: foo.toJson(),
      timestamp: DateTime.now(),
    ));

    events.add(LxdEvent(
      type: LxdEventType.operation,
      metadata: bar.toJson(),
      timestamp: DateTime.now(),
    ));
  });

  test('wait operation', () async {
    final op = testOperation();
    final client = MockLxdClient();
    when(client.waitOperation('foo')).thenAnswer((_) async => op);

    final service = LxdService(client);

    expect(await service.waitOperation('foo'), op);
    verify(client.waitOperation('foo')).called(1);
  });

  test('cancel operation', () async {
    final op = testOperation();
    final client = MockLxdClient();
    when(client.cancelOperation('foo')).thenAnswer((_) async => op);

    final service = LxdService(client);

    await service.cancelOperation('foo');
    verify(client.cancelOperation('foo')).called(1);
  });

  test('wait vm agent', () async {
    const state0 = LxdInstanceState(
        status: LxdInstanceStatus.running, statusCode: 0, pid: 0);
    const state1 = LxdInstanceState(
        status: LxdInstanceStatus.running, statusCode: 0, pid: 0, processes: 1);

    final client = MockLxdClient();
    when(client.getInstanceState(fooId)).thenAnswer((_) async => state0);

    final service = LxdService(client);
    expect(await service.waitVmAgent(fooId, timeout: Duration.zero), isFalse);

    when(client.getInstanceState(fooId)).thenAnswer((_) async => state1);
    expect(await service.waitVmAgent(fooId, timeout: Duration.zero), isTrue);
  });

  test('exec terminal', () async {
    final instance = testInstance(id: fooId, config: {'user.name': 'me'});

    final exec = testOperation(id: 'x', metadata: {
      'fds': {
        '0': 'fd0',
        'control': 'fdc',
      }
    });

    final client = MockLxdClient();
    when(client.getInstance(fooId)).thenAnswer((_) async => instance);
    when(client.execInstance(
      fooId,
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

    final service = LxdService(client);

    final terminal = await service.execTerminal(fooId);
    expect(terminal.operation, exec);
    expect(terminal.id, exec.id);

    terminal.resize(123, 456);
    verify(wsc.add(jsonEncode({
      'command': 'window-resize',
      'args': {'width': '123', 'height': '456'},
    }))).called(1);

    terminal.write('data');
    verify(ws0.add(utf8.encode('data'))).called(1);

    final received = <String>[];
    terminal.listen(received.add);

    verify(client.getInstance(fooId)).called(1);
    verify(client.execInstance(
      fooId,
      command: ['login', '-f', 'me'],
      environment: {'TERM': 'xterm-256color'},
      interactive: true,
      waitForWebSocket: true,
    )).called(1);

    verify(client.getOperationWebSocket('x', 'fd0')).called(1);
    verify(client.getOperationWebSocket('x', 'fdc')).called(1);

    controller.add('bytes'.codeUnits);
    expect(received, ['bytes']);

    controller.add('string');
    expect(received, ['bytes', 'string\r\n']);

    controller.add('');
    expect(received, ['bytes', 'string\r\n']);

    await untilCalled(ws0.close());
    await untilCalled(wsc.close());
  });

  test('close terminal', () async {
    final wsc = MockWebSocket();
    when(wsc.close()).thenAnswer((_) async {});

    final ws0 = MockWebSocket();
    when(ws0.close()).thenAnswer((_) async {});

    final terminal = await LxdTerminal(testOperation(), wsc, ws0);

    await terminal.close();
    verify(wsc.close()).called(1);
    verify(ws0.close()).called(1);

    await expectLater(terminal.close(), completes);
    verifyNever(wsc.close());
    verifyNever(ws0.close());
  });
}
