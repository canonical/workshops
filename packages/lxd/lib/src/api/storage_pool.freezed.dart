// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

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
      _$LxdStoragePoolCopyWithImpl<$Res>;
  $Res call(
      {Map<String, String> config,
      String description,
      String name,
      String status});
}

/// @nodoc
class _$LxdStoragePoolCopyWithImpl<$Res>
    implements $LxdStoragePoolCopyWith<$Res> {
  _$LxdStoragePoolCopyWithImpl(this._value, this._then);

  final LxdStoragePool _value;
  // ignore: unused_field
  final $Res Function(LxdStoragePool) _then;

  @override
  $Res call({
    Object? config = freezed,
    Object? description = freezed,
    Object? name = freezed,
    Object? status = freezed,
  }) {
    return _then(_value.copyWith(
      config: config == freezed
          ? _value.config
          : config // ignore: cast_nullable_to_non_nullable
              as Map<String, String>,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_LxdStoragePoolCopyWith<$Res>
    implements $LxdStoragePoolCopyWith<$Res> {
  factory _$$_LxdStoragePoolCopyWith(
          _$_LxdStoragePool value, $Res Function(_$_LxdStoragePool) then) =
      __$$_LxdStoragePoolCopyWithImpl<$Res>;
  @override
  $Res call(
      {Map<String, String> config,
      String description,
      String name,
      String status});
}

/// @nodoc
class __$$_LxdStoragePoolCopyWithImpl<$Res>
    extends _$LxdStoragePoolCopyWithImpl<$Res>
    implements _$$_LxdStoragePoolCopyWith<$Res> {
  __$$_LxdStoragePoolCopyWithImpl(
      _$_LxdStoragePool _value, $Res Function(_$_LxdStoragePool) _then)
      : super(_value, (v) => _then(v as _$_LxdStoragePool));

  @override
  _$_LxdStoragePool get _value => super._value as _$_LxdStoragePool;

  @override
  $Res call({
    Object? config = freezed,
    Object? description = freezed,
    Object? name = freezed,
    Object? status = freezed,
  }) {
    return _then(_$_LxdStoragePool(
      config: config == freezed
          ? _value._config
          : config // ignore: cast_nullable_to_non_nullable
              as Map<String, String>,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      status: status == freezed
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
            const DeepCollectionEquality()
                .equals(other.description, description) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.status, status));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_config),
      const DeepCollectionEquality().hash(description),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(status));

  @JsonKey(ignore: true)
  @override
  _$$_LxdStoragePoolCopyWith<_$_LxdStoragePool> get copyWith =>
      __$$_LxdStoragePoolCopyWithImpl<_$_LxdStoragePool>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_LxdStoragePoolToJson(this);
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
  Map<String, String> get config => throw _privateConstructorUsedError;
  @override
  String get description => throw _privateConstructorUsedError;
  @override
  String get name => throw _privateConstructorUsedError;
  @override
  String get status => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_LxdStoragePoolCopyWith<_$_LxdStoragePool> get copyWith =>
      throw _privateConstructorUsedError;
}
