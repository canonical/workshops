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
    required TResult Function(LxdOperation op) create,
    required TResult Function(String name) config,
    required TResult Function(LxdOperation op) start,
    required TResult Function(LxdOperation op) restart,
    required TResult Function(Terminal terminal) running,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? none,
    TResult Function(String? message)? error,
    TResult Function(LxdOperation op)? create,
    TResult Function(String name)? config,
    TResult Function(LxdOperation op)? start,
    TResult Function(LxdOperation op)? restart,
    TResult Function(Terminal terminal)? running,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? none,
    TResult Function(String? message)? error,
    TResult Function(LxdOperation op)? create,
    TResult Function(String name)? config,
    TResult Function(LxdOperation op)? start,
    TResult Function(LxdOperation op)? restart,
    TResult Function(Terminal terminal)? running,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TerminalNone value) none,
    required TResult Function(TerminalError value) error,
    required TResult Function(TerminalCreate value) create,
    required TResult Function(TerminalConfig value) config,
    required TResult Function(TerminalStart value) start,
    required TResult Function(TerminalRestart value) restart,
    required TResult Function(TerminalRunning value) running,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(TerminalNone value)? none,
    TResult Function(TerminalError value)? error,
    TResult Function(TerminalCreate value)? create,
    TResult Function(TerminalConfig value)? config,
    TResult Function(TerminalStart value)? start,
    TResult Function(TerminalRestart value)? restart,
    TResult Function(TerminalRunning value)? running,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TerminalNone value)? none,
    TResult Function(TerminalError value)? error,
    TResult Function(TerminalCreate value)? create,
    TResult Function(TerminalConfig value)? config,
    TResult Function(TerminalStart value)? start,
    TResult Function(TerminalRestart value)? restart,
    TResult Function(TerminalRunning value)? running,
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

class _$TerminalNone implements TerminalNone {
  const _$TerminalNone();

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
    required TResult Function(LxdOperation op) create,
    required TResult Function(String name) config,
    required TResult Function(LxdOperation op) start,
    required TResult Function(LxdOperation op) restart,
    required TResult Function(Terminal terminal) running,
  }) {
    return none();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? none,
    TResult Function(String? message)? error,
    TResult Function(LxdOperation op)? create,
    TResult Function(String name)? config,
    TResult Function(LxdOperation op)? start,
    TResult Function(LxdOperation op)? restart,
    TResult Function(Terminal terminal)? running,
  }) {
    return none?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? none,
    TResult Function(String? message)? error,
    TResult Function(LxdOperation op)? create,
    TResult Function(String name)? config,
    TResult Function(LxdOperation op)? start,
    TResult Function(LxdOperation op)? restart,
    TResult Function(Terminal terminal)? running,
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
    required TResult Function(TerminalConfig value) config,
    required TResult Function(TerminalStart value) start,
    required TResult Function(TerminalRestart value) restart,
    required TResult Function(TerminalRunning value) running,
  }) {
    return none(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(TerminalNone value)? none,
    TResult Function(TerminalError value)? error,
    TResult Function(TerminalCreate value)? create,
    TResult Function(TerminalConfig value)? config,
    TResult Function(TerminalStart value)? start,
    TResult Function(TerminalRestart value)? restart,
    TResult Function(TerminalRunning value)? running,
  }) {
    return none?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TerminalNone value)? none,
    TResult Function(TerminalError value)? error,
    TResult Function(TerminalCreate value)? create,
    TResult Function(TerminalConfig value)? config,
    TResult Function(TerminalStart value)? start,
    TResult Function(TerminalRestart value)? restart,
    TResult Function(TerminalRunning value)? running,
    required TResult orElse(),
  }) {
    if (none != null) {
      return none(this);
    }
    return orElse();
  }
}

