// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'terminal_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$TerminalState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() none,
    required TResult Function(String? message) error,
    required TResult Function(String name, LxdOperation op) create,
    required TResult Function(LxdInstance instance, LxdFeature feature) init,
    required TResult Function(LxdInstance instance, LxdFeature feature) config,
    required TResult Function(LxdInstance instance, LxdOperation op) stage,
    required TResult Function(LxdInstance instance, LxdOperation op) start,
    required TResult Function(LxdInstance instance, LxdOperation op) restart,
    required TResult Function(LxdInstance instance, Terminal terminal) running,
    required TResult Function(LxdInstance instance, LxdOperation op) stop,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? none,
    TResult Function(String? message)? error,
    TResult Function(String name, LxdOperation op)? create,
    TResult Function(LxdInstance instance, LxdFeature feature)? init,
    TResult Function(LxdInstance instance, LxdFeature feature)? config,
    TResult Function(LxdInstance instance, LxdOperation op)? stage,
    TResult Function(LxdInstance instance, LxdOperation op)? start,
    TResult Function(LxdInstance instance, LxdOperation op)? restart,
    TResult Function(LxdInstance instance, Terminal terminal)? running,
    TResult Function(LxdInstance instance, LxdOperation op)? stop,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? none,
    TResult Function(String? message)? error,
    TResult Function(String name, LxdOperation op)? create,
    TResult Function(LxdInstance instance, LxdFeature feature)? init,
    TResult Function(LxdInstance instance, LxdFeature feature)? config,
    TResult Function(LxdInstance instance, LxdOperation op)? stage,
    TResult Function(LxdInstance instance, LxdOperation op)? start,
    TResult Function(LxdInstance instance, LxdOperation op)? restart,
    TResult Function(LxdInstance instance, Terminal terminal)? running,
    TResult Function(LxdInstance instance, LxdOperation op)? stop,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TerminalNone value) none,
    required TResult Function(TerminalError value) error,
    required TResult Function(TerminalCreate value) create,
    required TResult Function(TerminalInit value) init,
    required TResult Function(TerminalConfig value) config,
    required TResult Function(TerminalStage value) stage,
    required TResult Function(TerminalStart value) start,
    required TResult Function(TerminalRestart value) restart,
    required TResult Function(TerminalRunning value) running,
    required TResult Function(TerminalStop value) stop,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(TerminalNone value)? none,
    TResult Function(TerminalError value)? error,
    TResult Function(TerminalCreate value)? create,
    TResult Function(TerminalInit value)? init,
    TResult Function(TerminalConfig value)? config,
    TResult Function(TerminalStage value)? stage,
    TResult Function(TerminalStart value)? start,
    TResult Function(TerminalRestart value)? restart,
    TResult Function(TerminalRunning value)? running,
    TResult Function(TerminalStop value)? stop,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TerminalNone value)? none,
    TResult Function(TerminalError value)? error,
    TResult Function(TerminalCreate value)? create,
    TResult Function(TerminalInit value)? init,
    TResult Function(TerminalConfig value)? config,
    TResult Function(TerminalStage value)? stage,
    TResult Function(TerminalStart value)? start,
    TResult Function(TerminalRestart value)? restart,
    TResult Function(TerminalRunning value)? running,
    TResult Function(TerminalStop value)? stop,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TerminalStateCopyWith<$Res> {
  factory $TerminalStateCopyWith(
          TerminalState value, $Res Function(TerminalState) then) =
      _$TerminalStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$TerminalStateCopyWithImpl<$Res>
    implements $TerminalStateCopyWith<$Res> {
  _$TerminalStateCopyWithImpl(this._value, this._then);

  final TerminalState _value;
  // ignore: unused_field
  final $Res Function(TerminalState) _then;
}

/// @nodoc
abstract class _$$TerminalNoneCopyWith<$Res> {
  factory _$$TerminalNoneCopyWith(
          _$TerminalNone value, $Res Function(_$TerminalNone) then) =
      __$$TerminalNoneCopyWithImpl<$Res>;
}

/// @nodoc
class __$$TerminalNoneCopyWithImpl<$Res>
    extends _$TerminalStateCopyWithImpl<$Res>
    implements _$$TerminalNoneCopyWith<$Res> {
  __$$TerminalNoneCopyWithImpl(
      _$TerminalNone _value, $Res Function(_$TerminalNone) _then)
      : super(_value, (v) => _then(v as _$TerminalNone));

  @override
  _$TerminalNone get _value => super._value as _$TerminalNone;
}

/// @nodoc

class _$TerminalNone extends TerminalNone {
  const _$TerminalNone() : super._();

  @override
  String toString() {
    return 'TerminalState.none()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$TerminalNone);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() none,
    required TResult Function(String? message) error,
    required TResult Function(String name, LxdOperation op) create,
    required TResult Function(LxdInstance instance, LxdFeature feature) init,
    required TResult Function(LxdInstance instance, LxdFeature feature) config,
    required TResult Function(LxdInstance instance, LxdOperation op) stage,
    required TResult Function(LxdInstance instance, LxdOperation op) start,
    required TResult Function(LxdInstance instance, LxdOperation op) restart,
    required TResult Function(LxdInstance instance, Terminal terminal) running,
    required TResult Function(LxdInstance instance, LxdOperation op) stop,
  }) {
    return none();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? none,
    TResult Function(String? message)? error,
    TResult Function(String name, LxdOperation op)? create,
    TResult Function(LxdInstance instance, LxdFeature feature)? init,
    TResult Function(LxdInstance instance, LxdFeature feature)? config,
    TResult Function(LxdInstance instance, LxdOperation op)? stage,
    TResult Function(LxdInstance instance, LxdOperation op)? start,
    TResult Function(LxdInstance instance, LxdOperation op)? restart,
    TResult Function(LxdInstance instance, Terminal terminal)? running,
    TResult Function(LxdInstance instance, LxdOperation op)? stop,
  }) {
    return none?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? none,
    TResult Function(String? message)? error,
    TResult Function(String name, LxdOperation op)? create,
    TResult Function(LxdInstance instance, LxdFeature feature)? init,
    TResult Function(LxdInstance instance, LxdFeature feature)? config,
    TResult Function(LxdInstance instance, LxdOperation op)? stage,
    TResult Function(LxdInstance instance, LxdOperation op)? start,
    TResult Function(LxdInstance instance, LxdOperation op)? restart,
    TResult Function(LxdInstance instance, Terminal terminal)? running,
    TResult Function(LxdInstance instance, LxdOperation op)? stop,
    required TResult orElse(),
  }) {
    if (none != null) {
      return none();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TerminalNone value) none,
    required TResult Function(TerminalError value) error,
    required TResult Function(TerminalCreate value) create,
    required TResult Function(TerminalInit value) init,
    required TResult Function(TerminalConfig value) config,
    required TResult Function(TerminalStage value) stage,
    required TResult Function(TerminalStart value) start,
    required TResult Function(TerminalRestart value) restart,
    required TResult Function(TerminalRunning value) running,
    required TResult Function(TerminalStop value) stop,
  }) {
    return none(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(TerminalNone value)? none,
    TResult Function(TerminalError value)? error,
    TResult Function(TerminalCreate value)? create,
    TResult Function(TerminalInit value)? init,
    TResult Function(TerminalConfig value)? config,
    TResult Function(TerminalStage value)? stage,
    TResult Function(TerminalStart value)? start,
    TResult Function(TerminalRestart value)? restart,
    TResult Function(TerminalRunning value)? running,
    TResult Function(TerminalStop value)? stop,
  }) {
    return none?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TerminalNone value)? none,
    TResult Function(TerminalError value)? error,
    TResult Function(TerminalCreate value)? create,
    TResult Function(TerminalInit value)? init,
    TResult Function(TerminalConfig value)? config,
    TResult Function(TerminalStage value)? stage,
    TResult Function(TerminalStart value)? start,
    TResult Function(TerminalRestart value)? restart,
    TResult Function(TerminalRunning value)? running,
    TResult Function(TerminalStop value)? stop,
    required TResult orElse(),
  }) {
    if (none != null) {
      return none(this);
    }
    return orElse();
  }
}

