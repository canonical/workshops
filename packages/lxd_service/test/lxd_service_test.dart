import 'dart:async';

import 'package:lxd/lxd.dart';
import 'package:lxd_service/lxd_service.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import 'lxd_service_test.mocks.dart';

@GenerateMocks([LxdClient])
void main() {
  test('init', () async {
    final client = MockLxdClient();
    final events = StreamController<LxdEvent>();
    when(client.getEvents(types: {LxdEventType.operation}))
        .thenAnswer((_) => events.stream);
    when(client.getInstances()).thenAnswer((_) async => ['foo']);

    final service = LxdService(client);
    expect(service.instances, isNull);

    await service.init();
    verify(client.getEvents(types: {LxdEventType.operation})).called(1);
    verify(client.getInstances()).called(1);

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
}

LxdOperation testOperation({List<String>? instances}) {
  return LxdOperation(
    createdAt: DateTime.now(),
    description: '',
    error: '',
    id: '',
    location: '',
    mayCancel: false,
    metadata: null,
    resources: {'instances': instances ?? []},
    status: '',
    statusCode: 200,
    type: LxdOperationType.task,
    updatedAt: DateTime.now(),
  );
}