abstract class TerminalNone implements TerminalState {
  const factory TerminalNone() = _$TerminalNone;
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

class _$TerminalError implements TerminalError {
  const _$TerminalError([this.message]);

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
    required TResult Function(LxdOperation op) create,
    required TResult Function(String name) config,
    required TResult Function(LxdOperation op) start,
    required TResult Function(LxdOperation op) restart,
    required TResult Function(Terminal terminal) running,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? none,
    TResult Function(String? message)? error,
    TResult Function(LxdOperation op)? create,
    TResult Function(String name)? config,
    TResult Function(LxdOperation op)? start,
    TResult Function(LxdOperation op)? restart,
    TResult Function(Terminal terminal)? running,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? none,
    TResult Function(String? message)? error,
    TResult Function(LxdOperation op)? create,
    TResult Function(String name)? config,
    TResult Function(LxdOperation op)? start,
    TResult Function(LxdOperation op)? restart,
    TResult Function(Terminal terminal)? running,
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
    required TResult Function(TerminalConfig value) config,
    required TResult Function(TerminalStart value) start,
    required TResult Function(TerminalRestart value) restart,
    required TResult Function(TerminalRunning value) running,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(TerminalNone value)? none,
    TResult Function(TerminalError value)? error,
    TResult Function(TerminalCreate value)? create,
    TResult Function(TerminalConfig value)? config,
    TResult Function(TerminalStart value)? start,
    TResult Function(TerminalRestart value)? restart,
    TResult Function(TerminalRunning value)? running,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TerminalNone value)? none,
    TResult Function(TerminalError value)? error,
    TResult Function(TerminalCreate value)? create,
    TResult Function(TerminalConfig value)? config,
    TResult Function(TerminalStart value)? start,
    TResult Function(TerminalRestart value)? restart,
    TResult Function(TerminalRunning value)? running,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class TerminalError implements TerminalState {
  const factory TerminalError([final String? message]) = _$TerminalError;

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
  $Res call({LxdOperation op});

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
    Object? op = freezed,
  }) {
    return _then(_$TerminalCreate(
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

class _$TerminalCreate implements TerminalCreate {
  const _$TerminalCreate(this.op);

  @override
  final LxdOperation op;

  @override
  String toString() {
    return 'TerminalState.create(op: $op)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TerminalCreate &&
            const DeepCollectionEquality().equals(other.op, op));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(op));

  @JsonKey(ignore: true)
  @override
  _$$TerminalCreateCopyWith<_$TerminalCreate> get copyWith =>
      __$$TerminalCreateCopyWithImpl<_$TerminalCreate>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() none,
    required TResult Function(String? message) error,
    required TResult Function(LxdOperation op) create,
    required TResult Function(String name) config,
    required TResult Function(LxdOperation op) start,
    required TResult Function(LxdOperation op) restart,
    required TResult Function(Terminal terminal) running,
  }) {
    return create(op);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? none,
    TResult Function(String? message)? error,
    TResult Function(LxdOperation op)? create,
    TResult Function(String name)? config,
    TResult Function(LxdOperation op)? start,
    TResult Function(LxdOperation op)? restart,
    TResult Function(Terminal terminal)? running,
  }) {
    return create?.call(op);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? none,
    TResult Function(String? message)? error,
    TResult Function(LxdOperation op)? create,
    TResult Function(String name)? config,
    TResult Function(LxdOperation op)? start,
    TResult Function(LxdOperation op)? restart,
    TResult Function(Terminal terminal)? running,
    required TResult orElse(),
  }) {
    if (create != null) {
      return create(op);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TerminalNone value) none,
    required TResult Function(TerminalError value) error,
    required TResult Function(TerminalCreate value) create,
    required TResult Function(TerminalConfig value) config,
    required TResult Function(TerminalStart value) start,
    required TResult Function(TerminalRestart value) restart,
    required TResult Function(TerminalRunning value) running,
  }) {
    return create(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(TerminalNone value)? none,
    TResult Function(TerminalError value)? error,
    TResult Function(TerminalCreate value)? create,
    TResult Function(TerminalConfig value)? config,
    TResult Function(TerminalStart value)? start,
    TResult Function(TerminalRestart value)? restart,
    TResult Function(TerminalRunning value)? running,
  }) {
    return create?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TerminalNone value)? none,
    TResult Function(TerminalError value)? error,
    TResult Function(TerminalCreate value)? create,
    TResult Function(TerminalConfig value)? config,
    TResult Function(TerminalStart value)? start,
    TResult Function(TerminalRestart value)? restart,
    TResult Function(TerminalRunning value)? running,
    required TResult orElse(),
  }) {
    if (create != null) {
      return create(this);
    }
    return orElse();
  }
}