abstract class TerminalNone extends TerminalState {
  const factory TerminalNone() = _$TerminalNone;
  const TerminalNone._() : super._();
}

/// @nodoc
abstract class _$$TerminalErrorCopyWith<$Res> {
  factory _$$TerminalErrorCopyWith(
          _$TerminalError value, $Res Function(_$TerminalError) then) =
      __$$TerminalErrorCopyWithImpl<$Res>;
  $Res call({String? message});
}

/// @nodoc
class __$$TerminalErrorCopyWithImpl<$Res>
    extends _$TerminalStateCopyWithImpl<$Res>
    implements _$$TerminalErrorCopyWith<$Res> {
  __$$TerminalErrorCopyWithImpl(
      _$TerminalError _value, $Res Function(_$TerminalError) _then)
      : super(_value, (v) => _then(v as _$TerminalError));

  @override
  _$TerminalError get _value => super._value as _$TerminalError;

  @override
  $Res call({
    Object? message = freezed,
  }) {
    return _then(_$TerminalError(
      message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$TerminalError extends TerminalError {
  const _$TerminalError([this.message]) : super._();

  @override
  final String? message;

  @override
  String toString() {
    return 'TerminalState.error(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TerminalError &&
            const DeepCollectionEquality().equals(other.message, message));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(message));

  @JsonKey(ignore: true)
  @override
  _$$TerminalErrorCopyWith<_$TerminalError> get copyWith =>
      __$$TerminalErrorCopyWithImpl<_$TerminalError>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() none,
    required TResult Function(String? message) error,
    required TResult Function(String name, LxdOperation op) create,
    required TResult Function(LxdInstance instance, LxdFeature feature) init,
    required TResult Function(LxdInstance instance, LxdFeature feature) config,
    required TResult Function(LxdInstance instance, LxdOperation op) stage,
    required TResult Function(LxdInstance instance, LxdOperation op) start,
    required TResult Function(LxdInstance instance, LxdOperation op) restart,
    required TResult Function(LxdInstance instance, Terminal terminal) running,
    required TResult Function(LxdInstance instance, LxdOperation op) stop,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? none,
    TResult Function(String? message)? error,
    TResult Function(String name, LxdOperation op)? create,
    TResult Function(LxdInstance instance, LxdFeature feature)? init,
    TResult Function(LxdInstance instance, LxdFeature feature)? config,
    TResult Function(LxdInstance instance, LxdOperation op)? stage,
    TResult Function(LxdInstance instance, LxdOperation op)? start,
    TResult Function(LxdInstance instance, LxdOperation op)? restart,
    TResult Function(LxdInstance instance, Terminal terminal)? running,
    TResult Function(LxdInstance instance, LxdOperation op)? stop,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? none,
    TResult Function(String? message)? error,
    TResult Function(String name, LxdOperation op)? create,
    TResult Function(LxdInstance instance, LxdFeature feature)? init,
    TResult Function(LxdInstance instance, LxdFeature feature)? config,
    TResult Function(LxdInstance instance, LxdOperation op)? stage,
    TResult Function(LxdInstance instance, LxdOperation op)? start,
    TResult Function(LxdInstance instance, LxdOperation op)? restart,
    TResult Function(LxdInstance instance, Terminal terminal)? running,
    TResult Function(LxdInstance instance, LxdOperation op)? stop,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TerminalNone value) none,
    required TResult Function(TerminalError value) error,
    required TResult Function(TerminalCreate value) create,
    required TResult Function(TerminalInit value) init,
    required TResult Function(TerminalConfig value) config,
    required TResult Function(TerminalStage value) stage,
    required TResult Function(TerminalStart value) start,
    required TResult Function(TerminalRestart value) restart,
    required TResult Function(TerminalRunning value) running,
    required TResult Function(TerminalStop value) stop,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(TerminalNone value)? none,
    TResult Function(TerminalError value)? error,
    TResult Function(TerminalCreate value)? create,
    TResult Function(TerminalInit value)? init,
    TResult Function(TerminalConfig value)? config,
    TResult Function(TerminalStage value)? stage,
    TResult Function(TerminalStart value)? start,
    TResult Function(TerminalRestart value)? restart,
    TResult Function(TerminalRunning value)? running,
    TResult Function(TerminalStop value)? stop,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TerminalNone value)? none,
    TResult Function(TerminalError value)? error,
    TResult Function(TerminalCreate value)? create,
    TResult Function(TerminalInit value)? init,
    TResult Function(TerminalConfig value)? config,
    TResult Function(TerminalStage value)? stage,
    TResult Function(TerminalStart value)? start,
    TResult Function(TerminalRestart value)? restart,
    TResult Function(TerminalRunning value)? running,
    TResult Function(TerminalStop value)? stop,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class TerminalError extends TerminalState {
  const factory TerminalError([final String? message]) = _$TerminalError;
  const TerminalError._() : super._();

  String? get message;
  @JsonKey(ignore: true)
  _$$TerminalErrorCopyWith<_$TerminalError> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$TerminalCreateCopyWith<$Res> {
  factory _$$TerminalCreateCopyWith(
          _$TerminalCreate value, $Res Function(_$TerminalCreate) then) =
      __$$TerminalCreateCopyWithImpl<$Res>;
  $Res call({String name, LxdOperation op});

  $LxdOperationCopyWith<$Res> get op;
}

/// @nodoc
class __$$TerminalCreateCopyWithImpl<$Res>
    extends _$TerminalStateCopyWithImpl<$Res>
    implements _$$TerminalCreateCopyWith<$Res> {
  __$$TerminalCreateCopyWithImpl(
      _$TerminalCreate _value, $Res Function(_$TerminalCreate) _then)
      : super(_value, (v) => _then(v as _$TerminalCreate));

  @override
  _$TerminalCreate get _value => super._value as _$TerminalCreate;

  @override
  $Res call({
    Object? name = freezed,
    Object? op = freezed,
  }) {
    return _then(_$TerminalCreate(
      name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      op == freezed
          ? _value.op
          : op // ignore: cast_nullable_to_non_nullable
              as LxdOperation,
    ));
  }

  @override
  $LxdOperationCopyWith<$Res> get op {
    return $LxdOperationCopyWith<$Res>(_value.op, (value) {
      return _then(_value.copyWith(op: value));
    });
  }
}

/// @nodoc

class _$TerminalCreate extends TerminalCreate {
  const _$TerminalCreate(this.name, this.op) : super._();

  @override
  final String name;
  @override
  final LxdOperation op;

  @override
  String toString() {
    return 'TerminalState.create(name: $name, op: $op)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TerminalCreate &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.op, op));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(op));

  @JsonKey(ignore: true)
  @override
  _$$TerminalCreateCopyWith<_$TerminalCreate> get copyWith =>
      __$$TerminalCreateCopyWithImpl<_$TerminalCreate>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() none,
    required TResult Function(String? message) error,
    required TResult Function(String name, LxdOperation op) create,
    required TResult Function(LxdInstance instance, LxdFeature feature) init,
    required TResult Function(LxdInstance instance, LxdFeature feature) config,
    required TResult Function(LxdInstance instance, LxdOperation op) stage,
    required TResult Function(LxdInstance instance, LxdOperation op) start,
    required TResult Function(LxdInstance instance, LxdOperation op) restart,
    required TResult Function(LxdInstance instance, Terminal terminal) running,
    required TResult Function(LxdInstance instance, LxdOperation op) stop,
  }) {
    return create(name, op);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? none,
    TResult Function(String? message)? error,
    TResult Function(String name, LxdOperation op)? create,
    TResult Function(LxdInstance instance, LxdFeature feature)? init,
    TResult Function(LxdInstance instance, LxdFeature feature)? config,
    TResult Function(LxdInstance instance, LxdOperation op)? stage,
    TResult Function(LxdInstance instance, LxdOperation op)? start,
    TResult Function(LxdInstance instance, LxdOperation op)? restart,
    TResult Function(LxdInstance instance, Terminal terminal)? running,
    TResult Function(LxdInstance instance, LxdOperation op)? stop,
  }) {
    return create?.call(name, op);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? none,
    TResult Function(String? message)? error,
    TResult Function(String name, LxdOperation op)? create,
    TResult Function(LxdInstance instance, LxdFeature feature)? init,
    TResult Function(LxdInstance instance, LxdFeature feature)? config,
    TResult Function(LxdInstance instance, LxdOperation op)? stage,
    TResult Function(LxdInstance instance, LxdOperation op)? start,
    TResult Function(LxdInstance instance, LxdOperation op)? restart,
    TResult Function(LxdInstance instance, Terminal terminal)? running,
    TResult Function(LxdInstance instance, LxdOperation op)? stop,
    required TResult orElse(),
  }) {
    if (create != null) {
      return create(name, op);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TerminalNone value) none,
    required TResult Function(TerminalError value) error,
    required TResult Function(TerminalCreate value) create,
    required TResult Function(TerminalInit value) init,
    required TResult Function(TerminalConfig value) config,
    required TResult Function(TerminalStage value) stage,
    required TResult Function(TerminalStart value) start,
    required TResult Function(TerminalRestart value) restart,
    required TResult Function(TerminalRunning value) running,
    required TResult Function(TerminalStop value) stop,
  }) {
    return create(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(TerminalNone value)? none,
    TResult Function(TerminalError value)? error,
    TResult Function(TerminalCreate value)? create,
    TResult Function(TerminalInit value)? init,
    TResult Function(TerminalConfig value)? config,
    TResult Function(TerminalStage value)? stage,
    TResult Function(TerminalStart value)? start,
    TResult Function(TerminalRestart value)? restart,
    TResult Function(TerminalRunning value)? running,
    TResult Function(TerminalStop value)? stop,
  }) {
    return create?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TerminalNone value)? none,
    TResult Function(TerminalError value)? error,
    TResult Function(TerminalCreate value)? create,
    TResult Function(TerminalInit value)? init,
    TResult Function(TerminalConfig value)? config,
    TResult Function(TerminalStage value)? stage,
    TResult Function(TerminalStart value)? start,
    TResult Function(TerminalRestart value)? restart,
    TResult Function(TerminalRunning value)? running,
    TResult Function(TerminalStop value)? stop,
    required TResult orElse(),
  }) {
    if (create != null) {
      return create(this);
    }
    return orElse();
  }
}

