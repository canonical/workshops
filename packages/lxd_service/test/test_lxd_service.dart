import 'dart:io';

import 'package:lxd/lxd.dart';
import 'package:lxd_test/lxd_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'test_lxd_service.mocks.dart';
export 'test_lxd_service.mocks.dart';

@GenerateMocks([WebSocket])
const fooId = LxdInstanceId('foo');
const barId = LxdInstanceId('bar');
const bazId = LxdInstanceId('baz');

class MockLxdClient extends Mock implements LxdClient {
  @override
  Stream<LxdEvent> getEvents({
    String? project,
    Set<LxdEventType> types = const {},
  }) {
    return noSuchMethod(
      Invocation.method(#getEvents, [], {#project: project, #types: types}),
      returnValue: const Stream<LxdEvent>.empty(),
    ) as Stream<LxdEvent>;
  }

  @override
  Future<LxdInstance> getInstance(LxdInstanceId id) {
    return noSuchMethod(
      Invocation.method(#getInstance, [id]),
      returnValue: Future.value(testInstance(id: id)),
    ) as Future<LxdInstance>;
  }

  @override
  Future<LxdInstanceState> getInstanceState(LxdInstanceId id) {
    return noSuchMethod(
      Invocation.method(#getInstanceState, [id]),
      returnValue: Future.value(testInstanceState()),
    ) as Future<LxdInstanceState>;
  }

  @override
  Future<List<LxdInstanceId>> getInstances({String? project, String? filter}) {
    return noSuchMethod(
      Invocation.method(#getInstances, [], {
        #project: project,
        #filter: filter,
      }),
      returnValue: Future.value([fooId]),
    ) as Future<List<LxdInstanceId>>;
  }

  @override
  Future<LxdOperation> getOperation(String id) {
    return noSuchMethod(
      Invocation.method(#getOperation, [id]),
      returnValue: Future.value(testOperation(id: id)),
    ) as Future<LxdOperation>;
  }

  @override
  Future<Map<String, List<String>>> getOperations() {
    return noSuchMethod(
      Invocation.method(#getOperations, []),
      returnValue: Future.value(<String, List<String>>{}),
    ) as Future<Map<String, List<String>>>;
  }

  @override
  Future<WebSocket> getOperationWebSocket(String id, String secret) {
    return noSuchMethod(
      Invocation.method(#getOperationWebSocket, [id, secret]),
      returnValue: Future.value(MockWebSocket()),
    ) as Future<WebSocket>;
  }

  @override
  Future<LxdOperation> waitOperation(String id, {Duration? timeout}) {
    return noSuchMethod(
      Invocation.method(#waitOperation, [id], {#timeout: timeout}),
      returnValue: Future.value(testOperation(id: id)),
    ) as Future<LxdOperation>;
  }

  @override
  Future<LxdOperation> execInstance(
    LxdInstanceId id, {
    required List<String> command,
    String? workingDirectory,
    Map<String, String>? environment,
    int? user,
    int? group,
    bool? interactive,
    bool? recordOutput,
    int? width,
    int? height,
    bool? waitForWebSocket,
  }) {
    return noSuchMethod(
      Invocation.method(
        #execInstance,
        [id],
        {
          #command: command,
          #workingDirectory: workingDirectory,
          #environment: environment,
          #user: user,
          #group: group,
          #interactive: interactive,
          #recordOutput: recordOutput,
          #width: width,
          #height: height,
          #waitForWebSocket: waitForWebSocket,
        },
      ),
      returnValue: Future.value(testOperation(id: 'op')),
    ) as Future<LxdOperation>;
  }
}
