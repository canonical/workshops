// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'storage_pool.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

LxdStoragePool _$LxdStoragePoolFromJson(Map<String, dynamic> json) {
  return _LxdStoragePool.fromJson(json);
}

/// @nodoc
mixin _$LxdStoragePool {
  Map<String, String> get config => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LxdStoragePoolCopyWith<LxdStoragePool> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LxdStoragePoolCopyWith<$Res> {
  factory $LxdStoragePoolCopyWith(
          LxdStoragePool value, $Res Function(LxdStoragePool) then) =
      _$LxdStoragePoolCopyWithImpl<$Res, LxdStoragePool>;
  @useResult
  $Res call(
      {Map<String, String> config,
      String description,
      String name,
      String status});
}

/// @nodoc
class _$LxdStoragePoolCopyWithImpl<$Res, $Val extends LxdStoragePool>
    implements $LxdStoragePoolCopyWith<$Res> {
  _$LxdStoragePoolCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? config = null,
    Object? description = null,
    Object? name = null,
    Object? status = null,
  }) {
    return _then(_value.copyWith(
      config: null == config
          ? _value.config
          : config // ignore: cast_nullable_to_non_nullable
              as Map<String, String>,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_LxdStoragePoolCopyWith<$Res>
    implements $LxdStoragePoolCopyWith<$Res> {
  factory _$$_LxdStoragePoolCopyWith(
          _$_LxdStoragePool value, $Res Function(_$_LxdStoragePool) then) =
      __$$_LxdStoragePoolCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Map<String, String> config,
      String description,
      String name,
      String status});
}

/// @nodoc
class __$$_LxdStoragePoolCopyWithImpl<$Res>
    extends _$LxdStoragePoolCopyWithImpl<$Res, _$_LxdStoragePool>
    implements _$$_LxdStoragePoolCopyWith<$Res> {
  __$$_LxdStoragePoolCopyWithImpl(
      _$_LxdStoragePool _value, $Res Function(_$_LxdStoragePool) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? config = null,
    Object? description = null,
    Object? name = null,
    Object? status = null,
  }) {
    return _then(_$_LxdStoragePool(
      config: null == config
          ? _value._config
          : config // ignore: cast_nullable_to_non_nullable
              as Map<String, String>,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_LxdStoragePool implements _LxdStoragePool {
  const _$_LxdStoragePool(
      {required final Map<String, String> config,
      required this.description,
      required this.name,
      required this.status})
      : _config = config;

  factory _$_LxdStoragePool.fromJson(Map<String, dynamic> json) =>
      _$$_LxdStoragePoolFromJson(json);

  final Map<String, String> _config;
  @override
  Map<String, String> get config {
    if (_config is EqualUnmodifiableMapView) return _config;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_config);
  }

  @override
  final String description;
  @override
  final String name;
  @override
  final String status;

  @override
  String toString() {
    return 'LxdStoragePool(config: $config, description: $description, name: $name, status: $status)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LxdStoragePool &&
            const DeepCollectionEquality().equals(other._config, _config) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_config), description, name, status);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LxdStoragePoolCopyWith<_$_LxdStoragePool> get copyWith =>
      __$$_LxdStoragePoolCopyWithImpl<_$_LxdStoragePool>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_LxdStoragePoolToJson(
      this,
    );
  }
}

abstract class _LxdStoragePool implements LxdStoragePool {
  const factory _LxdStoragePool(
      {required final Map<String, String> config,
      required final String description,
      required final String name,
      required final String status}) = _$_LxdStoragePool;

  factory _LxdStoragePool.fromJson(Map<String, dynamic> json) =
      _$_LxdStoragePool.fromJson;

  @override
  Map<String, String> get config;
  @override
  String get description;
  @override
  String get name;
  @override
  String get status;
  @override
  @JsonKey(ignore: true)
  _$$_LxdStoragePoolCopyWith<_$_LxdStoragePool> get copyWith =>
      throw _privateConstructorUsedError;
}