abstract class TerminalCreate implements TerminalState {
  const factory TerminalCreate(final LxdOperation op) = _$TerminalCreate;

  LxdOperation get op;
  @JsonKey(ignore: true)
  _$$TerminalCreateCopyWith<_$TerminalCreate> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$TerminalConfigCopyWith<$Res> {
  factory _$$TerminalConfigCopyWith(
          _$TerminalConfig value, $Res Function(_$TerminalConfig) then) =
      __$$TerminalConfigCopyWithImpl<$Res>;
  $Res call({String name});
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
    Object? name = freezed,
  }) {
    return _then(_$TerminalConfig(
      name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$TerminalConfig implements TerminalConfig {
  const _$TerminalConfig(this.name);

  @override
  final String name;

  @override
  String toString() {
    return 'TerminalState.config(name: $name)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TerminalConfig &&
            const DeepCollectionEquality().equals(other.name, name));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(name));

  @JsonKey(ignore: true)
  @override
  _$$TerminalConfigCopyWith<_$TerminalConfig> get copyWith =>
      __$$TerminalConfigCopyWithImpl<_$TerminalConfig>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() none,
    required TResult Function(String? message) error,
    required TResult Function(LxdOperation op) create,
    required TResult Function(String name) config,
    required TResult Function(LxdOperation op) start,
    required TResult Function(LxdOperation op) restart,
    required TResult Function(Terminal terminal) running,
  }) {
    return config(name);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? none,
    TResult Function(String? message)? error,
    TResult Function(LxdOperation op)? create,
    TResult Function(String name)? config,
    TResult Function(LxdOperation op)? start,
    TResult Function(LxdOperation op)? restart,
    TResult Function(Terminal terminal)? running,
  }) {
    return config?.call(name);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? none,
    TResult Function(String? message)? error,
    TResult Function(LxdOperation op)? create,
    TResult Function(String name)? config,
    TResult Function(LxdOperation op)? start,
    TResult Function(LxdOperation op)? restart,
    TResult Function(Terminal terminal)? running,
    required TResult orElse(),
  }) {
    if (config != null) {
      return config(name);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TerminalNone value) none,
    required TResult Function(TerminalError value) error,
    required TResult Function(TerminalCreate value) create,
    required TResult Function(TerminalConfig value) config,
    required TResult Function(TerminalStart value) start,
    required TResult Function(TerminalRestart value) restart,
    required TResult Function(TerminalRunning value) running,
  }) {
    return config(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(TerminalNone value)? none,
    TResult Function(TerminalError value)? error,
    TResult Function(TerminalCreate value)? create,
    TResult Function(TerminalConfig value)? config,
    TResult Function(TerminalStart value)? start,
    TResult Function(TerminalRestart value)? restart,
    TResult Function(TerminalRunning value)? running,
  }) {
    return config?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TerminalNone value)? none,
    TResult Function(TerminalError value)? error,
    TResult Function(TerminalCreate value)? create,
    TResult Function(TerminalConfig value)? config,
    TResult Function(TerminalStart value)? start,
    TResult Function(TerminalRestart value)? restart,
    TResult Function(TerminalRunning value)? running,
    required TResult orElse(),
  }) {
    if (config != null) {
      return config(this);
    }
    return orElse();
  }
}

abstract class TerminalConfig implements TerminalState {
  const factory TerminalConfig(final String name) = _$TerminalConfig;

