import 'dart:async';

import 'package:lxd/lxd.dart';
import 'package:lxd_service/lxd_service.dart';
import 'package:lxd_test/lxd_test.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import 'test_lxd_service.dart';

class TestLxdWatchService extends MockLxdClient with LxdWatchService {}

void main() {
  test('watch instance', () async {
    final service = TestLxdWatchService();
    final events = StreamController<LxdEvent>();
    when(service.getEvents(project: fooId.project))
        .thenAnswer((_) => events.stream);

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

  test('watch operation', () async {
    final service = TestLxdWatchService();
    final events = StreamController<LxdEvent>();
    when(service.getEvents()).thenAnswer((_) => events.stream);

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
}
