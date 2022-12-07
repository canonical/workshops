// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

LxdResponse _$LxdResponseFromJson(Map<String, dynamic> json) {
  switch (json['type']) {
    case 'sync':
      return LxdSyncResponse.fromJson(json);
    case 'async':
      return LxdAsyncResponse.fromJson(json);
    case 'error':
      return LxdErrorResponse.fromJson(json);

    default:
      throw CheckedFromJsonException(
          json, 'type', 'LxdResponse', 'Invalid union type "${json['type']}"!');
  }
}

/// @nodoc
mixin _$LxdResponse {
  dynamic get metadata => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String status, int statusCode, dynamic metadata)
        sync,
    required TResult Function(String status, int statusCode, String operation,
            Map<String, dynamic> metadata)
        async,
    required TResult Function(
            String error, int errorCode, Map<String, dynamic>? metadata)
        error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String status, int statusCode, dynamic metadata)? sync,
    TResult? Function(String status, int statusCode, String operation,
            Map<String, dynamic> metadata)?
        async,
    TResult? Function(
            String error, int errorCode, Map<String, dynamic>? metadata)?
        error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String status, int statusCode, dynamic metadata)? sync,
    TResult Function(String status, int statusCode, String operation,
            Map<String, dynamic> metadata)?
        async,
    TResult Function(
            String error, int errorCode, Map<String, dynamic>? metadata)?
        error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LxdSyncResponse value) sync,
    required TResult Function(LxdAsyncResponse value) async,
    required TResult Function(LxdErrorResponse value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LxdSyncResponse value)? sync,
    TResult? Function(LxdAsyncResponse value)? async,
    TResult? Function(LxdErrorResponse value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LxdSyncResponse value)? sync,
    TResult Function(LxdAsyncResponse value)? async,
    TResult Function(LxdErrorResponse value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LxdResponseCopyWith<$Res> {
  factory $LxdResponseCopyWith(
          LxdResponse value, $Res Function(LxdResponse) then) =
      _$LxdResponseCopyWithImpl<$Res, LxdResponse>;
}

/// @nodoc
class _$LxdResponseCopyWithImpl<$Res, $Val extends LxdResponse>
    implements $LxdResponseCopyWith<$Res> {
  _$LxdResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$LxdSyncResponseCopyWith<$Res> {
  factory _$$LxdSyncResponseCopyWith(
          _$LxdSyncResponse value, $Res Function(_$LxdSyncResponse) then) =
      __$$LxdSyncResponseCopyWithImpl<$Res>;
  @useResult
  $Res call({String status, int statusCode, dynamic metadata});
}

/// @nodoc
class __$$LxdSyncResponseCopyWithImpl<$Res>
    extends _$LxdResponseCopyWithImpl<$Res, _$LxdSyncResponse>
    implements _$$LxdSyncResponseCopyWith<$Res> {
  __$$LxdSyncResponseCopyWithImpl(
      _$LxdSyncResponse _value, $Res Function(_$LxdSyncResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? statusCode = null,
    Object? metadata = freezed,
  }) {
    return _then(_$LxdSyncResponse(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      statusCode: null == statusCode
          ? _value.statusCode
          : statusCode // ignore: cast_nullable_to_non_nullable
              as int,
      metadata: freezed == metadata
          ? _value.metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LxdSyncResponse implements LxdSyncResponse {
  const _$LxdSyncResponse(
      {required this.status,
      required this.statusCode,
      required this.metadata,
      final String? $type})
      : $type = $type ?? 'sync';

  factory _$LxdSyncResponse.fromJson(Map<String, dynamic> json) =>
      _$$LxdSyncResponseFromJson(json);

  @override
  final String status;
  @override
  final int statusCode;
  @override
  final dynamic metadata;

  @JsonKey(name: 'type')
  final String $type;

  @override
  String toString() {
    return 'LxdResponse.sync(status: $status, statusCode: $statusCode, metadata: $metadata)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LxdSyncResponse &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.statusCode, statusCode) ||
                other.statusCode == statusCode) &&
            const DeepCollectionEquality().equals(other.metadata, metadata));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, status, statusCode,
      const DeepCollectionEquality().hash(metadata));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LxdSyncResponseCopyWith<_$LxdSyncResponse> get copyWith =>
      __$$LxdSyncResponseCopyWithImpl<_$LxdSyncResponse>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String status, int statusCode, dynamic metadata)
        sync,
    required TResult Function(String status, int statusCode, String operation,
            Map<String, dynamic> metadata)
        async,
    required TResult Function(
            String error, int errorCode, Map<String, dynamic>? metadata)
        error,
  }) {
    return sync(status, statusCode, metadata);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String status, int statusCode, dynamic metadata)? sync,
    TResult? Function(String status, int statusCode, String operation,
            Map<String, dynamic> metadata)?
        async,
    TResult? Function(
            String error, int errorCode, Map<String, dynamic>? metadata)?
        error,
  }) {
    return sync?.call(status, statusCode, metadata);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String status, int statusCode, dynamic metadata)? sync,
    TResult Function(String status, int statusCode, String operation,
            Map<String, dynamic> metadata)?
        async,
    TResult Function(
            String error, int errorCode, Map<String, dynamic>? metadata)?
        error,
    required TResult orElse(),
  }) {
    if (sync != null) {
      return sync(status, statusCode, metadata);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LxdSyncResponse value) sync,
    required TResult Function(LxdAsyncResponse value) async,
    required TResult Function(LxdErrorResponse value) error,
  }) {
    return sync(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LxdSyncResponse value)? sync,
    TResult? Function(LxdAsyncResponse value)? async,
    TResult? Function(LxdErrorResponse value)? error,
  }) {
    return sync?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LxdSyncResponse value)? sync,
    TResult Function(LxdAsyncResponse value)? async,
    TResult Function(LxdErrorResponse value)? error,
    required TResult orElse(),
  }) {
    if (sync != null) {
      return sync(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$LxdSyncResponseToJson(
      this,
    );
  }
}

abstract class LxdSyncResponse implements LxdResponse {
  const factory LxdSyncResponse(
      {required final String status,
      required final int statusCode,
      required final dynamic metadata}) = _$LxdSyncResponse;

  factory LxdSyncResponse.fromJson(Map<String, dynamic> json) =
      _$LxdSyncResponse.fromJson;

  String get status;
  int get statusCode;
  @override
  dynamic get metadata;
  @JsonKey(ignore: true)
  _$$LxdSyncResponseCopyWith<_$LxdSyncResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LxdAsyncResponseCopyWith<$Res> {
  factory _$$LxdAsyncResponseCopyWith(
          _$LxdAsyncResponse value, $Res Function(_$LxdAsyncResponse) then) =
      __$$LxdAsyncResponseCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {String status,
      int statusCode,
      String operation,
      Map<String, dynamic> metadata});
}

/// @nodoc
class __$$LxdAsyncResponseCopyWithImpl<$Res>
    extends _$LxdResponseCopyWithImpl<$Res, _$LxdAsyncResponse>
    implements _$$LxdAsyncResponseCopyWith<$Res> {
  __$$LxdAsyncResponseCopyWithImpl(
      _$LxdAsyncResponse _value, $Res Function(_$LxdAsyncResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? statusCode = null,
    Object? operation = null,
    Object? metadata = null,
  }) {
    return _then(_$LxdAsyncResponse(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      statusCode: null == statusCode
          ? _value.statusCode
          : statusCode // ignore: cast_nullable_to_non_nullable
              as int,
      operation: null == operation
          ? _value.operation
          : operation // ignore: cast_nullable_to_non_nullable
              as String,
      metadata: null == metadata
          ? _value._metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LxdAsyncResponse implements LxdAsyncResponse {
  const _$LxdAsyncResponse(
      {required this.status,
      required this.statusCode,
      required this.operation,
      required final Map<String, dynamic> metadata,
      final String? $type})
      : _metadata = metadata,
        $type = $type ?? 'async';

  factory _$LxdAsyncResponse.fromJson(Map<String, dynamic> json) =>
      _$$LxdAsyncResponseFromJson(json);

  @override
  final String status;
  @override
  final int statusCode;
  @override
  final String operation;
  final Map<String, dynamic> _metadata;
  @override
  Map<String, dynamic> get metadata {
    if (_metadata is EqualUnmodifiableMapView) return _metadata;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_metadata);
  }

  @JsonKey(name: 'type')
  final String $type;

  @override
  String toString() {
    return 'LxdResponse.async(status: $status, statusCode: $statusCode, operation: $operation, metadata: $metadata)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LxdAsyncResponse &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.statusCode, statusCode) ||
                other.statusCode == statusCode) &&
            (identical(other.operation, operation) ||
                other.operation == operation) &&
            const DeepCollectionEquality().equals(other._metadata, _metadata));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, status, statusCode, operation,
      const DeepCollectionEquality().hash(_metadata));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LxdAsyncResponseCopyWith<_$LxdAsyncResponse> get copyWith =>
      __$$LxdAsyncResponseCopyWithImpl<_$LxdAsyncResponse>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String status, int statusCode, dynamic metadata)
        sync,
    required TResult Function(String status, int statusCode, String operation,
            Map<String, dynamic> metadata)
        async,
    required TResult Function(
            String error, int errorCode, Map<String, dynamic>? metadata)
        error,
  }) {
    return async(status, statusCode, operation, metadata);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String status, int statusCode, dynamic metadata)? sync,
    TResult? Function(String status, int statusCode, String operation,
            Map<String, dynamic> metadata)?
        async,
    TResult? Function(
            String error, int errorCode, Map<String, dynamic>? metadata)?
        error,
  }) {
    return async?.call(status, statusCode, operation, metadata);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String status, int statusCode, dynamic metadata)? sync,
    TResult Function(String status, int statusCode, String operation,
            Map<String, dynamic> metadata)?
        async,
    TResult Function(
            String error, int errorCode, Map<String, dynamic>? metadata)?
        error,
    required TResult orElse(),
  }) {
    if (async != null) {
      return async(status, statusCode, operation, metadata);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LxdSyncResponse value) sync,
    required TResult Function(LxdAsyncResponse value) async,
    required TResult Function(LxdErrorResponse value) error,
  }) {
    return async(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LxdSyncResponse value)? sync,
    TResult? Function(LxdAsyncResponse value)? async,
    TResult? Function(LxdErrorResponse value)? error,
  }) {
    return async?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LxdSyncResponse value)? sync,
    TResult Function(LxdAsyncResponse value)? async,
    TResult Function(LxdErrorResponse value)? error,
    required TResult orElse(),
  }) {
    if (async != null) {
      return async(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$LxdAsyncResponseToJson(
      this,
    );
  }
}

abstract class LxdAsyncResponse implements LxdResponse {
  const factory LxdAsyncResponse(
      {required final String status,
      required final int statusCode,
      required final String operation,
      required final Map<String, dynamic> metadata}) = _$LxdAsyncResponse;

  factory LxdAsyncResponse.fromJson(Map<String, dynamic> json) =
      _$LxdAsyncResponse.fromJson;

  String get status;
  int get statusCode;
  String get operation;
  @override
  Map<String, dynamic> get metadata;
  @JsonKey(ignore: true)
  _$$LxdAsyncResponseCopyWith<_$LxdAsyncResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LxdErrorResponseCopyWith<$Res> {
  factory _$$LxdErrorResponseCopyWith(
          _$LxdErrorResponse value, $Res Function(_$LxdErrorResponse) then) =
      __$$LxdErrorResponseCopyWithImpl<$Res>;
  @useResult
  $Res call({String error, int errorCode, Map<String, dynamic>? metadata});
}

/// @nodoc
class __$$LxdErrorResponseCopyWithImpl<$Res>
    extends _$LxdResponseCopyWithImpl<$Res, _$LxdErrorResponse>
    implements _$$LxdErrorResponseCopyWith<$Res> {
  __$$LxdErrorResponseCopyWithImpl(
      _$LxdErrorResponse _value, $Res Function(_$LxdErrorResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
    Object? errorCode = null,
    Object? metadata = freezed,
  }) {
    return _then(_$LxdErrorResponse(
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
      errorCode: null == errorCode
          ? _value.errorCode
          : errorCode // ignore: cast_nullable_to_non_nullable
              as int,
      metadata: freezed == metadata
          ? _value._metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LxdErrorResponse implements LxdErrorResponse {
  const _$LxdErrorResponse(
      {required this.error,
      required this.errorCode,
      required final Map<String, dynamic>? metadata,
      final String? $type})
      : _metadata = metadata,
        $type = $type ?? 'error';

  factory _$LxdErrorResponse.fromJson(Map<String, dynamic> json) =>
      _$$LxdErrorResponseFromJson(json);

  @override
  final String error;
  @override
  final int errorCode;
  final Map<String, dynamic>? _metadata;
  @override
  Map<String, dynamic>? get metadata {
    final value = _metadata;
    if (value == null) return null;
    if (_metadata is EqualUnmodifiableMapView) return _metadata;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @JsonKey(name: 'type')
  final String $type;

  @override
  String toString() {
    return 'LxdResponse.error(error: $error, errorCode: $errorCode, metadata: $metadata)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LxdErrorResponse &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.errorCode, errorCode) ||
                other.errorCode == errorCode) &&
            const DeepCollectionEquality().equals(other._metadata, _metadata));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, error, errorCode,
      const DeepCollectionEquality().hash(_metadata));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LxdErrorResponseCopyWith<_$LxdErrorResponse> get copyWith =>
      __$$LxdErrorResponseCopyWithImpl<_$LxdErrorResponse>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String status, int statusCode, dynamic metadata)
        sync,
    required TResult Function(String status, int statusCode, String operation,
            Map<String, dynamic> metadata)
        async,
    required TResult Function(
            String error, int errorCode, Map<String, dynamic>? metadata)
        error,
  }) {
    return error(this.error, errorCode, metadata);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String status, int statusCode, dynamic metadata)? sync,
    TResult? Function(String status, int statusCode, String operation,
            Map<String, dynamic> metadata)?
        async,
    TResult? Function(
            String error, int errorCode, Map<String, dynamic>? metadata)?
        error,
  }) {
    return error?.call(this.error, errorCode, metadata);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String status, int statusCode, dynamic metadata)? sync,
    TResult Function(String status, int statusCode, String operation,
            Map<String, dynamic> metadata)?
        async,
    TResult Function(
            String error, int errorCode, Map<String, dynamic>? metadata)?
        error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this.error, errorCode, metadata);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LxdSyncResponse value) sync,
    required TResult Function(LxdAsyncResponse value) async,
    required TResult Function(LxdErrorResponse value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LxdSyncResponse value)? sync,
    TResult? Function(LxdAsyncResponse value)? async,
    TResult? Function(LxdErrorResponse value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LxdSyncResponse value)? sync,
    TResult Function(LxdAsyncResponse value)? async,
    TResult Function(LxdErrorResponse value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$LxdErrorResponseToJson(
      this,
    );
  }
}

abstract class LxdErrorResponse implements LxdResponse {
  const factory LxdErrorResponse(
      {required final String error,
      required final int errorCode,
      required final Map<String, dynamic>? metadata}) = _$LxdErrorResponse;

  factory LxdErrorResponse.fromJson(Map<String, dynamic> json) =
      _$LxdErrorResponse.fromJson;

  String get error;
  int get errorCode;
  @override
  Map<String, dynamic>? get metadata;
  @JsonKey(ignore: true)
  _$$LxdErrorResponseCopyWith<_$LxdErrorResponse> get copyWith =>
      throw _privateConstructorUsedError;
}