  String get name;
  @JsonKey(ignore: true)
  _$$TerminalConfigCopyWith<_$TerminalConfig> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$TerminalStartCopyWith<$Res> {
  factory _$$TerminalStartCopyWith(
          _$TerminalStart value, $Res Function(_$TerminalStart) then) =
      __$$TerminalStartCopyWithImpl<$Res>;
  $Res call({LxdOperation op});

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
    Object? op = freezed,
  }) {
    return _then(_$TerminalStart(
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

class _$TerminalStart implements TerminalStart {
  const _$TerminalStart(this.op);

  @override
  final LxdOperation op;

  @override
  String toString() {
    return 'TerminalState.start(op: $op)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TerminalStart &&
            const DeepCollectionEquality().equals(other.op, op));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(op));

  @JsonKey(ignore: true)
  @override
  _$$TerminalStartCopyWith<_$TerminalStart> get copyWith =>
      __$$TerminalStartCopyWithImpl<_$TerminalStart>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() none,
    required TResult Function(String? message) error,
    required TResult Function(LxdOperation op) create,
    required TResult Function(String name) config,
    required TResult Function(LxdOperation op) start,
    required TResult Function(LxdOperation op) restart,
    required TResult Function(Terminal terminal) running,
  }) {
    return start(op);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? none,
    TResult Function(String? message)? error,
    TResult Function(LxdOperation op)? create,
    TResult Function(String name)? config,
    TResult Function(LxdOperation op)? start,
    TResult Function(LxdOperation op)? restart,
    TResult Function(Terminal terminal)? running,
  }) {
    return start?.call(op);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? none,
    TResult Function(String? message)? error,
    TResult Function(LxdOperation op)? create,
    TResult Function(String name)? config,
    TResult Function(LxdOperation op)? start,
    TResult Function(LxdOperation op)? restart,
    TResult Function(Terminal terminal)? running,
    required TResult orElse(),
  }) {
    if (start != null) {
      return start(op);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TerminalNone value) none,
    required TResult Function(TerminalError value) error,
    required TResult Function(TerminalCreate value) create,
    required TResult Function(TerminalConfig value) config,
    required TResult Function(TerminalStart value) start,
    required TResult Function(TerminalRestart value) restart,
    required TResult Function(TerminalRunning value) running,
  }) {
    return start(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(TerminalNone value)? none,
    TResult Function(TerminalError value)? error,
    TResult Function(TerminalCreate value)? create,
    TResult Function(TerminalConfig value)? config,
    TResult Function(TerminalStart value)? start,
    TResult Function(TerminalRestart value)? restart,
    TResult Function(TerminalRunning value)? running,
  }) {
    return start?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TerminalNone value)? none,
    TResult Function(TerminalError value)? error,
    TResult Function(TerminalCreate value)? create,
    TResult Function(TerminalConfig value)? config,
    TResult Function(TerminalStart value)? start,
    TResult Function(TerminalRestart value)? restart,
    TResult Function(TerminalRunning value)? running,
    required TResult orElse(),
  }) {
    if (start != null) {
      return start(this);
    }
    return orElse();
  }
}

abstract class TerminalStart implements TerminalState {
  const factory TerminalStart(final LxdOperation op) = _$TerminalStart;

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
  $Res call({LxdOperation op});

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
    Object? op = freezed,
  }) {
    return _then(_$TerminalRestart(
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

class _$TerminalRestart implements TerminalRestart {
  const _$TerminalRestart(this.op);

  @override
  final LxdOperation op;

  @override
  String toString() {
    return 'TerminalState.restart(op: $op)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TerminalRestart &&
            const DeepCollectionEquality().equals(other.op, op));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(op));

  @JsonKey(ignore: true)
  @override
  _$$TerminalRestartCopyWith<_$TerminalRestart> get copyWith =>
      __$$TerminalRestartCopyWithImpl<_$TerminalRestart>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() none,
    required TResult Function(String? message) error,
    required TResult Function(LxdOperation op) create,
    required TResult Function(String name) config,
    required TResult Function(LxdOperation op) start,
    required TResult Function(LxdOperation op) restart,
    required TResult Function(Terminal terminal) running,
  }) {
    return restart(op);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? none,
    TResult Function(String? message)? error,
    TResult Function(LxdOperation op)? create,
    TResult Function(String name)? config,
    TResult Function(LxdOperation op)? start,
    TResult Function(LxdOperation op)? restart,
    TResult Function(Terminal terminal)? running,
  }) {
    return restart?.call(op);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? none,
    TResult Function(String? message)? error,
    TResult Function(LxdOperation op)? create,
    TResult Function(String name)? config,
    TResult Function(LxdOperation op)? start,
    TResult Function(LxdOperation op)? restart,
    TResult Function(Terminal terminal)? running,
    required TResult orElse(),
  }) {
    if (restart != null) {
      return restart(op);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TerminalNone value) none,
    required TResult Function(TerminalError value) error,
    required TResult Function(TerminalCreate value) create,
    required TResult Function(TerminalConfig value) config,
    required TResult Function(TerminalStart value) start,
    required TResult Function(TerminalRestart value) restart,
    required TResult Function(TerminalRunning value) running,
  }) {
    return restart(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(TerminalNone value)? none,
    TResult Function(TerminalError value)? error,
    TResult Function(TerminalCreate value)? create,
    TResult Function(TerminalConfig value)? config,
    TResult Function(TerminalStart value)? start,
    TResult Function(TerminalRestart value)? restart,
    TResult Function(TerminalRunning value)? running,
  }) {
    return restart?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TerminalNone value)? none,
    TResult Function(TerminalError value)? error,
    TResult Function(TerminalCreate value)? create,
    TResult Function(TerminalConfig value)? config,
    TResult Function(TerminalStart value)? start,
    TResult Function(TerminalRestart value)? restart,
    TResult Function(TerminalRunning value)? running,
    required TResult orElse(),
  }) {
    if (restart != null) {
      return restart(this);
    }
    return orElse();
  }
}

