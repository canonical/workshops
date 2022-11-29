// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'operation.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

LxdOperation _$LxdOperationFromJson(Map<String, dynamic> json) {
  return _LxdOperation.fromJson(json);
}

/// @nodoc
mixin _$LxdOperation {
  /// UUID of the operation
  ///
  /// Example: 6916c8a6-9b7d-4abd-90b3-aedfec7ec7da
  String get id => throw _privateConstructorUsedError;

  /// Type of operation (task, token or websocket)
  @JsonKey(name: 'class')
  LxdOperationType get type => throw _privateConstructorUsedError;

  /// Description of the operation
  ///
  /// Example: Executing command
  String get description => throw _privateConstructorUsedError;

  /// Operation creation time
  DateTime get createdAt => throw _privateConstructorUsedError;

  /// Operation last change
  DateTime get updatedAt => throw _privateConstructorUsedError;

  /// Status name
  ///
  /// Example: Running
  String get status => throw _privateConstructorUsedError;

  /// Status code
  ///
  /// Example: 103
  int get statusCode => throw _privateConstructorUsedError;

  /// Affected resourcs
  ///
  /// Example: {"containers": ["/1.0/containers/foo"], "instances": ["/1.0/instances/foo"]}
  Map<String, List<String>>? get resources =>
      throw _privateConstructorUsedError;

  /// Operation specific metadata
  ///
  /// Example:
  /// ```json
  /// {
  ///   "command": ["bash"],
  ///   "environment": {
  ///     "HOME": "/root",
  ///     "LANG": "C.UTF-8",
  ///     "PATH": "/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin",
  ///     "TERM": "xterm",
  ///     "USER": "root"
  ///   },
  ///   "fds": {
  ///     "0": "da3046cf02c0116febf4ef3fe4eaecdf308e720c05e5a9c730ce1a6f15417f66",
  ///     "1": "05896879d8692607bd6e4a09475667da3b5f6714418ab0ee0e5720b4c57f754b"
  ///   },
  ///   "interactive": true
  /// }
  /// ```
  Map<String, dynamic>? get metadata => throw _privateConstructorUsedError;

  /// Whether the operation can be canceled
  bool get mayCancel => throw _privateConstructorUsedError;

  /// Operation error mesage
  ///
  /// Example: Some error message
  @JsonKey(name: 'err')
  String get error => throw _privateConstructorUsedError;

  /// What cluster member this record was found on
  ///
  /// Example: lxd01
  String get location => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LxdOperationCopyWith<LxdOperation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LxdOperationCopyWith<$Res> {
  factory $LxdOperationCopyWith(
          LxdOperation value, $Res Function(LxdOperation) then) =
      _$LxdOperationCopyWithImpl<$Res>;
  $Res call(
      {String id,
      @JsonKey(name: 'class') LxdOperationType type,
      String description,
      DateTime createdAt,
      DateTime updatedAt,
      String status,
      int statusCode,
      Map<String, List<String>>? resources,
      Map<String, dynamic>? metadata,
      bool mayCancel,
      @JsonKey(name: 'err') String error,
      String location});
}

/// @nodoc
class _$LxdOperationCopyWithImpl<$Res> implements $LxdOperationCopyWith<$Res> {
  _$LxdOperationCopyWithImpl(this._value, this._then);

  final LxdOperation _value;
  // ignore: unused_field
  final $Res Function(LxdOperation) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? type = freezed,
    Object? description = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? status = freezed,
    Object? statusCode = freezed,
    Object? resources = freezed,
    Object? metadata = freezed,
    Object? mayCancel = freezed,
    Object? error = freezed,
    Object? location = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as LxdOperationType,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: updatedAt == freezed
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      statusCode: statusCode == freezed
          ? _value.statusCode
          : statusCode // ignore: cast_nullable_to_non_nullable
              as int,
      resources: resources == freezed
          ? _value.resources
          : resources // ignore: cast_nullable_to_non_nullable
              as Map<String, List<String>>?,
      metadata: metadata == freezed
          ? _value.metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      mayCancel: mayCancel == freezed
          ? _value.mayCancel
          : mayCancel // ignore: cast_nullable_to_non_nullable
              as bool,
      error: error == freezed
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
      location: location == freezed
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_LxdOperationCopyWith<$Res>
    implements $LxdOperationCopyWith<$Res> {
  factory _$$_LxdOperationCopyWith(
          _$_LxdOperation value, $Res Function(_$_LxdOperation) then) =
      __$$_LxdOperationCopyWithImpl<$Res>;
  @override
  $Res call(
      {String id,
      @JsonKey(name: 'class') LxdOperationType type,
      String description,
      DateTime createdAt,
      DateTime updatedAt,
      String status,
      int statusCode,
      Map<String, List<String>>? resources,
      Map<String, dynamic>? metadata,
      bool mayCancel,
      @JsonKey(name: 'err') String error,
      String location});
}

/// @nodoc
class __$$_LxdOperationCopyWithImpl<$Res>
    extends _$LxdOperationCopyWithImpl<$Res>
    implements _$$_LxdOperationCopyWith<$Res> {
  __$$_LxdOperationCopyWithImpl(
      _$_LxdOperation _value, $Res Function(_$_LxdOperation) _then)
      : super(_value, (v) => _then(v as _$_LxdOperation));

  @override
  _$_LxdOperation get _value => super._value as _$_LxdOperation;

  @override
  $Res call({
    Object? id = freezed,
    Object? type = freezed,
    Object? description = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? status = freezed,
    Object? statusCode = freezed,
    Object? resources = freezed,
    Object? metadata = freezed,
    Object? mayCancel = freezed,
    Object? error = freezed,
    Object? location = freezed,
  }) {
    return _then(_$_LxdOperation(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as LxdOperationType,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: updatedAt == freezed
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      statusCode: statusCode == freezed
          ? _value.statusCode
          : statusCode // ignore: cast_nullable_to_non_nullable
              as int,
      resources: resources == freezed
          ? _value._resources
          : resources // ignore: cast_nullable_to_non_nullable
              as Map<String, List<String>>?,
      metadata: metadata == freezed
          ? _value._metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      mayCancel: mayCancel == freezed
          ? _value.mayCancel
          : mayCancel // ignore: cast_nullable_to_non_nullable
              as bool,
      error: error == freezed
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
      location: location == freezed
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_LxdOperation implements _LxdOperation {
  const _$_LxdOperation(
      {required this.id,
      @JsonKey(name: 'class') required this.type,
      required this.description,
      required this.createdAt,
      required this.updatedAt,
      required this.status,
      required this.statusCode,
      required final Map<String, List<String>>? resources,
      required final Map<String, dynamic>? metadata,
      required this.mayCancel,
      @JsonKey(name: 'err') required this.error,
      required this.location})
      : _resources = resources,
        _metadata = metadata;

  factory _$_LxdOperation.fromJson(Map<String, dynamic> json) =>
      _$$_LxdOperationFromJson(json);

  /// UUID of the operation
  ///
  /// Example: 6916c8a6-9b7d-4abd-90b3-aedfec7ec7da
  @override
  final String id;

  /// Type of operation (task, token or websocket)
  @override
  @JsonKey(name: 'class')
  final LxdOperationType type;

  /// Description of the operation
  ///
  /// Example: Executing command
  @override
  final String description;

  /// Operation creation time
  @override
  final DateTime createdAt;

  /// Operation last change
  @override
  final DateTime updatedAt;

  /// Status name
  ///
  /// Example: Running
  @override
  final String status;

  /// Status code
  ///
  /// Example: 103
  @override
  final int statusCode;

  /// Affected resourcs
  ///
  /// Example: {"containers": ["/1.0/containers/foo"], "instances": ["/1.0/instances/foo"]}
  final Map<String, List<String>>? _resources;

  /// Affected resourcs
  ///
  /// Example: {"containers": ["/1.0/containers/foo"], "instances": ["/1.0/instances/foo"]}
  @override
  Map<String, List<String>>? get resources {
    final value = _resources;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  /// Operation specific metadata
  ///
  /// Example:
  /// ```json
  /// {
  ///   "command": ["bash"],
  ///   "environment": {
  ///     "HOME": "/root",
  ///     "LANG": "C.UTF-8",
  ///     "PATH": "/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin",
  ///     "TERM": "xterm",
  ///     "USER": "root"
  ///   },
  ///   "fds": {
  ///     "0": "da3046cf02c0116febf4ef3fe4eaecdf308e720c05e5a9c730ce1a6f15417f66",
  ///     "1": "05896879d8692607bd6e4a09475667da3b5f6714418ab0ee0e5720b4c57f754b"
  ///   },
  ///   "interactive": true
  /// }
  /// ```
  final Map<String, dynamic>? _metadata;

  /// Operation specific metadata
  ///
  /// Example:
  /// ```json
  /// {
  ///   "command": ["bash"],
  ///   "environment": {
  ///     "HOME": "/root",
  ///     "LANG": "C.UTF-8",
  ///     "PATH": "/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin",
  ///     "TERM": "xterm",
  ///     "USER": "root"
  ///   },
  ///   "fds": {
  ///     "0": "da3046cf02c0116febf4ef3fe4eaecdf308e720c05e5a9c730ce1a6f15417f66",
  ///     "1": "05896879d8692607bd6e4a09475667da3b5f6714418ab0ee0e5720b4c57f754b"
  ///   },
  ///   "interactive": true
  /// }
  /// ```
  @override
  Map<String, dynamic>? get metadata {
    final value = _metadata;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  /// Whether the operation can be canceled
  @override
  final bool mayCancel;

  /// Operation error mesage
  ///
  /// Example: Some error message
  @override
  @JsonKey(name: 'err')
  final String error;

  /// What cluster member this record was found on
  ///
  /// Example: lxd01
  @override
  final String location;

  @override
  String toString() {
    return 'LxdOperation(id: $id, type: $type, description: $description, createdAt: $createdAt, updatedAt: $updatedAt, status: $status, statusCode: $statusCode, resources: $resources, metadata: $metadata, mayCancel: $mayCancel, error: $error, location: $location)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LxdOperation &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.type, type) &&
            const DeepCollectionEquality()
                .equals(other.description, description) &&
            const DeepCollectionEquality().equals(other.createdAt, createdAt) &&
            const DeepCollectionEquality().equals(other.updatedAt, updatedAt) &&
            const DeepCollectionEquality().equals(other.status, status) &&
            const DeepCollectionEquality()
                .equals(other.statusCode, statusCode) &&
            const DeepCollectionEquality()
                .equals(other._resources, _resources) &&
            const DeepCollectionEquality().equals(other._metadata, _metadata) &&
            const DeepCollectionEquality().equals(other.mayCancel, mayCancel) &&
            const DeepCollectionEquality().equals(other.error, error) &&
            const DeepCollectionEquality().equals(other.location, location));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(type),
      const DeepCollectionEquality().hash(description),
      const DeepCollectionEquality().hash(createdAt),
      const DeepCollectionEquality().hash(updatedAt),
      const DeepCollectionEquality().hash(status),
      const DeepCollectionEquality().hash(statusCode),
      const DeepCollectionEquality().hash(_resources),
      const DeepCollectionEquality().hash(_metadata),
      const DeepCollectionEquality().hash(mayCancel),
      const DeepCollectionEquality().hash(error),
      const DeepCollectionEquality().hash(location));

  @JsonKey(ignore: true)
  @override
  _$$_LxdOperationCopyWith<_$_LxdOperation> get copyWith =>
      __$$_LxdOperationCopyWithImpl<_$_LxdOperation>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_LxdOperationToJson(this);
  }
}

abstract class _LxdOperation implements LxdOperation {
  const factory _LxdOperation(
      {required final String id,
      @JsonKey(name: 'class') required final LxdOperationType type,
      required final String description,
      required final DateTime createdAt,
      required final DateTime updatedAt,
      required final String status,
      required final int statusCode,
      required final Map<String, List<String>>? resources,
      required final Map<String, dynamic>? metadata,
      required final bool mayCancel,
      @JsonKey(name: 'err') required final String error,
      required final String location}) = _$_LxdOperation;

  factory _LxdOperation.fromJson(Map<String, dynamic> json) =
      _$_LxdOperation.fromJson;

  @override

  /// UUID of the operation
  ///
  /// Example: 6916c8a6-9b7d-4abd-90b3-aedfec7ec7da
  String get id => throw _privateConstructorUsedError;
  @override

  /// Type of operation (task, token or websocket)
  @JsonKey(name: 'class')
  LxdOperationType get type => throw _privateConstructorUsedError;
  @override

  /// Description of the operation
  ///
  /// Example: Executing command
  String get description => throw _privateConstructorUsedError;
  @override

  /// Operation creation time
  DateTime get createdAt => throw _privateConstructorUsedError;
  @override

  /// Operation last change
  DateTime get updatedAt => throw _privateConstructorUsedError;
  @override

  /// Status name
  ///
  /// Example: Running
  String get status => throw _privateConstructorUsedError;
  @override

  /// Status code
  ///
  /// Example: 103
  int get statusCode => throw _privateConstructorUsedError;
  @override

  /// Affected resourcs
  ///
  /// Example: {"containers": ["/1.0/containers/foo"], "instances": ["/1.0/instances/foo"]}
  Map<String, List<String>>? get resources =>
      throw _privateConstructorUsedError;
  @override

  /// Operation specific metadata
  ///
  /// Example:
  /// ```json
  /// {
  ///   "command": ["bash"],
  ///   "environment": {
  ///     "HOME": "/root",
  ///     "LANG": "C.UTF-8",
  ///     "PATH": "/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin",
  ///     "TERM": "xterm",
  ///     "USER": "root"
  ///   },
  ///   "fds": {
  ///     "0": "da3046cf02c0116febf4ef3fe4eaecdf308e720c05e5a9c730ce1a6f15417f66",
  ///     "1": "05896879d8692607bd6e4a09475667da3b5f6714418ab0ee0e5720b4c57f754b"
  ///   },
  ///   "interactive": true
  /// }
  /// ```
  Map<String, dynamic>? get metadata => throw _privateConstructorUsedError;
  @override

  /// Whether the operation can be canceled
  bool get mayCancel => throw _privateConstructorUsedError;
  @override

  /// Operation error mesage
  ///
  /// Example: Some error message
  @JsonKey(name: 'err')
  String get error => throw _privateConstructorUsedError;
  @override

  /// What cluster member this record was found on
  ///
  /// Example: lxd01
  String get location => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_LxdOperationCopyWith<_$_LxdOperation> get copyWith =>
      throw _privateConstructorUsedError;
}