abstract class TerminalCreate extends TerminalState {
  const factory TerminalCreate(final String name, final LxdOperation op) =
      _$TerminalCreate;
  const TerminalCreate._() : super._();

  String get name;
  LxdOperation get op;
  @JsonKey(ignore: true)
  _$$TerminalCreateCopyWith<_$TerminalCreate> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$TerminalInitCopyWith<$Res> {
  factory _$$TerminalInitCopyWith(
          _$TerminalInit value, $Res Function(_$TerminalInit) then) =
      __$$TerminalInitCopyWithImpl<$Res>;
  $Res call({LxdInstance instance, LxdFeature feature});

  $LxdInstanceCopyWith<$Res> get instance;
}

/// @nodoc
class __$$TerminalInitCopyWithImpl<$Res>
    extends _$TerminalStateCopyWithImpl<$Res>
    implements _$$TerminalInitCopyWith<$Res> {
  __$$TerminalInitCopyWithImpl(
      _$TerminalInit _value, $Res Function(_$TerminalInit) _then)
      : super(_value, (v) => _then(v as _$TerminalInit));

  @override
  _$TerminalInit get _value => super._value as _$TerminalInit;

  @override
  $Res call({
    Object? instance = freezed,
    Object? feature = freezed,
  }) {
    return _then(_$TerminalInit(
      instance == freezed
          ? _value.instance
          : instance // ignore: cast_nullable_to_non_nullable
              as LxdInstance,
      feature == freezed
          ? _value.feature
          : feature // ignore: cast_nullable_to_non_nullable
              as LxdFeature,
    ));
  }

  @override
  $LxdInstanceCopyWith<$Res> get instance {
    return $LxdInstanceCopyWith<$Res>(_value.instance, (value) {
      return _then(_value.copyWith(instance: value));
    });
  }
}

/// @nodoc

class _$TerminalInit extends TerminalInit {
  const _$TerminalInit(this.instance, this.feature) : super._();

  @override
  final LxdInstance instance;
  @override
  final LxdFeature feature;

  @override
  String toString() {
    return 'TerminalState.init(instance: $instance, feature: $feature)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TerminalInit &&
            const DeepCollectionEquality().equals(other.instance, instance) &&
            const DeepCollectionEquality().equals(other.feature, feature));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(instance),
      const DeepCollectionEquality().hash(feature));

  @JsonKey(ignore: true)
  @override
  _$$TerminalInitCopyWith<_$TerminalInit> get copyWith =>
      __$$TerminalInitCopyWithImpl<_$TerminalInit>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() none,
    required TResult Function(String? message) error,
    required TResult Function(String name, LxdOperation op) create,
    required TResult Function(LxdInstance instance, LxdFeature feature) init,
    required TResult Function(LxdInstance instance, LxdFeature feature) config,
    required TResult Function(LxdInstance instance, LxdOperation op) stage,
    required TResult Function(LxdInstance instance, LxdOperation op) start,
    required TResult Function(LxdInstance instance, LxdOperation op) restart,
    required TResult Function(LxdInstance instance, Terminal terminal) running,
    required TResult Function(LxdInstance instance, LxdOperation op) stop,
  }) {
    return init(instance, feature);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? none,
    TResult Function(String? message)? error,
    TResult Function(String name, LxdOperation op)? create,
    TResult Function(LxdInstance instance, LxdFeature feature)? init,
    TResult Function(LxdInstance instance, LxdFeature feature)? config,
    TResult Function(LxdInstance instance, LxdOperation op)? stage,
    TResult Function(LxdInstance instance, LxdOperation op)? start,
    TResult Function(LxdInstance instance, LxdOperation op)? restart,
    TResult Function(LxdInstance instance, Terminal terminal)? running,
    TResult Function(LxdInstance instance, LxdOperation op)? stop,
  }) {
    return init?.call(instance, feature);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? none,
    TResult Function(String? message)? error,
    TResult Function(String name, LxdOperation op)? create,
    TResult Function(LxdInstance instance, LxdFeature feature)? init,
    TResult Function(LxdInstance instance, LxdFeature feature)? config,
    TResult Function(LxdInstance instance, LxdOperation op)? stage,
    TResult Function(LxdInstance instance, LxdOperation op)? start,
    TResult Function(LxdInstance instance, LxdOperation op)? restart,
    TResult Function(LxdInstance instance, Terminal terminal)? running,
    TResult Function(LxdInstance instance, LxdOperation op)? stop,
    required TResult orElse(),
  }) {
    if (init != null) {
      return init(instance, feature);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TerminalNone value) none,
    required TResult Function(TerminalError value) error,
    required TResult Function(TerminalCreate value) create,
    required TResult Function(TerminalInit value) init,
    required TResult Function(TerminalConfig value) config,
    required TResult Function(TerminalStage value) stage,
    required TResult Function(TerminalStart value) start,
    required TResult Function(TerminalRestart value) restart,
    required TResult Function(TerminalRunning value) running,
    required TResult Function(TerminalStop value) stop,
  }) {
    return init(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(TerminalNone value)? none,
    TResult Function(TerminalError value)? error,
    TResult Function(TerminalCreate value)? create,
    TResult Function(TerminalInit value)? init,
    TResult Function(TerminalConfig value)? config,
    TResult Function(TerminalStage value)? stage,
    TResult Function(TerminalStart value)? start,
    TResult Function(TerminalRestart value)? restart,
    TResult Function(TerminalRunning value)? running,
    TResult Function(TerminalStop value)? stop,
  }) {
    return init?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TerminalNone value)? none,
    TResult Function(TerminalError value)? error,
    TResult Function(TerminalCreate value)? create,
    TResult Function(TerminalInit value)? init,
    TResult Function(TerminalConfig value)? config,
    TResult Function(TerminalStage value)? stage,
    TResult Function(TerminalStart value)? start,
    TResult Function(TerminalRestart value)? restart,
    TResult Function(TerminalRunning value)? running,
    TResult Function(TerminalStop value)? stop,
    required TResult orElse(),
  }) {
    if (init != null) {
      return init(this);
    }
    return orElse();
  }
}

