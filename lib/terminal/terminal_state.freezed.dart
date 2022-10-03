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
    required TResult Function(LxdInstance instance, TerminalInstance terminal)
        running,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? none,
    TResult Function(String? message)? error,
    TResult Function(LxdInstance instance, TerminalInstance terminal)? running,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? none,
    TResult Function(String? message)? error,
    TResult Function(LxdInstance instance, TerminalInstance terminal)? running,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TerminalNone value) none,
    required TResult Function(TerminalError value) error,
    required TResult Function(TerminalRunning value) running,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(TerminalNone value)? none,
    TResult Function(TerminalError value)? error,
    TResult Function(TerminalRunning value)? running,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TerminalNone value)? none,
    TResult Function(TerminalError value)? error,
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
    required TResult Function(LxdInstance instance, TerminalInstance terminal)
        running,
  }) {
    return none();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? none,
    TResult Function(String? message)? error,
    TResult Function(LxdInstance instance, TerminalInstance terminal)? running,
  }) {
    return none?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? none,
    TResult Function(String? message)? error,
    TResult Function(LxdInstance instance, TerminalInstance terminal)? running,
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
    required TResult Function(TerminalRunning value) running,
  }) {
    return none(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(TerminalNone value)? none,
    TResult Function(TerminalError value)? error,
    TResult Function(TerminalRunning value)? running,
  }) {
    return none?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TerminalNone value)? none,
    TResult Function(TerminalError value)? error,
    TResult Function(TerminalRunning value)? running,
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
    required TResult Function(LxdInstance instance, TerminalInstance terminal)
        running,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? none,
    TResult Function(String? message)? error,
    TResult Function(LxdInstance instance, TerminalInstance terminal)? running,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? none,
    TResult Function(String? message)? error,
    TResult Function(LxdInstance instance, TerminalInstance terminal)? running,
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
    required TResult Function(TerminalRunning value) running,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(TerminalNone value)? none,
    TResult Function(TerminalError value)? error,
    TResult Function(TerminalRunning value)? running,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TerminalNone value)? none,
    TResult Function(TerminalError value)? error,
    TResult Function(TerminalRunning value)? running,
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
abstract class _$$TerminalRunningCopyWith<$Res> {
  factory _$$TerminalRunningCopyWith(
          _$TerminalRunning value, $Res Function(_$TerminalRunning) then) =
      __$$TerminalRunningCopyWithImpl<$Res>;
  $Res call({LxdInstance instance, TerminalInstance terminal});

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
              as TerminalInstance,
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
  final TerminalInstance terminal;

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
    required TResult Function(LxdInstance instance, TerminalInstance terminal)
        running,
  }) {
    return running(instance, terminal);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? none,
    TResult Function(String? message)? error,
    TResult Function(LxdInstance instance, TerminalInstance terminal)? running,
  }) {
    return running?.call(instance, terminal);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? none,
    TResult Function(String? message)? error,
    TResult Function(LxdInstance instance, TerminalInstance terminal)? running,
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
    required TResult Function(TerminalRunning value) running,
  }) {
    return running(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(TerminalNone value)? none,
    TResult Function(TerminalError value)? error,
    TResult Function(TerminalRunning value)? running,
  }) {
    return running?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TerminalNone value)? none,
    TResult Function(TerminalError value)? error,
    TResult Function(TerminalRunning value)? running,
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
          final LxdInstance instance, final TerminalInstance terminal) =
      _$TerminalRunning;
  const TerminalRunning._() : super._();

  LxdInstance get instance;
  TerminalInstance get terminal;
  @JsonKey(ignore: true)
  _$$TerminalRunningCopyWith<_$TerminalRunning> get copyWith =>
      throw _privateConstructorUsedError;
}
