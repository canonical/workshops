import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:lxd/lxd.dart';
import 'package:lxd_service/lxd_service.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import 'lxd_service_test.mocks.dart';

@GenerateMocks([LxdClient, WebSocket])
void main() {
  test('init', () async {
    final client = MockLxdClient();
    final events = StreamController<LxdEvent>();
    when(client.getEvents(types: {LxdEventType.operation}))
        .thenAnswer((_) => events.stream);
    when(client.getInstances()).thenAnswer((_) async => ['foo']);
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

    expect(service.instances, ['foo']);
    expect(service.instanceStream, emits(['foo']));

    expect(service.instanceAdded, neverEmits(anything));
    expect(service.instanceRemoved, neverEmits(anything));
    expect(service.instanceUpdated, neverEmits(anything));

    await service.dispose();
  });

  test('add', () async {
    final client = MockLxdClient();
    final events = StreamController<LxdEvent>();
    when(client.getEvents(types: {LxdEventType.operation}))
        .thenAnswer((_) => events.stream);
    when(client.getInstances()).thenAnswer((_) async => ['foo']);
    when(client.getOperations()).thenAnswer((_) async => {});

    final service = LxdService(client);
    await service.init();

    when(client.getInstances()).thenAnswer((_) async => ['foo', 'bar']);

    events.add(LxdEvent(
      type: LxdEventType.operation,
      metadata: testOperation(instances: ['bar']).toJson(),
      timestamp: DateTime.now(),
    ));

    await expectLater(service.instanceAdded, emits('bar'));
    expect(service.instanceRemoved, neverEmits(anything));
    expect(service.instanceUpdated, neverEmits(anything));

    expect(service.instances, ['foo', 'bar']);
    expect(service.instanceStream, emits(['foo', 'bar']));

    await service.dispose();
  });

  test('remove', () async {
    final client = MockLxdClient();
    final events = StreamController<LxdEvent>();
    when(client.getEvents(types: {LxdEventType.operation}))
        .thenAnswer((_) => events.stream);
    when(client.getInstances()).thenAnswer((_) async => ['foo', 'bar']);
    when(client.getOperations()).thenAnswer((_) async => {});

    final service = LxdService(client);
    await service.init();

    when(client.getInstances()).thenAnswer((_) async => ['bar']);

    events.add(LxdEvent(
      type: LxdEventType.operation,
      metadata: testOperation(instances: ['foo']).toJson(),
      timestamp: DateTime.now(),
    ));

    expect(service.instanceAdded, neverEmits(anything));
    await expectLater(service.instanceRemoved, emits('foo'));
    expect(service.instanceUpdated, neverEmits(anything));

    expect(service.instances, ['bar']);
    expect(service.instanceStream, emits(['bar']));

    await service.dispose();
  });

  test('update', () async {
    final client = MockLxdClient();
    final events = StreamController<LxdEvent>();
    when(client.getEvents(types: {LxdEventType.operation}))
        .thenAnswer((_) => events.stream);
    when(client.getInstances()).thenAnswer((_) async => ['foo', 'bar', 'baz']);
    when(client.getOperations()).thenAnswer((_) async => {});

    final service = LxdService(client);
    await service.init();

    when(client.getInstances()).thenAnswer((_) async => ['foo', 'bar', 'baz']);

    events.add(LxdEvent(
      type: LxdEventType.operation,
      metadata: testOperation(instances: ['bar']).toJson(),
      timestamp: DateTime.now(),
    ));

    expect(service.instanceAdded, neverEmits(anything));
    expect(service.instanceRemoved, neverEmits(anything));
    await expectLater(service.instanceUpdated, emits('bar'));

    expect(service.instances, ['foo', 'bar', 'baz']);
    expect(service.instanceStream, emits(['foo', 'bar', 'baz']));

    await service.dispose();
  });

  test('status', () async {
    final foo = testInstance(name: 'foo');
    final bar = testInstance(name: 'bar');
    final baz = testInstance(name: 'baz');

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
    when(client.getInstances()).thenAnswer((_) async => ['foo', 'bar', 'baz']);
    when(client.getInstance('foo')).thenAnswer((_) async => foo);
    when(client.getInstance('bar')).thenAnswer((_) async => bar);
    when(client.getInstance('baz')).thenAnswer((_) async => baz);
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

    await expectLater(service.instanceUpdated, emits('foo'));

    expect(await service.getInstance('foo'),
        foo.copyWith(statusCode: LxdStatusCode.starting));
    expect(await service.getInstance('bar'),
        bar.copyWith(statusCode: LxdStatusCode.stopping));
    expect(await service.getInstance('baz'),
        baz.copyWith(statusCode: LxdStatusCode.stopped));

    await service.dispose();
  });

  test('terminal', () async {
    final instance = testInstance(name: 'mine', config: {'user.name': 'me'});

    final exec = testOperation(id: 'x', metadata: {
      'fds': {
        '0': 'fd0',
        'control': 'fdc',
      }
    });

    final client = MockLxdClient();
    when(client.getInstance('mine')).thenAnswer((_) async => instance);
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

    final service = LxdService(client);

    final socket = await service.execTerminal('mine');
    expect(socket.operation, exec);
    expect(socket.id, exec.id);

    socket.resize(123, 456);
    verify(wsc.add(jsonEncode({
      'command': 'window-resize',
      'args': {'width': '123', 'height': '456'},
    }))).called(1);

    socket.write('data');
    verify(ws0.add(utf8.encode('data'))).called(1);

    final received = <String>[];
    socket.listen(received.add);

    verify(client.getInstance('mine')).called(1);
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
    expect(received, ['bytes']);

    controller.add('string');
    expect(received, ['bytes', 'string\r\n']);

    controller.add('');
    expect(received, ['bytes', 'string\r\n']);

    await untilCalled(ws0.close());
    await untilCalled(wsc.close());
  });
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