abstract class TerminalInit extends TerminalState {
  const factory TerminalInit(
      final LxdInstance instance, final LxdFeature feature) = _$TerminalInit;
  const TerminalInit._() : super._();

  LxdInstance get instance;
  LxdFeature get feature;
  @JsonKey(ignore: true)
  _$$TerminalInitCopyWith<_$TerminalInit> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$TerminalConfigCopyWith<$Res> {
  factory _$$TerminalConfigCopyWith(
          _$TerminalConfig value, $Res Function(_$TerminalConfig) then) =
      __$$TerminalConfigCopyWithImpl<$Res>;
  $Res call({LxdInstance instance, LxdFeature feature});

  $LxdInstanceCopyWith<$Res> get instance;
}

/// @nodoc
class __$$TerminalConfigCopyWithImpl<$Res>
    extends _$TerminalStateCopyWithImpl<$Res>
    implements _$$TerminalConfigCopyWith<$Res> {
  __$$TerminalConfigCopyWithImpl(
      _$TerminalConfig _value, $Res Function(_$TerminalConfig) _then)
      : super(_value, (v) => _then(v as _$TerminalConfig));

  @override
  _$TerminalConfig get _value => super._value as _$TerminalConfig;

  @override
  $Res call({
    Object? instance = freezed,
    Object? feature = freezed,
  }) {
    return _then(_$TerminalConfig(
      instance == freezed
          ? _value.instance
          : instance // ignore: cast_nullable_to_non_nullable
              as LxdInstance,
      feature == freezed
          ? _value.feature
          : feature // ignore: cast_nullable_to_non_nullable
              as LxdFeature,
    ));
  }

  @override
  $LxdInstanceCopyWith<$Res> get instance {
    return $LxdInstanceCopyWith<$Res>(_value.instance, (value) {
      return _then(_value.copyWith(instance: value));
    });
  }
}

/// @nodoc

class _$TerminalConfig extends TerminalConfig {
  const _$TerminalConfig(this.instance, this.feature) : super._();

  @override
  final LxdInstance instance;
  @override
  final LxdFeature feature;

  @override
  String toString() {
    return 'TerminalState.config(instance: $instance, feature: $feature)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TerminalConfig &&
            const DeepCollectionEquality().equals(other.instance, instance) &&
            const DeepCollectionEquality().equals(other.feature, feature));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(instance),
      const DeepCollectionEquality().hash(feature));

  @JsonKey(ignore: true)
  @override
  _$$TerminalConfigCopyWith<_$TerminalConfig> get copyWith =>
      __$$TerminalConfigCopyWithImpl<_$TerminalConfig>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() none,
    required TResult Function(String? message) error,
    required TResult Function(String name, LxdOperation op) create,
    required TResult Function(LxdInstance instance, LxdFeature feature) init,
    required TResult Function(LxdInstance instance, LxdFeature feature) config,
    required TResult Function(LxdInstance instance, LxdOperation op) stage,
    required TResult Function(LxdInstance instance, LxdOperation op) start,
    required TResult Function(LxdInstance instance, LxdOperation op) restart,
    required TResult Function(LxdInstance instance, Terminal terminal) running,
    required TResult Function(LxdInstance instance, LxdOperation op) stop,
  }) {
    return config(instance, feature);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? none,
    TResult Function(String? message)? error,
    TResult Function(String name, LxdOperation op)? create,
    TResult Function(LxdInstance instance, LxdFeature feature)? init,
    TResult Function(LxdInstance instance, LxdFeature feature)? config,
    TResult Function(LxdInstance instance, LxdOperation op)? stage,
    TResult Function(LxdInstance instance, LxdOperation op)? start,
    TResult Function(LxdInstance instance, LxdOperation op)? restart,
    TResult Function(LxdInstance instance, Terminal terminal)? running,
    TResult Function(LxdInstance instance, LxdOperation op)? stop,
  }) {
    return config?.call(instance, feature);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? none,
    TResult Function(String? message)? error,
    TResult Function(String name, LxdOperation op)? create,
    TResult Function(LxdInstance instance, LxdFeature feature)? init,
    TResult Function(LxdInstance instance, LxdFeature feature)? config,
    TResult Function(LxdInstance instance, LxdOperation op)? stage,
    TResult Function(LxdInstance instance, LxdOperation op)? start,
    TResult Function(LxdInstance instance, LxdOperation op)? restart,
    TResult Function(LxdInstance instance, Terminal terminal)? running,
    TResult Function(LxdInstance instance, LxdOperation op)? stop,
    required TResult orElse(),
  }) {
    if (config != null) {
      return config(instance, feature);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TerminalNone value) none,
    required TResult Function(TerminalError value) error,
    required TResult Function(TerminalCreate value) create,
    required TResult Function(TerminalInit value) init,
    required TResult Function(TerminalConfig value) config,
    required TResult Function(TerminalStage value) stage,
    required TResult Function(TerminalStart value) start,
    required TResult Function(TerminalRestart value) restart,
    required TResult Function(TerminalRunning value) running,
    required TResult Function(TerminalStop value) stop,
  }) {
    return config(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(TerminalNone value)? none,
    TResult Function(TerminalError value)? error,
    TResult Function(TerminalCreate value)? create,
    TResult Function(TerminalInit value)? init,
    TResult Function(TerminalConfig value)? config,
    TResult Function(TerminalStage value)? stage,
    TResult Function(TerminalStart value)? start,
    TResult Function(TerminalRestart value)? restart,
    TResult Function(TerminalRunning value)? running,
    TResult Function(TerminalStop value)? stop,
  }) {
    return config?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TerminalNone value)? none,
    TResult Function(TerminalError value)? error,
    TResult Function(TerminalCreate value)? create,
    TResult Function(TerminalInit value)? init,
    TResult Function(TerminalConfig value)? config,
    TResult Function(TerminalStage value)? stage,
    TResult Function(TerminalStart value)? start,
    TResult Function(TerminalRestart value)? restart,
    TResult Function(TerminalRunning value)? running,
    TResult Function(TerminalStop value)? stop,
    required TResult orElse(),
  }) {
    if (config != null) {
      return config(this);
    }
    return orElse();
  }
}

abstract class TerminalConfig extends TerminalState {
  const factory TerminalConfig(
      final LxdInstance instance, final LxdFeature feature) = _$TerminalConfig;
  const TerminalConfig._() : super._();

