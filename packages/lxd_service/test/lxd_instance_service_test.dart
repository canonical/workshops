import 'dart:async';

import 'package:lxd/lxd.dart';
import 'package:lxd_service/lxd_service.dart';
import 'package:lxd_test/lxd_test.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import 'test_lxd_service.dart';

class TestLxdInstanceService extends MockLxdClient with LxdInstanceService {}

void main() {
  test('init', () async {
    final service = TestLxdInstanceService();
    final events = StreamController<LxdEvent>();
    when(service.getEvents(types: {LxdEventType.operation}))
        .thenAnswer((_) => events.stream);
    when(service.getInstances()).thenAnswer((_) async => [fooId]);
    when(service.getOperations()).thenAnswer((_) async => {
          'running': ['op']
        });
    when(service.getOperation('op')).thenAnswer((_) async =>
        testOperation(id: 'op', statusCode: LxdStatusCode.running));

    expect(service.instances, isNull);

    await service.init();
    verify(service.getEvents(types: {LxdEventType.operation})).called(1);
    verify(service.getInstances()).called(1);
    verify(service.getOperations()).called(1);
    verify(service.getOperation('op')).called(1);

    expect(service.instances, [fooId]);
    expect(service.instanceStream, emits([fooId]));

    expect(service.instanceAdded, neverEmits(anything));
    expect(service.instanceRemoved, neverEmits(anything));
    expect(service.instanceUpdated, neverEmits(anything));

    await service.dispose();
  });

  test('instance added', () async {
    final service = TestLxdInstanceService();
    final events = StreamController<LxdEvent>();
    when(service.getEvents(types: {LxdEventType.operation}))
        .thenAnswer((_) => events.stream);
    when(service.getInstances()).thenAnswer((_) async => [fooId]);
    when(service.getOperations()).thenAnswer((_) async => {});

    await service.init();

    when(service.getInstances()).thenAnswer((_) async => [fooId, barId]);

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
    final service = TestLxdInstanceService();
    final events = StreamController<LxdEvent>();
    when(service.getEvents(types: {LxdEventType.operation}))
        .thenAnswer((_) => events.stream);
    when(service.getInstances()).thenAnswer((_) async => [fooId, barId]);
    when(service.getOperations()).thenAnswer((_) async => {});

    await service.init();

    when(service.getInstances()).thenAnswer((_) async => [barId]);

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
    final service = TestLxdInstanceService();
    final events = StreamController<LxdEvent>();
    when(service.getEvents(types: {LxdEventType.operation}))
        .thenAnswer((_) => events.stream);
    when(service.getInstances()).thenAnswer((_) async => [fooId, barId, bazId]);
    when(service.getOperations()).thenAnswer((_) async => {});

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

    final service = TestLxdInstanceService();
    final events = StreamController<LxdEvent>();
    when(service.getEvents(types: {LxdEventType.operation}))
        .thenAnswer((_) => events.stream);
    when(service.getInstances()).thenAnswer((_) async => [fooId, barId, bazId]);
    when(service.getInstance(fooId)).thenAnswer((_) async => foo);
    when(service.getInstance(barId)).thenAnswer((_) async => bar);
    when(service.getInstance(bazId)).thenAnswer((_) async => baz);
    when(service.getOperations()).thenAnswer((_) async => {
          'pending': ['p'],
          'running': ['r'],
          'success': ['s'],
        });
    when(service.getOperation('p')).thenAnswer((_) async => starting);
    when(service.getOperation('r')).thenAnswer((_) async => stopping);
    when(service.getOperation('s')).thenAnswer((_) async => restarting);

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
}
