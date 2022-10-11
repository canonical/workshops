// Mocks generated by Mockito 5.3.2 from annotations
// in workshops/test/terminal_manager_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'package:lxd/lxd.dart' as _i2;
import 'package:lxd_service/src/features.dart' as _i6;
import 'package:lxd_service/src/remote.dart' as _i5;
import 'package:lxd_service/src/service.dart' as _i3;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeLxdInstance_0 extends _i1.SmartFake implements _i2.LxdInstance {
  _FakeLxdInstance_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeLxdOperation_1 extends _i1.SmartFake implements _i2.LxdOperation {
  _FakeLxdOperation_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeLxdImage_2 extends _i1.SmartFake implements _i2.LxdImage {
  _FakeLxdImage_2(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeLxdTerminal_3 extends _i1.SmartFake implements _i3.LxdTerminal {
  _FakeLxdTerminal_3(
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
class MockLxdService extends _i1.Mock implements _i3.LxdService {
  MockLxdService() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Stream<List<String>> get instanceStream => (super.noSuchMethod(
        Invocation.getter(#instanceStream),
        returnValue: _i4.Stream<List<String>>.empty(),
      ) as _i4.Stream<List<String>>);
  @override
  _i4.Stream<String> get instanceAdded => (super.noSuchMethod(
        Invocation.getter(#instanceAdded),
        returnValue: _i4.Stream<String>.empty(),
      ) as _i4.Stream<String>);
  @override
  _i4.Stream<String> get instanceRemoved => (super.noSuchMethod(
        Invocation.getter(#instanceRemoved),
        returnValue: _i4.Stream<String>.empty(),
      ) as _i4.Stream<String>);
  @override
  _i4.Stream<String> get instanceUpdated => (super.noSuchMethod(
        Invocation.getter(#instanceUpdated),
        returnValue: _i4.Stream<String>.empty(),
      ) as _i4.Stream<String>);
  @override
  _i4.Future<void> init() => (super.noSuchMethod(
        Invocation.method(
          #init,
          [],
        ),
        returnValue: _i4.Future<void>.value(),
        returnValueForMissingStub: _i4.Future<void>.value(),
      ) as _i4.Future<void>);
  @override
  _i4.Future<void> dispose() => (super.noSuchMethod(
        Invocation.method(
          #dispose,
          [],
        ),
        returnValue: _i4.Future<void>.value(),
        returnValueForMissingStub: _i4.Future<void>.value(),
      ) as _i4.Future<void>);
  @override
  _i4.Future<_i2.LxdInstance> getInstance(String? name) => (super.noSuchMethod(
        Invocation.method(
          #getInstance,
          [name],
        ),
        returnValue: _i4.Future<_i2.LxdInstance>.value(_FakeLxdInstance_0(
          this,
          Invocation.method(
            #getInstance,
            [name],
          ),
        )),
      ) as _i4.Future<_i2.LxdInstance>);
  @override
  _i4.Future<_i2.LxdOperation> createInstance(
    _i2.LxdImage? image, {
    _i5.LxdRemote? remote,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #createInstance,
          [image],
          {#remote: remote},
        ),
        returnValue: _i4.Future<_i2.LxdOperation>.value(_FakeLxdOperation_1(
          this,
          Invocation.method(
            #createInstance,
            [image],
            {#remote: remote},
          ),
        )),
      ) as _i4.Future<_i2.LxdOperation>);
  @override
  _i4.Future<_i2.LxdOperation> startInstance(
    String? name, {
    bool? force = false,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #startInstance,
          [name],
          {#force: force},
        ),
        returnValue: _i4.Future<_i2.LxdOperation>.value(_FakeLxdOperation_1(
          this,
          Invocation.method(
            #startInstance,
            [name],
            {#force: force},
          ),
        )),
      ) as _i4.Future<_i2.LxdOperation>);
  @override
  _i4.Future<_i2.LxdOperation> restartInstance(
    String? name, {
    bool? force = false,
    Duration? timeout,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #restartInstance,
          [name],
          {
            #force: force,
            #timeout: timeout,
          },
        ),
        returnValue: _i4.Future<_i2.LxdOperation>.value(_FakeLxdOperation_1(
          this,
          Invocation.method(
            #restartInstance,
            [name],
            {
              #force: force,
              #timeout: timeout,
            },
          ),
        )),
      ) as _i4.Future<_i2.LxdOperation>);
  @override
  _i4.Future<_i2.LxdOperation> stopInstance(
    String? name, {
    bool? force = false,
    Duration? timeout,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #stopInstance,
          [name],
          {
            #force: force,
            #timeout: timeout,
          },
        ),
        returnValue: _i4.Future<_i2.LxdOperation>.value(_FakeLxdOperation_1(
          this,
          Invocation.method(
            #stopInstance,
            [name],
            {
              #force: force,
              #timeout: timeout,
            },
          ),
        )),
      ) as _i4.Future<_i2.LxdOperation>);
  @override
  _i4.Future<_i2.LxdOperation> deleteInstance(String? name) =>
      (super.noSuchMethod(
        Invocation.method(
          #deleteInstance,
          [name],
        ),
        returnValue: _i4.Future<_i2.LxdOperation>.value(_FakeLxdOperation_1(
          this,
          Invocation.method(
            #deleteInstance,
            [name],
          ),
        )),
      ) as _i4.Future<_i2.LxdOperation>);
  @override
  _i4.Stream<_i2.LxdOperation> watchInstance(String? instance) =>
      (super.noSuchMethod(
        Invocation.method(
          #watchInstance,
          [instance],
        ),
        returnValue: _i4.Stream<_i2.LxdOperation>.empty(),
      ) as _i4.Stream<_i2.LxdOperation>);
  @override
  _i4.Future<_i2.LxdOperation?> initFeature(
    String? name,
    _i6.LxdFeatureProvider? feature,
    _i2.LxdImage? image,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #initFeature,
          [
            name,
            feature,
            image,
          ],
        ),
        returnValue: _i4.Future<_i2.LxdOperation?>.value(),
      ) as _i4.Future<_i2.LxdOperation?>);
  @override
  _i4.Future<_i2.LxdImage> configureImage(
    String? instance,
    _i2.LxdImage? image,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #configureImage,
          [
            instance,
            image,
          ],
        ),
        returnValue: _i4.Future<_i2.LxdImage>.value(_FakeLxdImage_2(
          this,
          Invocation.method(
            #configureImage,
            [
              instance,
              image,
            ],
          ),
        )),
      ) as _i4.Future<_i2.LxdImage>);
  @override
  _i4.Future<void> configureFeature(
    String? name,
    _i6.LxdFeatureProvider? feature,
    _i2.LxdImage? image,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #configureFeature,
          [
            name,
            feature,
            image,
          ],
        ),
        returnValue: _i4.Future<void>.value(),
        returnValueForMissingStub: _i4.Future<void>.value(),
      ) as _i4.Future<void>);
  @override
  _i4.Future<_i2.LxdOperation> stageFeatures(
    String? name,
    List<_i6.LxdFeatureProvider>? features,
    _i2.LxdImage? image,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #stageFeatures,
          [
            name,
            features,
            image,
          ],
        ),
        returnValue: _i4.Future<_i2.LxdOperation>.value(_FakeLxdOperation_1(
          this,
          Invocation.method(
            #stageFeatures,
            [
              name,
              features,
              image,
            ],
          ),
        )),
      ) as _i4.Future<_i2.LxdOperation>);
  @override
  _i4.Future<bool> waitVmAgent(
    String? name, {
    Duration? timeout,
    Duration? interval,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #waitVmAgent,
          [name],
          {
            #timeout: timeout,
            #interval: interval,
          },
        ),
        returnValue: _i4.Future<bool>.value(false),
      ) as _i4.Future<bool>);
  @override
  _i4.Future<_i3.LxdTerminal> execTerminal(String? name) => (super.noSuchMethod(
        Invocation.method(
          #execTerminal,
          [name],
        ),
        returnValue: _i4.Future<_i3.LxdTerminal>.value(_FakeLxdTerminal_3(
          this,
          Invocation.method(
            #execTerminal,
            [name],
          ),
        )),
      ) as _i4.Future<_i3.LxdTerminal>);
  @override
  _i4.Future<_i2.LxdOperation> getOperation(String? id) => (super.noSuchMethod(
        Invocation.method(
          #getOperation,
          [id],
        ),
        returnValue: _i4.Future<_i2.LxdOperation>.value(_FakeLxdOperation_1(
          this,
          Invocation.method(
            #getOperation,
            [id],
          ),
        )),
      ) as _i4.Future<_i2.LxdOperation>);
  @override
  _i4.Stream<_i2.LxdOperation> watchOperation(String? id) =>
      (super.noSuchMethod(
        Invocation.method(
          #watchOperation,
          [id],
        ),
        returnValue: _i4.Stream<_i2.LxdOperation>.empty(),
      ) as _i4.Stream<_i2.LxdOperation>);
  @override
  _i4.Future<_i2.LxdOperation> waitOperation(String? id) => (super.noSuchMethod(
        Invocation.method(
          #waitOperation,
          [id],
        ),
        returnValue: _i4.Future<_i2.LxdOperation>.value(_FakeLxdOperation_1(
          this,
          Invocation.method(
            #waitOperation,
            [id],
          ),
        )),
      ) as _i4.Future<_i2.LxdOperation>);
  @override
  _i4.Future<void> cancelOperation(String? id) => (super.noSuchMethod(
        Invocation.method(
          #cancelOperation,
          [id],
        ),
        returnValue: _i4.Future<void>.value(),
        returnValueForMissingStub: _i4.Future<void>.value(),
      ) as _i4.Future<void>);
}

/// A class which mocks [LxdTerminal].
///
/// See the documentation for Mockito's code generation for more information.
class MockLxdTerminal extends _i1.Mock implements _i3.LxdTerminal {
  MockLxdTerminal() {
    _i1.throwOnMissingStub(this);
  }

  @override
  String get id => (super.noSuchMethod(
        Invocation.getter(#id),
        returnValue: '',
      ) as String);
  @override
  _i2.LxdOperation get operation => (super.noSuchMethod(
        Invocation.getter(#operation),
        returnValue: _FakeLxdOperation_1(
          this,
          Invocation.getter(#operation),
        ),
      ) as _i2.LxdOperation);
  @override
  void write(String? data) => super.noSuchMethod(
        Invocation.method(
          #write,
          [data],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void listen(void Function(String)? onData) => super.noSuchMethod(
        Invocation.method(
          #listen,
          [onData],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void resize(
    int? width,
    int? height,
  ) =>
      super.noSuchMethod(
        Invocation.method(
          #resize,
          [
            width,
            height,
          ],
        ),
        returnValueForMissingStub: null,
      );
  @override
  _i4.Future<void> close() => (super.noSuchMethod(
        Invocation.method(
          #close,
          [],
        ),
        returnValue: _i4.Future<void>.value(),
        returnValueForMissingStub: _i4.Future<void>.value(),
      ) as _i4.Future<void>);
}