  LxdInstance get instance;
  LxdFeature get feature;
  @JsonKey(ignore: true)
  _$$TerminalConfigCopyWith<_$TerminalConfig> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$TerminalStageCopyWith<$Res> {
  factory _$$TerminalStageCopyWith(
          _$TerminalStage value, $Res Function(_$TerminalStage) then) =
      __$$TerminalStageCopyWithImpl<$Res>;
  $Res call({LxdInstance instance, LxdOperation op});

  $LxdInstanceCopyWith<$Res> get instance;
  $LxdOperationCopyWith<$Res> get op;
}

/// @nodoc
class __$$TerminalStageCopyWithImpl<$Res>
    extends _$TerminalStateCopyWithImpl<$Res>
    implements _$$TerminalStageCopyWith<$Res> {
  __$$TerminalStageCopyWithImpl(
      _$TerminalStage _value, $Res Function(_$TerminalStage) _then)
      : super(_value, (v) => _then(v as _$TerminalStage));

  @override
  _$TerminalStage get _value => super._value as _$TerminalStage;

  @override
  $Res call({
    Object? instance = freezed,
    Object? op = freezed,
  }) {
    return _then(_$TerminalStage(
      instance == freezed
          ? _value.instance
          : instance // ignore: cast_nullable_to_non_nullable
              as LxdInstance,
      op == freezed
          ? _value.op
          : op // ignore: cast_nullable_to_non_nullable
              as LxdOperation,
    ));
  }

  @override
  $LxdInstanceCopyWith<$Res> get instance {
    return $LxdInstanceCopyWith<$Res>(_value.instance, (value) {
      return _then(_value.copyWith(instance: value));
    });
  }

  @override
  $LxdOperationCopyWith<$Res> get op {
    return $LxdOperationCopyWith<$Res>(_value.op, (value) {
      return _then(_value.copyWith(op: value));
    });
  }
}

/// @nodoc

class _$TerminalStage extends TerminalStage {
  const _$TerminalStage(this.instance, this.op) : super._();

  @override
  final LxdInstance instance;
  @override
  final LxdOperation op;

  @override
  String toString() {
    return 'TerminalState.stage(instance: $instance, op: $op)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TerminalStage &&
            const DeepCollectionEquality().equals(other.instance, instance) &&
            const DeepCollectionEquality().equals(other.op, op));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(instance),
      const DeepCollectionEquality().hash(op));

  @JsonKey(ignore: true)
  @override
  _$$TerminalStageCopyWith<_$TerminalStage> get copyWith =>
      __$$TerminalStageCopyWithImpl<_$TerminalStage>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() none,
    required TResult Function(String? message) error,
    required TResult Function(String name, LxdOperation op) create,
    required TResult Function(LxdInstance instance, LxdFeature feature) init,
    required TResult Function(LxdInstance instance, LxdFeature feature) config,
    required TResult Function(LxdInstance instance, LxdOperation op) stage,
    required TResult Function(LxdInstance instance, LxdOperation op) start,
    required TResult Function(LxdInstance instance, LxdOperation op) restart,
    required TResult Function(LxdInstance instance, Terminal terminal) running,
    required TResult Function(LxdInstance instance, LxdOperation op) stop,
  }) {
    return stage(instance, op);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? none,
    TResult Function(String? message)? error,
    TResult Function(String name, LxdOperation op)? create,
    TResult Function(LxdInstance instance, LxdFeature feature)? init,
    TResult Function(LxdInstance instance, LxdFeature feature)? config,
    TResult Function(LxdInstance instance, LxdOperation op)? stage,
    TResult Function(LxdInstance instance, LxdOperation op)? start,
    TResult Function(LxdInstance instance, LxdOperation op)? restart,
    TResult Function(LxdInstance instance, Terminal terminal)? running,
    TResult Function(LxdInstance instance, LxdOperation op)? stop,
  }) {
    return stage?.call(instance, op);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? none,
    TResult Function(String? message)? error,
    TResult Function(String name, LxdOperation op)? create,
    TResult Function(LxdInstance instance, LxdFeature feature)? init,
    TResult Function(LxdInstance instance, LxdFeature feature)? config,
    TResult Function(LxdInstance instance, LxdOperation op)? stage,
    TResult Function(LxdInstance instance, LxdOperation op)? start,
    TResult Function(LxdInstance instance, LxdOperation op)? restart,
    TResult Function(LxdInstance instance, Terminal terminal)? running,
    TResult Function(LxdInstance instance, LxdOperation op)? stop,
    required TResult orElse(),
  }) {
    if (stage != null) {
      return stage(instance, op);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TerminalNone value) none,
    required TResult Function(TerminalError value) error,
    required TResult Function(TerminalCreate value) create,
    required TResult Function(TerminalInit value) init,
    required TResult Function(TerminalConfig value) config,
    required TResult Function(TerminalStage value) stage,
    required TResult Function(TerminalStart value) start,
    required TResult Function(TerminalRestart value) restart,
    required TResult Function(TerminalRunning value) running,
    required TResult Function(TerminalStop value) stop,
  }) {
    return stage(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(TerminalNone value)? none,
    TResult Function(TerminalError value)? error,
    TResult Function(TerminalCreate value)? create,
    TResult Function(TerminalInit value)? init,
    TResult Function(TerminalConfig value)? config,
    TResult Function(TerminalStage value)? stage,
    TResult Function(TerminalStart value)? start,
    TResult Function(TerminalRestart value)? restart,
    TResult Function(TerminalRunning value)? running,
    TResult Function(TerminalStop value)? stop,
  }) {
    return stage?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TerminalNone value)? none,
    TResult Function(TerminalError value)? error,
    TResult Function(TerminalCreate value)? create,
    TResult Function(TerminalInit value)? init,
    TResult Function(TerminalConfig value)? config,
    TResult Function(TerminalStage value)? stage,
    TResult Function(TerminalStart value)? start,
    TResult Function(TerminalRestart value)? restart,
    TResult Function(TerminalRunning value)? running,
    TResult Function(TerminalStop value)? stop,
    required TResult orElse(),
  }) {
    if (stage != null) {
      return stage(this);
    }
    return orElse();
  }
}

abstract class TerminalStage extends TerminalState {
  const factory TerminalStage(
      final LxdInstance instance, final LxdOperation op) = _$TerminalStage;
  const TerminalStage._() : super._();

  LxdInstance get instance;
  LxdOperation get op;
  @JsonKey(ignore: true)
  _$$TerminalStageCopyWith<_$TerminalStage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$TerminalStartCopyWith<$Res> {
  factory _$$TerminalStartCopyWith(
          _$TerminalStart value, $Res Function(_$TerminalStart) then) =
      __$$TerminalStartCopyWithImpl<$Res>;
  $Res call({LxdInstance instance, LxdOperation op});

  $LxdInstanceCopyWith<$Res> get instance;
  $LxdOperationCopyWith<$Res> get op;
}

/// @nodoc
class __$$TerminalStartCopyWithImpl<$Res>
    extends _$TerminalStateCopyWithImpl<$Res>
    implements _$$TerminalStartCopyWith<$Res> {
  __$$TerminalStartCopyWithImpl(
      _$TerminalStart _value, $Res Function(_$TerminalStart) _then)
      : super(_value, (v) => _then(v as _$TerminalStart));

  @override
  _$TerminalStart get _value => super._value as _$TerminalStart;

  @override
  $Res call({
    Object? instance = freezed,
    Object? op = freezed,
  }) {
    return _then(_$TerminalStart(
      instance == freezed
          ? _value.instance
          : instance // ignore: cast_nullable_to_non_nullable
              as LxdInstance,
      op == freezed
          ? _value.op
          : op // ignore: cast_nullable_to_non_nullable
              as LxdOperation,
    ));
  }

  @override
  $LxdInstanceCopyWith<$Res> get instance {
    return $LxdInstanceCopyWith<$Res>(_value.instance, (value) {
      return _then(_value.copyWith(instance: value));
    });
  }

  @override
  $LxdOperationCopyWith<$Res> get op {
    return $LxdOperationCopyWith<$Res>(_value.op, (value) {
      return _then(_value.copyWith(op: value));
    });
  }
}

/// @nodoc

class _$TerminalStart extends TerminalStart {
  const _$TerminalStart(this.instance, this.op) : super._();

