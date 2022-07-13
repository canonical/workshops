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
    required TResult Function(LxdOperation operation) loading,
    required TResult Function(Terminal terminal) running,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? none,
    TResult Function(String? message)? error,
    TResult Function(LxdOperation operation)? loading,
    TResult Function(Terminal terminal)? running,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? none,
    TResult Function(String? message)? error,
    TResult Function(LxdOperation operation)? loading,
    TResult Function(Terminal terminal)? running,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TerminalNone value) none,
    required TResult Function(TerminalError value) error,
    required TResult Function(TerminalLoading value) loading,
    required TResult Function(TerminalRunning value) running,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(TerminalNone value)? none,
    TResult Function(TerminalError value)? error,
    TResult Function(TerminalLoading value)? loading,
    TResult Function(TerminalRunning value)? running,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TerminalNone value)? none,
    TResult Function(TerminalError value)? error,
    TResult Function(TerminalLoading value)? loading,
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
    required TResult Function(LxdOperation operation) loading,
    required TResult Function(Terminal terminal) running,
  }) {
    return none();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? none,
    TResult Function(String? message)? error,
    TResult Function(LxdOperation operation)? loading,
    TResult Function(Terminal terminal)? running,
  }) {
    return none?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? none,
    TResult Function(String? message)? error,
    TResult Function(LxdOperation operation)? loading,
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
    required TResult Function(TerminalLoading value) loading,
    required TResult Function(TerminalRunning value) running,
  }) {
    return none(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(TerminalNone value)? none,
    TResult Function(TerminalError value)? error,
    TResult Function(TerminalLoading value)? loading,
    TResult Function(TerminalRunning value)? running,
  }) {
    return none?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TerminalNone value)? none,
    TResult Function(TerminalError value)? error,
    TResult Function(TerminalLoading value)? loading,
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
    required TResult Function(LxdOperation operation) loading,
    required TResult Function(Terminal terminal) running,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? none,
    TResult Function(String? message)? error,
    TResult Function(LxdOperation operation)? loading,
    TResult Function(Terminal terminal)? running,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? none,
    TResult Function(String? message)? error,
    TResult Function(LxdOperation operation)? loading,
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
    required TResult Function(TerminalLoading value) loading,
    required TResult Function(TerminalRunning value) running,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(TerminalNone value)? none,
    TResult Function(TerminalError value)? error,
    TResult Function(TerminalLoading value)? loading,
    TResult Function(TerminalRunning value)? running,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TerminalNone value)? none,
    TResult Function(TerminalError value)? error,
    TResult Function(TerminalLoading value)? loading,
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
abstract class _$$TerminalLoadingCopyWith<$Res> {
  factory _$$TerminalLoadingCopyWith(
          _$TerminalLoading value, $Res Function(_$TerminalLoading) then) =
      __$$TerminalLoadingCopyWithImpl<$Res>;
  $Res call({LxdOperation operation});

  $LxdOperationCopyWith<$Res> get operation;
}

/// @nodoc
class __$$TerminalLoadingCopyWithImpl<$Res>
    extends _$TerminalStateCopyWithImpl<$Res>
    implements _$$TerminalLoadingCopyWith<$Res> {
  __$$TerminalLoadingCopyWithImpl(
      _$TerminalLoading _value, $Res Function(_$TerminalLoading) _then)
      : super(_value, (v) => _then(v as _$TerminalLoading));

  @override
  _$TerminalLoading get _value => super._value as _$TerminalLoading;

  @override
  $Res call({
    Object? operation = freezed,
  }) {
    return _then(_$TerminalLoading(
      operation == freezed
          ? _value.operation
          : operation // ignore: cast_nullable_to_non_nullable
              as LxdOperation,
    ));
  }

  @override
  $LxdOperationCopyWith<$Res> get operation {
    return $LxdOperationCopyWith<$Res>(_value.operation, (value) {
      return _then(_value.copyWith(operation: value));
    });
  }
}

/// @nodoc

class _$TerminalLoading implements TerminalLoading {
  const _$TerminalLoading(this.operation);

  @override
  final LxdOperation operation;

  @override
  String toString() {
    return 'TerminalState.loading(operation: $operation)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TerminalLoading &&
            const DeepCollectionEquality().equals(other.operation, operation));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(operation));

  @JsonKey(ignore: true)
  @override
  _$$TerminalLoadingCopyWith<_$TerminalLoading> get copyWith =>
      __$$TerminalLoadingCopyWithImpl<_$TerminalLoading>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() none,
    required TResult Function(String? message) error,
    required TResult Function(LxdOperation operation) loading,
    required TResult Function(Terminal terminal) running,
  }) {
    return loading(operation);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? none,
    TResult Function(String? message)? error,
    TResult Function(LxdOperation operation)? loading,
    TResult Function(Terminal terminal)? running,
  }) {
    return loading?.call(operation);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? none,
    TResult Function(String? message)? error,
    TResult Function(LxdOperation operation)? loading,
    TResult Function(Terminal terminal)? running,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(operation);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TerminalNone value) none,
    required TResult Function(TerminalError value) error,
    required TResult Function(TerminalLoading value) loading,
    required TResult Function(TerminalRunning value) running,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(TerminalNone value)? none,
    TResult Function(TerminalError value)? error,
    TResult Function(TerminalLoading value)? loading,
    TResult Function(TerminalRunning value)? running,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TerminalNone value)? none,
    TResult Function(TerminalError value)? error,
    TResult Function(TerminalLoading value)? loading,
    TResult Function(TerminalRunning value)? running,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class TerminalLoading implements TerminalState {
  const factory TerminalLoading(final LxdOperation operation) =
      _$TerminalLoading;

  LxdOperation get operation;
  @JsonKey(ignore: true)
  _$$TerminalLoadingCopyWith<_$TerminalLoading> get copyWith =>
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
    required TResult Function(LxdOperation operation) loading,
    required TResult Function(Terminal terminal) running,
  }) {
    return running(terminal);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? none,
    TResult Function(String? message)? error,
    TResult Function(LxdOperation operation)? loading,
    TResult Function(Terminal terminal)? running,
  }) {
    return running?.call(terminal);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? none,
    TResult Function(String? message)? error,
    TResult Function(LxdOperation operation)? loading,
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
    required TResult Function(TerminalLoading value) loading,
    required TResult Function(TerminalRunning value) running,
  }) {
    return running(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(TerminalNone value)? none,
    TResult Function(TerminalError value)? error,
    TResult Function(TerminalLoading value)? loading,
    TResult Function(TerminalRunning value)? running,
  }) {
    return running?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TerminalNone value)? none,
    TResult Function(TerminalError value)? error,
    TResult Function(TerminalLoading value)? loading,
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
