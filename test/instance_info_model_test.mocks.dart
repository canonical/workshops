// Mocks generated by Mockito 5.4.4 from annotations
// in workshops/test/instance_info_model_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i6;
import 'dart:io' as _i3;

import 'package:lxd/lxd.dart' as _i2;
import 'package:lxd_service/src/features.dart' as _i8;
import 'package:lxd_service/src/service.dart' as _i5;
import 'package:lxd_service/src/terminal.dart' as _i4;
import 'package:mockito/mockito.dart' as _i1;
import 'package:mockito/src/dummies.dart' as _i7;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeUri_0 extends _i1.SmartFake implements Uri {
  _FakeUri_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeLxdServer_1 extends _i1.SmartFake implements _i2.LxdServer {
  _FakeLxdServer_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeLxdOperation_2 extends _i1.SmartFake implements _i2.LxdOperation {
  _FakeLxdOperation_2(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeWebSocket_3 extends _i1.SmartFake implements _i3.WebSocket {
  _FakeWebSocket_3(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeLxdResources_4 extends _i1.SmartFake implements _i2.LxdResources {
  _FakeLxdResources_4(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeLxdCertificate_5 extends _i1.SmartFake
    implements _i2.LxdCertificate {
  _FakeLxdCertificate_5(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeLxdImage_6 extends _i1.SmartFake implements _i2.LxdImage {
  _FakeLxdImage_6(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeLxdInstance_7 extends _i1.SmartFake implements _i2.LxdInstance {
  _FakeLxdInstance_7(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeLxdInstanceState_8 extends _i1.SmartFake
    implements _i2.LxdInstanceState {
  _FakeLxdInstanceState_8(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeLxdNetwork_9 extends _i1.SmartFake implements _i2.LxdNetwork {
  _FakeLxdNetwork_9(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeLxdNetworkState_10 extends _i1.SmartFake
    implements _i2.LxdNetworkState {
  _FakeLxdNetworkState_10(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeLxdNetworkAcl_11 extends _i1.SmartFake implements _i2.LxdNetworkAcl {
  _FakeLxdNetworkAcl_11(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeLxdProfile_12 extends _i1.SmartFake implements _i2.LxdProfile {
  _FakeLxdProfile_12(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeLxdProject_13 extends _i1.SmartFake implements _i2.LxdProject {
  _FakeLxdProject_13(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeLxdProjectState_14 extends _i1.SmartFake
    implements _i2.LxdProjectState {
  _FakeLxdProjectState_14(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeLxdStoragePool_15 extends _i1.SmartFake
    implements _i2.LxdStoragePool {
  _FakeLxdStoragePool_15(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeLxdTerminal_16 extends _i1.SmartFake implements _i4.LxdTerminal {
  _FakeLxdTerminal_16(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [LxdService].
///
/// See the documentation for Mockito's code generation for more information.
class MockLxdService extends _i1.Mock implements _i5.LxdService {
  MockLxdService() {
    _i1.throwOnMissingStub(this);
  }

  @override
  Uri get url => (super.noSuchMethod(
        Invocation.getter(#url),
        returnValue: _FakeUri_0(
          this,
          Invocation.getter(#url),
        ),
      ) as Uri);

  @override
  set userAgent(String? value) => super.noSuchMethod(
        Invocation.setter(
          #userAgent,
          value,
        ),
        returnValueForMissingStub: null,
      );

  @override
  _i6.Stream<List<_i2.LxdInstanceId>> get instanceStream => (super.noSuchMethod(
        Invocation.getter(#instanceStream),
        returnValue: _i6.Stream<List<_i2.LxdInstanceId>>.empty(),
      ) as _i6.Stream<List<_i2.LxdInstanceId>>);

  @override
  _i6.Stream<_i2.LxdInstanceId> get instanceAdded => (super.noSuchMethod(
        Invocation.getter(#instanceAdded),
        returnValue: _i6.Stream<_i2.LxdInstanceId>.empty(),
      ) as _i6.Stream<_i2.LxdInstanceId>);

  @override
  _i6.Stream<_i2.LxdInstanceId> get instanceRemoved => (super.noSuchMethod(
        Invocation.getter(#instanceRemoved),
        returnValue: _i6.Stream<_i2.LxdInstanceId>.empty(),
      ) as _i6.Stream<_i2.LxdInstanceId>);

  @override
  _i6.Stream<_i2.LxdInstanceId> get instanceUpdated => (super.noSuchMethod(
        Invocation.getter(#instanceUpdated),
        returnValue: _i6.Stream<_i2.LxdInstanceId>.empty(),
      ) as _i6.Stream<_i2.LxdInstanceId>);

  @override
  _i6.Future<void> init() => (super.noSuchMethod(
        Invocation.method(
          #init,
          [],
        ),
        returnValue: _i6.Future<void>.value(),
        returnValueForMissingStub: _i6.Future<void>.value(),
      ) as _i6.Future<void>);

  @override
  _i6.Future<Map<String, List<String>>> getOperations() => (super.noSuchMethod(
        Invocation.method(
          #getOperations,
          [],
        ),
        returnValue: _i6.Future<Map<String, List<String>>>.value(
            <String, List<String>>{}),
      ) as _i6.Future<Map<String, List<String>>>);

  @override
  _i6.Future<_i2.LxdServer> getServerInfo({String? target}) =>
      (super.noSuchMethod(
        Invocation.method(
          #getServerInfo,
          [],
          {#target: target},
        ),
        returnValue: _i6.Future<_i2.LxdServer>.value(_FakeLxdServer_1(
          this,
          Invocation.method(
            #getServerInfo,
            [],
            {#target: target},
          ),
        )),
      ) as _i6.Future<_i2.LxdServer>);

  @override
  _i6.Future<_i2.LxdOperation> getOperation(String? id) => (super.noSuchMethod(
        Invocation.method(
          #getOperation,
          [id],
        ),
        returnValue: _i6.Future<_i2.LxdOperation>.value(_FakeLxdOperation_2(
          this,
          Invocation.method(
            #getOperation,
            [id],
          ),
        )),
      ) as _i6.Future<_i2.LxdOperation>);

  @override
  _i6.Future<_i3.WebSocket> getOperationWebSocket(
    String? id,
    String? secret,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #getOperationWebSocket,
          [
            id,
            secret,
          ],
        ),
        returnValue: _i6.Future<_i3.WebSocket>.value(_FakeWebSocket_3(
          this,
          Invocation.method(
            #getOperationWebSocket,
            [
              id,
              secret,
            ],
          ),
        )),
      ) as _i6.Future<_i3.WebSocket>);

  @override
  _i6.Future<_i2.LxdOperation> waitOperation(
    String? id, {
    Duration? timeout,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #waitOperation,
          [id],
          {#timeout: timeout},
        ),
        returnValue: _i6.Future<_i2.LxdOperation>.value(_FakeLxdOperation_2(
          this,
          Invocation.method(
            #waitOperation,
            [id],
            {#timeout: timeout},
          ),
        )),
      ) as _i6.Future<_i2.LxdOperation>);

  @override
  _i6.Future<void> cancelOperation(String? id) => (super.noSuchMethod(
        Invocation.method(
          #cancelOperation,
          [id],
        ),
        returnValue: _i6.Future<void>.value(),
        returnValueForMissingStub: _i6.Future<void>.value(),
      ) as _i6.Future<void>);

  @override
  _i6.Future<_i2.LxdResources> getResources() => (super.noSuchMethod(
        Invocation.method(
          #getResources,
          [],
        ),
        returnValue: _i6.Future<_i2.LxdResources>.value(_FakeLxdResources_4(
          this,
          Invocation.method(
            #getResources,
            [],
          ),
        )),
      ) as _i6.Future<_i2.LxdResources>);

  @override
  _i6.Future<List<String>> getCertificates() => (super.noSuchMethod(
        Invocation.method(
          #getCertificates,
          [],
        ),
        returnValue: _i6.Future<List<String>>.value(<String>[]),
      ) as _i6.Future<List<String>>);

  @override
  _i6.Future<_i2.LxdCertificate> getCertificate(String? fingerprint) =>
      (super.noSuchMethod(
        Invocation.method(
          #getCertificate,
          [fingerprint],
        ),
        returnValue: _i6.Future<_i2.LxdCertificate>.value(_FakeLxdCertificate_5(
          this,
          Invocation.method(
            #getCertificate,
            [fingerprint],
          ),
        )),
      ) as _i6.Future<_i2.LxdCertificate>);

  @override
  _i6.Stream<_i2.LxdEvent> getEvents({
    String? project,
    Set<_i2.LxdEventType>? types = const {},
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #getEvents,
          [],
          {
            #project: project,
            #types: types,
          },
        ),
        returnValue: _i6.Stream<_i2.LxdEvent>.empty(),
      ) as _i6.Stream<_i2.LxdEvent>);

  @override
  _i6.Stream<_i2.LxdEvent> getAllEvents(
          {Set<_i2.LxdEventType>? types = const {}}) =>
      (super.noSuchMethod(
        Invocation.method(
          #getAllEvents,
          [],
          {#types: types},
        ),
        returnValue: _i6.Stream<_i2.LxdEvent>.empty(),
      ) as _i6.Stream<_i2.LxdEvent>);

  @override
  _i6.Future<List<String>> getImages({
    String? project,
    String? filter,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #getImages,
          [],
          {
            #project: project,
            #filter: filter,
          },
        ),
        returnValue: _i6.Future<List<String>>.value(<String>[]),
      ) as _i6.Future<List<String>>);

  @override
  _i6.Future<_i2.LxdImage> getImage(
    String? fingerprint, {
    String? project,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #getImage,
          [fingerprint],
          {#project: project},
        ),
        returnValue: _i6.Future<_i2.LxdImage>.value(_FakeLxdImage_6(
          this,
          Invocation.method(
            #getImage,
            [fingerprint],
            {#project: project},
          ),
        )),
      ) as _i6.Future<_i2.LxdImage>);

  @override
  _i6.Future<List<_i2.LxdInstanceId>> getInstances({
    String? project,
    String? filter,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #getInstances,
          [],
          {
            #project: project,
            #filter: filter,
          },
        ),
        returnValue:
            _i6.Future<List<_i2.LxdInstanceId>>.value(<_i2.LxdInstanceId>[]),
      ) as _i6.Future<List<_i2.LxdInstanceId>>);

  @override
  _i6.Future<List<_i2.LxdInstanceId>> getAllInstances({String? filter}) =>
      (super.noSuchMethod(
        Invocation.method(
          #getAllInstances,
          [],
          {#filter: filter},
        ),
        returnValue:
            _i6.Future<List<_i2.LxdInstanceId>>.value(<_i2.LxdInstanceId>[]),
      ) as _i6.Future<List<_i2.LxdInstanceId>>);

  @override
  _i6.Future<_i2.LxdInstance> getInstance(_i2.LxdInstanceId? id) =>
      (super.noSuchMethod(
        Invocation.method(
          #getInstance,
          [id],
        ),
        returnValue: _i6.Future<_i2.LxdInstance>.value(_FakeLxdInstance_7(
          this,
          Invocation.method(
            #getInstance,
            [id],
          ),
        )),
      ) as _i6.Future<_i2.LxdInstance>);

  @override
  _i6.Future<_i2.LxdInstanceState> getInstanceState(_i2.LxdInstanceId? id) =>
      (super.noSuchMethod(
        Invocation.method(
          #getInstanceState,
          [id],
        ),
        returnValue:
            _i6.Future<_i2.LxdInstanceState>.value(_FakeLxdInstanceState_8(
          this,
          Invocation.method(
            #getInstanceState,
            [id],
          ),
        )),
      ) as _i6.Future<_i2.LxdInstanceState>);

  @override
  _i6.Future<_i2.LxdOperation> createInstance({
    String? project,
    String? architecture,
    Map<String, String>? config,
    Map<String, Map<String, String>>? devices,
    bool? ephemeral,
    List<String>? profiles,
    String? restore,
    bool? stateful,
    String? description,
    String? name,
    required _i2.LxdImage? source,
    String? server,
    String? instanceType,
    _i2.LxdImageType? type,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #createInstance,
          [],
          {
            #project: project,
            #architecture: architecture,
            #config: config,
            #devices: devices,
            #ephemeral: ephemeral,
            #profiles: profiles,
            #restore: restore,
            #stateful: stateful,
            #description: description,
            #name: name,
            #source: source,
            #server: server,
            #instanceType: instanceType,
            #type: type,
          },
        ),
        returnValue: _i6.Future<_i2.LxdOperation>.value(_FakeLxdOperation_2(
          this,
          Invocation.method(
            #createInstance,
            [],
            {
              #project: project,
              #architecture: architecture,
              #config: config,
              #devices: devices,
              #ephemeral: ephemeral,
              #profiles: profiles,
              #restore: restore,
              #stateful: stateful,
              #description: description,
              #name: name,
              #source: source,
              #server: server,
              #instanceType: instanceType,
              #type: type,
            },
          ),
        )),
      ) as _i6.Future<_i2.LxdOperation>);

  @override
  _i6.Future<_i2.LxdOperation> startInstance(
    _i2.LxdInstanceId? id, {
    bool? force = false,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #startInstance,
          [id],
          {#force: force},
        ),
        returnValue: _i6.Future<_i2.LxdOperation>.value(_FakeLxdOperation_2(
          this,
          Invocation.method(
            #startInstance,
            [id],
            {#force: force},
          ),
        )),
      ) as _i6.Future<_i2.LxdOperation>);

  @override
  _i6.Future<_i2.LxdOperation> execInstance(
    _i2.LxdInstanceId? id, {
    required List<String>? command,
    String? workingDirectory,
    Map<String, String>? environment,
    int? user,
    int? group,
    bool? interactive,
    bool? recordOutput,
    int? width,
    int? height,
    bool? waitForWebSocket,
  }) =>
      (super.noSuchMethod(
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
        returnValue: _i6.Future<_i2.LxdOperation>.value(_FakeLxdOperation_2(
          this,
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
        )),
      ) as _i6.Future<_i2.LxdOperation>);

  @override
  _i6.Future<_i2.LxdOperation> updateInstance(_i2.LxdInstance? instance) =>
      (super.noSuchMethod(
        Invocation.method(
          #updateInstance,
          [instance],
        ),
        returnValue: _i6.Future<_i2.LxdOperation>.value(_FakeLxdOperation_2(
          this,
          Invocation.method(
            #updateInstance,
            [instance],
          ),
        )),
      ) as _i6.Future<_i2.LxdOperation>);

  @override
  _i6.Future<_i2.LxdOperation> stopInstance(
    _i2.LxdInstanceId? id, {
    bool? force = false,
    Duration? timeout,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #stopInstance,
          [id],
          {
            #force: force,
            #timeout: timeout,
          },
        ),
        returnValue: _i6.Future<_i2.LxdOperation>.value(_FakeLxdOperation_2(
          this,
          Invocation.method(
            #stopInstance,
            [id],
            {
              #force: force,
              #timeout: timeout,
            },
          ),
        )),
      ) as _i6.Future<_i2.LxdOperation>);

  @override
  _i6.Future<_i2.LxdOperation> restartInstance(
    _i2.LxdInstanceId? id, {
    bool? force = false,
    Duration? timeout,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #restartInstance,
          [id],
          {
            #force: force,
            #timeout: timeout,
          },
        ),
        returnValue: _i6.Future<_i2.LxdOperation>.value(_FakeLxdOperation_2(
          this,
          Invocation.method(
            #restartInstance,
            [id],
            {
              #force: force,
              #timeout: timeout,
            },
          ),
        )),
      ) as _i6.Future<_i2.LxdOperation>);

  @override
  _i6.Future<_i2.LxdOperation> deleteInstance(_i2.LxdInstanceId? id) =>
      (super.noSuchMethod(
        Invocation.method(
          #deleteInstance,
          [id],
        ),
        returnValue: _i6.Future<_i2.LxdOperation>.value(_FakeLxdOperation_2(
          this,
          Invocation.method(
            #deleteInstance,
            [id],
          ),
        )),
      ) as _i6.Future<_i2.LxdOperation>);

  @override
  _i6.Future<String> pullFile(
    _i2.LxdInstanceId? id, {
    required String? path,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #pullFile,
          [id],
          {#path: path},
        ),
        returnValue: _i6.Future<String>.value(_i7.dummyValue<String>(
          this,
          Invocation.method(
            #pullFile,
            [id],
            {#path: path},
          ),
        )),
      ) as _i6.Future<String>);

  @override
  _i6.Future<void> deleteFile(
    _i2.LxdInstanceId? id, {
    required String? path,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #deleteFile,
          [id],
          {#path: path},
        ),
        returnValue: _i6.Future<void>.value(),
        returnValueForMissingStub: _i6.Future<void>.value(),
      ) as _i6.Future<void>);

  @override
  _i6.Future<void> pushFile(
    _i2.LxdInstanceId? id, {
    required String? path,
    String? data,
    int? uid,
    int? gid,
    String? mode,
    _i2.LxdFileType? type,
    _i2.LxdWriteMode? write,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #pushFile,
          [id],
          {
            #path: path,
            #data: data,
            #uid: uid,
            #gid: gid,
            #mode: mode,
            #type: type,
            #write: write,
          },
        ),
        returnValue: _i6.Future<void>.value(),
        returnValueForMissingStub: _i6.Future<void>.value(),
      ) as _i6.Future<void>);

  @override
  _i6.Future<List<String>> getNetworks() => (super.noSuchMethod(
        Invocation.method(
          #getNetworks,
          [],
        ),
        returnValue: _i6.Future<List<String>>.value(<String>[]),
      ) as _i6.Future<List<String>>);

  @override
  _i6.Future<_i2.LxdNetwork> getNetwork(String? name) => (super.noSuchMethod(
        Invocation.method(
          #getNetwork,
          [name],
        ),
        returnValue: _i6.Future<_i2.LxdNetwork>.value(_FakeLxdNetwork_9(
          this,
          Invocation.method(
            #getNetwork,
            [name],
          ),
        )),
      ) as _i6.Future<_i2.LxdNetwork>);

  @override
  _i6.Future<List<_i2.LxdNetworkLease>> getNetworkLeases(String? name) =>
      (super.noSuchMethod(
        Invocation.method(
          #getNetworkLeases,
          [name],
        ),
        returnValue: _i6.Future<List<_i2.LxdNetworkLease>>.value(
            <_i2.LxdNetworkLease>[]),
      ) as _i6.Future<List<_i2.LxdNetworkLease>>);

  @override
  _i6.Future<_i2.LxdNetworkState> getNetworkState(String? name) =>
      (super.noSuchMethod(
        Invocation.method(
          #getNetworkState,
          [name],
        ),
        returnValue:
            _i6.Future<_i2.LxdNetworkState>.value(_FakeLxdNetworkState_10(
          this,
          Invocation.method(
            #getNetworkState,
            [name],
          ),
        )),
      ) as _i6.Future<_i2.LxdNetworkState>);

  @override
  _i6.Future<List<String>> getNetworkAcls({String? project}) =>
      (super.noSuchMethod(
        Invocation.method(
          #getNetworkAcls,
          [],
          {#project: project},
        ),
        returnValue: _i6.Future<List<String>>.value(<String>[]),
      ) as _i6.Future<List<String>>);

  @override
  _i6.Future<_i2.LxdNetworkAcl> getNetworkAcl(
    String? name, {
    String? project,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #getNetworkAcl,
          [name],
          {#project: project},
        ),
        returnValue: _i6.Future<_i2.LxdNetworkAcl>.value(_FakeLxdNetworkAcl_11(
          this,
          Invocation.method(
            #getNetworkAcl,
            [name],
            {#project: project},
          ),
        )),
      ) as _i6.Future<_i2.LxdNetworkAcl>);

  @override
  _i6.Future<List<String>> getProfiles({String? project}) =>
      (super.noSuchMethod(
        Invocation.method(
          #getProfiles,
          [],
          {#project: project},
        ),
        returnValue: _i6.Future<List<String>>.value(<String>[]),
      ) as _i6.Future<List<String>>);

  @override
  _i6.Future<_i2.LxdProfile> getProfile(
    String? name, {
    String? project,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #getProfile,
          [name],
          {#project: project},
        ),
        returnValue: _i6.Future<_i2.LxdProfile>.value(_FakeLxdProfile_12(
          this,
          Invocation.method(
            #getProfile,
            [name],
            {#project: project},
          ),
        )),
      ) as _i6.Future<_i2.LxdProfile>);

  @override
  _i6.Future<List<String>> getProjects() => (super.noSuchMethod(
        Invocation.method(
          #getProjects,
          [],
        ),
        returnValue: _i6.Future<List<String>>.value(<String>[]),
      ) as _i6.Future<List<String>>);

  @override
  _i6.Future<_i2.LxdProject> getProject(String? name) => (super.noSuchMethod(
        Invocation.method(
          #getProject,
          [name],
        ),
        returnValue: _i6.Future<_i2.LxdProject>.value(_FakeLxdProject_13(
          this,
          Invocation.method(
            #getProject,
            [name],
          ),
        )),
      ) as _i6.Future<_i2.LxdProject>);

  @override
  _i6.Future<_i2.LxdProjectState> getProjectState(String? name) =>
      (super.noSuchMethod(
        Invocation.method(
          #getProjectState,
          [name],
        ),
        returnValue:
            _i6.Future<_i2.LxdProjectState>.value(_FakeLxdProjectState_14(
          this,
          Invocation.method(
            #getProjectState,
            [name],
          ),
        )),
      ) as _i6.Future<_i2.LxdProjectState>);

  @override
  _i6.Future<void> updateProject(_i2.LxdProject? project) =>
      (super.noSuchMethod(
        Invocation.method(
          #updateProject,
          [project],
        ),
        returnValue: _i6.Future<void>.value(),
        returnValueForMissingStub: _i6.Future<void>.value(),
      ) as _i6.Future<void>);

  @override
  _i6.Future<List<String>> getStoragePools({String? project}) =>
      (super.noSuchMethod(
        Invocation.method(
          #getStoragePools,
          [],
          {#project: project},
        ),
        returnValue: _i6.Future<List<String>>.value(<String>[]),
      ) as _i6.Future<List<String>>);

  @override
  _i6.Future<_i2.LxdStoragePool> getStoragePool(
    String? name, {
    String? project,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #getStoragePool,
          [name],
          {#project: project},
        ),
        returnValue:
            _i6.Future<_i2.LxdStoragePool>.value(_FakeLxdStoragePool_15(
          this,
          Invocation.method(
            #getStoragePool,
            [name],
            {#project: project},
          ),
        )),
      ) as _i6.Future<_i2.LxdStoragePool>);

  @override
  void close() => super.noSuchMethod(
        Invocation.method(
          #close,
          [],
        ),
        returnValueForMissingStub: null,
      );

  @override
  _i6.Future<_i2.LxdOperation?> initFeature(
    _i2.LxdInstanceId? id,
    _i8.LxdFeatureProvider? feature,
    _i2.LxdImage? image,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #initFeature,
          [
            id,
            feature,
            image,
          ],
        ),
        returnValue: _i6.Future<_i2.LxdOperation?>.value(),
      ) as _i6.Future<_i2.LxdOperation?>);

  @override
  _i6.Future<_i2.LxdImage> configureImage(
    _i2.LxdInstanceId? id,
    _i2.LxdImage? image,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #configureImage,
          [
            id,
            image,
          ],
        ),
        returnValue: _i6.Future<_i2.LxdImage>.value(_FakeLxdImage_6(
          this,
          Invocation.method(
            #configureImage,
            [
              id,
              image,
            ],
          ),
        )),
      ) as _i6.Future<_i2.LxdImage>);

  @override
  _i6.Future<void> configureFeature(
    _i2.LxdInstanceId? id,
    _i8.LxdFeatureProvider? feature,
    _i2.LxdImage? image,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #configureFeature,
          [
            id,
            feature,
            image,
          ],
        ),
        returnValue: _i6.Future<void>.value(),
        returnValueForMissingStub: _i6.Future<void>.value(),
      ) as _i6.Future<void>);

  @override
  _i6.Future<_i2.LxdOperation> stageFeatures(
    _i2.LxdInstanceId? id,
    List<_i8.LxdFeatureProvider>? features,
    _i2.LxdImage? image,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #stageFeatures,
          [
            id,
            features,
            image,
          ],
        ),
        returnValue: _i6.Future<_i2.LxdOperation>.value(_FakeLxdOperation_2(
          this,
          Invocation.method(
            #stageFeatures,
            [
              id,
              features,
              image,
            ],
          ),
        )),
      ) as _i6.Future<_i2.LxdOperation>);

  @override
  _i6.Future<void> dispose() => (super.noSuchMethod(
        Invocation.method(
          #dispose,
          [],
        ),
        returnValue: _i6.Future<void>.value(),
        returnValueForMissingStub: _i6.Future<void>.value(),
      ) as _i6.Future<void>);

  @override
  _i6.Future<_i2.LxdOperation> updateInstanceConfig(
    _i2.LxdInstanceId? id,
    Map<String, String>? config,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #updateInstanceConfig,
          [
            id,
            config,
          ],
        ),
        returnValue: _i6.Future<_i2.LxdOperation>.value(_FakeLxdOperation_2(
          this,
          Invocation.method(
            #updateInstanceConfig,
            [
              id,
              config,
            ],
          ),
        )),
      ) as _i6.Future<_i2.LxdOperation>);

  @override
  _i6.Future<void> updateProjectConfig(
    String? name,
    Map<String, String>? config,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #updateProjectConfig,
          [
            name,
            config,
          ],
        ),
        returnValue: _i6.Future<void>.value(),
        returnValueForMissingStub: _i6.Future<void>.value(),
      ) as _i6.Future<void>);

  @override
  _i6.Future<_i4.LxdTerminal> execTerminal(_i2.LxdInstanceId? id) =>
      (super.noSuchMethod(
        Invocation.method(
          #execTerminal,
          [id],
        ),
        returnValue: _i6.Future<_i4.LxdTerminal>.value(_FakeLxdTerminal_16(
          this,
          Invocation.method(
            #execTerminal,
            [id],
          ),
        )),
      ) as _i6.Future<_i4.LxdTerminal>);

  @override
  _i6.Future<bool> waitVmAgent(
    _i2.LxdInstanceId? id, {
    Duration? timeout,
    Duration? interval,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #waitVmAgent,
          [id],
          {
            #timeout: timeout,
            #interval: interval,
          },
        ),
        returnValue: _i6.Future<bool>.value(false),
      ) as _i6.Future<bool>);

  @override
  _i6.Stream<_i2.LxdOperation> watchInstance(_i2.LxdInstanceId? id) =>
      (super.noSuchMethod(
        Invocation.method(
          #watchInstance,
          [id],
        ),
        returnValue: _i6.Stream<_i2.LxdOperation>.empty(),
      ) as _i6.Stream<_i2.LxdOperation>);

  @override
  _i6.Stream<_i2.LxdOperation> watchOperation(String? id) =>
      (super.noSuchMethod(
        Invocation.method(
          #watchOperation,
          [id],
        ),
        returnValue: _i6.Stream<_i2.LxdOperation>.empty(),
      ) as _i6.Stream<_i2.LxdOperation>);
}