  @override
  final LxdInstance instance;
  @override
  final LxdOperation op;

  @override
  String toString() {
    return 'TerminalState.start(instance: $instance, op: $op)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TerminalStart &&
            const DeepCollectionEquality().equals(other.instance, instance) &&
            const DeepCollectionEquality().equals(other.op, op));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(instance),
      const DeepCollectionEquality().hash(op));

  @JsonKey(ignore: true)
  @override
  _$$TerminalStartCopyWith<_$TerminalStart> get copyWith =>
      __$$TerminalStartCopyWithImpl<_$TerminalStart>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() none,
    required TResult Function(String? message) error,
    required TResult Function(String name, LxdOperation op) create,
    required TResult Function(LxdInstance instance, LxdFeature feature) init,
    required TResult Function(LxdInstance instance, LxdFeature feature) config,
    required TResult Function(LxdInstance instance, LxdOperation op) stage,
    required TResult Function(LxdInstance instance, LxdOperation op) start,
    required TResult Function(LxdInstance instance, LxdOperation op) restart,
    required TResult Function(LxdInstance instance, Terminal terminal) running,
    required TResult Function(LxdInstance instance, LxdOperation op) stop,
  }) {
    return start(instance, op);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? none,
    TResult Function(String? message)? error,
    TResult Function(String name, LxdOperation op)? create,
    TResult Function(LxdInstance instance, LxdFeature feature)? init,
    TResult Function(LxdInstance instance, LxdFeature feature)? config,
    TResult Function(LxdInstance instance, LxdOperation op)? stage,
    TResult Function(LxdInstance instance, LxdOperation op)? start,
    TResult Function(LxdInstance instance, LxdOperation op)? restart,
    TResult Function(LxdInstance instance, Terminal terminal)? running,
    TResult Function(LxdInstance instance, LxdOperation op)? stop,
  }) {
    return start?.call(instance, op);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? none,
    TResult Function(String? message)? error,
    TResult Function(String name, LxdOperation op)? create,
    TResult Function(LxdInstance instance, LxdFeature feature)? init,
    TResult Function(LxdInstance instance, LxdFeature feature)? config,
    TResult Function(LxdInstance instance, LxdOperation op)? stage,
    TResult Function(LxdInstance instance, LxdOperation op)? start,
    TResult Function(LxdInstance instance, LxdOperation op)? restart,
    TResult Function(LxdInstance instance, Terminal terminal)? running,
    TResult Function(LxdInstance instance, LxdOperation op)? stop,
    required TResult orElse(),
  }) {
    if (start != null) {
      return start(instance, op);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TerminalNone value) none,
    required TResult Function(TerminalError value) error,
    required TResult Function(TerminalCreate value) create,
    required TResult Function(TerminalInit value) init,
    required TResult Function(TerminalConfig value) config,
    required TResult Function(TerminalStage value) stage,
    required TResult Function(TerminalStart value) start,
    required TResult Function(TerminalRestart value) restart,
    required TResult Function(TerminalRunning value) running,
    required TResult Function(TerminalStop value) stop,
  }) {
    return start(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(TerminalNone value)? none,
    TResult Function(TerminalError value)? error,
    TResult Function(TerminalCreate value)? create,
    TResult Function(TerminalInit value)? init,
    TResult Function(TerminalConfig value)? config,
    TResult Function(TerminalStage value)? stage,
    TResult Function(TerminalStart value)? start,
    TResult Function(TerminalRestart value)? restart,
    TResult Function(TerminalRunning value)? running,
    TResult Function(TerminalStop value)? stop,
  }) {
    return start?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TerminalNone value)? none,
    TResult Function(TerminalError value)? error,
    TResult Function(TerminalCreate value)? create,
    TResult Function(TerminalInit value)? init,
    TResult Function(TerminalConfig value)? config,
    TResult Function(TerminalStage value)? stage,
    TResult Function(TerminalStart value)? start,
    TResult Function(TerminalRestart value)? restart,
    TResult Function(TerminalRunning value)? running,
    TResult Function(TerminalStop value)? stop,
    required TResult orElse(),
  }) {
    if (start != null) {
      return start(this);
    }
    return orElse();
  }
}

abstract class TerminalStart extends TerminalState {
  const factory TerminalStart(
      final LxdInstance instance, final LxdOperation op) = _$TerminalStart;
  const TerminalStart._() : super._();

  LxdInstance get instance;
  LxdOperation get op;
  @JsonKey(ignore: true)
  _$$TerminalStartCopyWith<_$TerminalStart> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$TerminalRestartCopyWith<$Res> {
  factory _$$TerminalRestartCopyWith(
          _$TerminalRestart value, $Res Function(_$TerminalRestart) then) =
      __$$TerminalRestartCopyWithImpl<$Res>;
  $Res call({LxdInstance instance, LxdOperation op});

  $LxdInstanceCopyWith<$Res> get instance;
  $LxdOperationCopyWith<$Res> get op;
}

/// @nodoc
class __$$TerminalRestartCopyWithImpl<$Res>
    extends _$TerminalStateCopyWithImpl<$Res>
    implements _$$TerminalRestartCopyWith<$Res> {
  __$$TerminalRestartCopyWithImpl(
      _$TerminalRestart _value, $Res Function(_$TerminalRestart) _then)
      : super(_value, (v) => _then(v as _$TerminalRestart));

  @override
  _$TerminalRestart get _value => super._value as _$TerminalRestart;

  @override
  $Res call({
    Object? instance = freezed,
    Object? op = freezed,
  }) {
    return _then(_$TerminalRestart(
      instance == freezed
          ? _value.instance
          : instance // ignore: cast_nullable_to_non_nullable
              as LxdInstance,
      op == freezed
          ? _value.op
          : op // ignore: cast_nullable_to_non_nullable
              as LxdOperation,
    ));
  }

  @override
  $LxdInstanceCopyWith<$Res> get instance {
    return $LxdInstanceCopyWith<$Res>(_value.instance, (value) {
      return _then(_value.copyWith(instance: value));
    });
  }

  @override
  $LxdOperationCopyWith<$Res> get op {
    return $LxdOperationCopyWith<$Res>(_value.op, (value) {
      return _then(_value.copyWith(op: value));
    });
  }
}

/// @nodoc

class _$TerminalRestart extends TerminalRestart {
  const _$TerminalRestart(this.instance, this.op) : super._();

  @override
  final LxdInstance instance;
  @override
  final LxdOperation op;

  @override
  String toString() {
    return 'TerminalState.restart(instance: $instance, op: $op)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TerminalRestart &&
            const DeepCollectionEquality().equals(other.instance, instance) &&
            const DeepCollectionEquality().equals(other.op, op));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(instance),
      const DeepCollectionEquality().hash(op));