abstract class TerminalRestart implements TerminalState {
  const factory TerminalRestart(final LxdOperation op) = _$TerminalRestart;

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
  $Res call({Terminal terminal});
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
    Object? terminal = freezed,
  }) {
    return _then(_$TerminalRunning(
      terminal == freezed
          ? _value.terminal
          : terminal // ignore: cast_nullable_to_non_nullable
              as Terminal,
    ));
  }
}

/// @nodoc

class _$TerminalRunning implements TerminalRunning {
  const _$TerminalRunning(this.terminal);

  @override
  final Terminal terminal;

  @override
  String toString() {
    return 'TerminalState.running(terminal: $terminal)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TerminalRunning &&
            const DeepCollectionEquality().equals(other.terminal, terminal));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(terminal));

  @JsonKey(ignore: true)
  @override
  _$$TerminalRunningCopyWith<_$TerminalRunning> get copyWith =>
      __$$TerminalRunningCopyWithImpl<_$TerminalRunning>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() none,
    required TResult Function(String? message) error,
    required TResult Function(LxdOperation op) create,
    required TResult Function(String name) config,
    required TResult Function(LxdOperation op) start,
    required TResult Function(LxdOperation op) restart,
    required TResult Function(Terminal terminal) running,
  }) {
    return running(terminal);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? none,
    TResult Function(String? message)? error,
    TResult Function(LxdOperation op)? create,
    TResult Function(String name)? config,
    TResult Function(LxdOperation op)? start,
    TResult Function(LxdOperation op)? restart,
    TResult Function(Terminal terminal)? running,
  }) {
    return running?.call(terminal);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? none,
    TResult Function(String? message)? error,
    TResult Function(LxdOperation op)? create,
    TResult Function(String name)? config,
    TResult Function(LxdOperation op)? start,
    TResult Function(LxdOperation op)? restart,
    TResult Function(Terminal terminal)? running,
    required TResult orElse(),
  }) {
    if (running != null) {
      return running(terminal);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TerminalNone value) none,
    required TResult Function(TerminalError value) error,
    required TResult Function(TerminalCreate value) create,
    required TResult Function(TerminalConfig value) config,
    required TResult Function(TerminalStart value) start,
    required TResult Function(TerminalRestart value) restart,
    required TResult Function(TerminalRunning value) running,
  }) {
    return running(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(TerminalNone value)? none,
    TResult Function(TerminalError value)? error,
    TResult Function(TerminalCreate value)? create,
    TResult Function(TerminalConfig value)? config,
    TResult Function(TerminalStart value)? start,
    TResult Function(TerminalRestart value)? restart,
    TResult Function(TerminalRunning value)? running,
  }) {
    return running?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TerminalNone value)? none,
    TResult Function(TerminalError value)? error,
    TResult Function(TerminalCreate value)? create,
    TResult Function(TerminalConfig value)? config,
    TResult Function(TerminalStart value)? start,
    TResult Function(TerminalRestart value)? restart,
    TResult Function(TerminalRunning value)? running,
    required TResult orElse(),
  }) {
    if (running != null) {
      return running(this);
    }
    return orElse();
  }
}

abstract class TerminalRunning implements TerminalState {
  const factory TerminalRunning(final Terminal terminal) = _$TerminalRunning;

  Terminal get terminal;
  @JsonKey(ignore: true)
  _$$TerminalRunningCopyWith<_$TerminalRunning> get copyWith =>
      throw _privateConstructorUsedError;
}