  @JsonKey(ignore: true)
  @override
  _$$TerminalRestartCopyWith<_$TerminalRestart> get copyWith =>
      __$$TerminalRestartCopyWithImpl<_$TerminalRestart>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() none,
    required TResult Function(String? message) error,
    required TResult Function(String name, LxdOperation op) create,
    required TResult Function(LxdInstance instance, LxdFeature feature) init,
    required TResult Function(LxdInstance instance, LxdFeature feature) config,
    required TResult Function(LxdInstance instance, LxdOperation op) stage,
    required TResult Function(LxdInstance instance, LxdOperation op) start,
    required TResult Function(LxdInstance instance, LxdOperation op) restart,
    required TResult Function(LxdInstance instance, Terminal terminal) running,
    required TResult Function(LxdInstance instance, LxdOperation op) stop,
  }) {
    return restart(instance, op);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? none,
    TResult Function(String? message)? error,
    TResult Function(String name, LxdOperation op)? create,
    TResult Function(LxdInstance instance, LxdFeature feature)? init,
    TResult Function(LxdInstance instance, LxdFeature feature)? config,
    TResult Function(LxdInstance instance, LxdOperation op)? stage,
    TResult Function(LxdInstance instance, LxdOperation op)? start,
    TResult Function(LxdInstance instance, LxdOperation op)? restart,
    TResult Function(LxdInstance instance, Terminal terminal)? running,
    TResult Function(LxdInstance instance, LxdOperation op)? stop,
  }) {
    return restart?.call(instance, op);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? none,
    TResult Function(String? message)? error,
    TResult Function(String name, LxdOperation op)? create,
    TResult Function(LxdInstance instance, LxdFeature feature)? init,
    TResult Function(LxdInstance instance, LxdFeature feature)? config,
    TResult Function(LxdInstance instance, LxdOperation op)? stage,
    TResult Function(LxdInstance instance, LxdOperation op)? start,
    TResult Function(LxdInstance instance, LxdOperation op)? restart,
    TResult Function(LxdInstance instance, Terminal terminal)? running,
    TResult Function(LxdInstance instance, LxdOperation op)? stop,
    required TResult orElse(),
  }) {
    if (restart != null) {
      return restart(instance, op);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TerminalNone value) none,
    required TResult Function(TerminalError value) error,
    required TResult Function(TerminalCreate value) create,
    required TResult Function(TerminalInit value) init,
    required TResult Function(TerminalConfig value) config,
    required TResult Function(TerminalStage value) stage,
    required TResult Function(TerminalStart value) start,
    required TResult Function(TerminalRestart value) restart,
    required TResult Function(TerminalRunning value) running,
    required TResult Function(TerminalStop value) stop,
  }) {
    return restart(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(TerminalNone value)? none,
    TResult Function(TerminalError value)? error,
    TResult Function(TerminalCreate value)? create,
    TResult Function(TerminalInit value)? init,
    TResult Function(TerminalConfig value)? config,
    TResult Function(TerminalStage value)? stage,
    TResult Function(TerminalStart value)? start,
    TResult Function(TerminalRestart value)? restart,
    TResult Function(TerminalRunning value)? running,
    TResult Function(TerminalStop value)? stop,
  }) {
    return restart?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TerminalNone value)? none,
    TResult Function(TerminalError value)? error,
    TResult Function(TerminalCreate value)? create,
    TResult Function(TerminalInit value)? init,
    TResult Function(TerminalConfig value)? config,
    TResult Function(TerminalStage value)? stage,
    TResult Function(TerminalStart value)? start,
    TResult Function(TerminalRestart value)? restart,
    TResult Function(TerminalRunning value)? running,
    TResult Function(TerminalStop value)? stop,
    required TResult orElse(),
  }) {
    if (restart != null) {
      return restart(this);
    }
    return orElse();
  }
}

abstract class TerminalRestart extends TerminalState {
  const factory TerminalRestart(
      final LxdInstance instance, final LxdOperation op) = _$TerminalRestart;
  const TerminalRestart._() : super._();

  LxdInstance get instance;
  LxdOperation get op;
  @JsonKey(ignore: true)
  _$$TerminalRestartCopyWith<_$TerminalRestart> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$TerminalRunningCopyWith<$Res> {
  factory _$$TerminalRunningCopyWith(
          _$TerminalRunning value, $Res Function(_$TerminalRunning) then) =
      __$$TerminalRunningCopyWithImpl<$Res>;
  $Res call({LxdInstance instance, Terminal terminal});

  $LxdInstanceCopyWith<$Res> get instance;
}

/// @nodoc
class __$$TerminalRunningCopyWithImpl<$Res>
    extends _$TerminalStateCopyWithImpl<$Res>
    implements _$$TerminalRunningCopyWith<$Res> {
  __$$TerminalRunningCopyWithImpl(
      _$TerminalRunning _value, $Res Function(_$TerminalRunning) _then)
      : super(_value, (v) => _then(v as _$TerminalRunning));

  @override
  _$TerminalRunning get _value => super._value as _$TerminalRunning;

  @override
  $Res call({
    Object? instance = freezed,
    Object? terminal = freezed,
  }) {
    return _then(_$TerminalRunning(
      instance == freezed
          ? _value.instance
          : instance // ignore: cast_nullable_to_non_nullable
              as LxdInstance,
      terminal == freezed
          ? _value.terminal
          : terminal // ignore: cast_nullable_to_non_nullable
              as Terminal,
    ));
  }

  @override
  $LxdInstanceCopyWith<$Res> get instance {
    return $LxdInstanceCopyWith<$Res>(_value.instance, (value) {
      return _then(_value.copyWith(instance: value));
    });
  }
}

/// @nodoc

class _$TerminalRunning extends TerminalRunning {
  const _$TerminalRunning(this.instance, this.terminal) : super._();

  @override
  final LxdInstance instance;
  @override
  final Terminal terminal;

  @override
  String toString() {
    return 'TerminalState.running(instance: $instance, terminal: $terminal)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TerminalRunning &&
            const DeepCollectionEquality().equals(other.instance, instance) &&
            const DeepCollectionEquality().equals(other.terminal, terminal));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(instance),
      const DeepCollectionEquality().hash(terminal));

  @JsonKey(ignore: true)
  @override
  _$$TerminalRunningCopyWith<_$TerminalRunning> get copyWith =>
      __$$TerminalRunningCopyWithImpl<_$TerminalRunning>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() none,
    required TResult Function(String? message) error,
    required TResult Function(String name, LxdOperation op) create,
    required TResult Function(LxdInstance instance, LxdFeature feature) init,
    required TResult Function(LxdInstance instance, LxdFeature feature) config,
    required TResult Function(LxdInstance instance, LxdOperation op) stage,
    required TResult Function(LxdInstance instance, LxdOperation op) start,
    required TResult Function(LxdInstance instance, LxdOperation op) restart,
    required TResult Function(LxdInstance instance, Terminal terminal) running,
    required TResult Function(LxdInstance instance, LxdOperation op) stop,
  }) {
    return running(instance, terminal);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? none,
    TResult Function(String? message)? error,
    TResult Function(String name, LxdOperation op)? create,
    TResult Function(LxdInstance instance, LxdFeature feature)? init,
    TResult Function(LxdInstance instance, LxdFeature feature)? config,
    TResult Function(LxdInstance instance, LxdOperation op)? stage,
    TResult Function(LxdInstance instance, LxdOperation op)? start,
    TResult Function(LxdInstance instance, LxdOperation op)? restart,
    TResult Function(LxdInstance instance, Terminal terminal)? running,
    TResult Function(LxdInstance instance, LxdOperation op)? stop,
  }) {
    return running?.call(instance, terminal);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? none,
    TResult Function(String? message)? error,
    TResult Function(String name, LxdOperation op)? create,
    TResult Function(LxdInstance instance, LxdFeature feature)? init,
    TResult Function(LxdInstance instance, LxdFeature feature)? config,
    TResult Function(LxdInstance instance, LxdOperation op)? stage,
    TResult Function(LxdInstance instance, LxdOperation op)? start,
    TResult Function(LxdInstance instance, LxdOperation op)? restart,
    TResult Function(LxdInstance instance, Terminal terminal)? running,
    TResult Function(LxdInstance instance, LxdOperation op)? stop,
    required TResult orElse(),
  }) {
    if (running != null) {
      return running(instance, terminal);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TerminalNone value) none,
    required TResult Function(TerminalError value) error,
    required TResult Function(TerminalCreate value) create,
    required TResult Function(TerminalInit value) init,
    required TResult Function(TerminalConfig value) config,
    required TResult Function(TerminalStage value) stage,
    required TResult Function(TerminalStart value) start,
    required TResult Function(TerminalRestart value) restart,
    required TResult Function(TerminalRunning value) running,
    required TResult Function(TerminalStop value) stop,
  }) {
    return running(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(TerminalNone value)? none,
    TResult Function(TerminalError value)? error,
    TResult Function(TerminalCreate value)? create,
    TResult Function(TerminalInit value)? init,
    TResult Function(TerminalConfig value)? config,
    TResult Function(TerminalStage value)? stage,
    TResult Function(TerminalStart value)? start,
    TResult Function(TerminalRestart value)? restart,
    TResult Function(TerminalRunning value)? running,
    TResult Function(TerminalStop value)? stop,
  }) {
    return running?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TerminalNone value)? none,
    TResult Function(TerminalError value)? error,
    TResult Function(TerminalCreate value)? create,
    TResult Function(TerminalInit value)? init,
    TResult Function(TerminalConfig value)? config,
    TResult Function(TerminalStage value)? stage,
    TResult Function(TerminalStart value)? start,
    TResult Function(TerminalRestart value)? restart,
    TResult Function(TerminalRunning value)? running,
    TResult Function(TerminalStop value)? stop,
    required TResult orElse(),
  }) {
    if (running != null) {
      return running(this);
    }
    return orElse();
  }
}

abstract class TerminalRunning extends TerminalState {
  const factory TerminalRunning(
      final LxdInstance instance, final Terminal terminal) = _$TerminalRunning;
  const TerminalRunning._() : super._();

  LxdInstance get instance;
  Terminal get terminal;
  @JsonKey(ignore: true)
  _$$TerminalRunningCopyWith<_$TerminalRunning> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$TerminalStopCopyWith<$Res> {
  factory _$$TerminalStopCopyWith(
          _$TerminalStop value, $Res Function(_$TerminalStop) then) =
      __$$TerminalStopCopyWithImpl<$Res>;
  $Res call({LxdInstance instance, LxdOperation op});

  $LxdInstanceCopyWith<$Res> get instance;
  $LxdOperationCopyWith<$Res> get op;
}

/// @nodoc
class __$$TerminalStopCopyWithImpl<$Res>
    extends _$TerminalStateCopyWithImpl<$Res>
    implements _$$TerminalStopCopyWith<$Res> {
  __$$TerminalStopCopyWithImpl(
      _$TerminalStop _value, $Res Function(_$TerminalStop) _then)
      : super(_value, (v) => _then(v as _$TerminalStop));

  @override
  _$TerminalStop get _value => super._value as _$TerminalStop;

  @override
  $Res call({
    Object? instance = freezed,
    Object? op = freezed,
  }) {
    return _then(_$TerminalStop(
      instance == freezed
          ? _value.instance
          : instance // ignore: cast_nullable_to_non_nullable
              as LxdInstance,
      op == freezed
          ? _value.op
          : op // ignore: cast_nullable_to_non_nullable
              as LxdOperation,
    ));
  }

  @override
  $LxdInstanceCopyWith<$Res> get instance {
    return $LxdInstanceCopyWith<$Res>(_value.instance, (value) {
      return _then(_value.copyWith(instance: value));
    });
  }

  @override
  $LxdOperationCopyWith<$Res> get op {
    return $LxdOperationCopyWith<$Res>(_value.op, (value) {
      return _then(_value.copyWith(op: value));
    });
  }
}

/// @nodoc

class _$TerminalStop extends TerminalStop {
  const _$TerminalStop(this.instance, this.op) : super._();

  @override
  final LxdInstance instance;
  @override
  final LxdOperation op;

  @override
  String toString() {
    return 'TerminalState.stop(instance: $instance, op: $op)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TerminalStop &&
            const DeepCollectionEquality().equals(other.instance, instance) &&
            const DeepCollectionEquality().equals(other.op, op));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(instance),
      const DeepCollectionEquality().hash(op));

  @JsonKey(ignore: true)
  @override
  _$$TerminalStopCopyWith<_$TerminalStop> get copyWith =>
      __$$TerminalStopCopyWithImpl<_$TerminalStop>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() none,
    required TResult Function(String? message) error,
    required TResult Function(String name, LxdOperation op) create,
    required TResult Function(LxdInstance instance, LxdFeature feature) init,
    required TResult Function(LxdInstance instance, LxdFeature feature) config,
    required TResult Function(LxdInstance instance, LxdOperation op) stage,
    required TResult Function(LxdInstance instance, LxdOperation op) start,
    required TResult Function(LxdInstance instance, LxdOperation op) restart,
    required TResult Function(LxdInstance instance, Terminal terminal) running,
    required TResult Function(LxdInstance instance, LxdOperation op) stop,
  }) {
    return stop(instance, op);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? none,
    TResult Function(String? message)? error,
    TResult Function(String name, LxdOperation op)? create,
    TResult Function(LxdInstance instance, LxdFeature feature)? init,
    TResult Function(LxdInstance instance, LxdFeature feature)? config,
    TResult Function(LxdInstance instance, LxdOperation op)? stage,
    TResult Function(LxdInstance instance, LxdOperation op)? start,
    TResult Function(LxdInstance instance, LxdOperation op)? restart,
    TResult Function(LxdInstance instance, Terminal terminal)? running,
    TResult Function(LxdInstance instance, LxdOperation op)? stop,
  }) {
    return stop?.call(instance, op);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? none,
    TResult Function(String? message)? error,
    TResult Function(String name, LxdOperation op)? create,
    TResult Function(LxdInstance instance, LxdFeature feature)? init,
    TResult Function(LxdInstance instance, LxdFeature feature)? config,
    TResult Function(LxdInstance instance, LxdOperation op)? stage,
    TResult Function(LxdInstance instance, LxdOperation op)? start,
    TResult Function(LxdInstance instance, LxdOperation op)? restart,
    TResult Function(LxdInstance instance, Terminal terminal)? running,
    TResult Function(LxdInstance instance, LxdOperation op)? stop,
    required TResult orElse(),
  }) {
    if (stop != null) {
      return stop(instance, op);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TerminalNone value) none,
    required TResult Function(TerminalError value) error,
    required TResult Function(TerminalCreate value) create,
    required TResult Function(TerminalInit value) init,
    required TResult Function(TerminalConfig value) config,
    required TResult Function(TerminalStage value) stage,
    required TResult Function(TerminalStart value) start,
    required TResult Function(TerminalRestart value) restart,
    required TResult Function(TerminalRunning value) running,
    required TResult Function(TerminalStop value) stop,
  }) {
    return stop(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(TerminalNone value)? none,
    TResult Function(TerminalError value)? error,
    TResult Function(TerminalCreate value)? create,
    TResult Function(TerminalInit value)? init,
    TResult Function(TerminalConfig value)? config,
    TResult Function(TerminalStage value)? stage,
    TResult Function(TerminalStart value)? start,
    TResult Function(TerminalRestart value)? restart,
    TResult Function(TerminalRunning value)? running,
    TResult Function(TerminalStop value)? stop,
  }) {
    return stop?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TerminalNone value)? none,
    TResult Function(TerminalError value)? error,
    TResult Function(TerminalCreate value)? create,
    TResult Function(TerminalInit value)? init,
    TResult Function(TerminalConfig value)? config,
    TResult Function(TerminalStage value)? stage,
    TResult Function(TerminalStart value)? start,
    TResult Function(TerminalRestart value)? restart,
    TResult Function(TerminalRunning value)? running,
    TResult Function(TerminalStop value)? stop,
    required TResult orElse(),
  }) {
    if (stop != null) {
      return stop(this);
    }
    return orElse();
  }
}

abstract class TerminalStop extends TerminalState {
  const factory TerminalStop(
      final LxdInstance instance, final LxdOperation op) = _$TerminalStop;
  const TerminalStop._() : super._();

  LxdInstance get instance;
  LxdOperation get op;
  @JsonKey(ignore: true)
  _$$TerminalStopCopyWith<_$TerminalStop> get copyWith =>
      throw _privateConstructorUsedError;
}
