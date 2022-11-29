// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'profile.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

LxdProfile _$LxdProfileFromJson(Map<String, dynamic> json) {
  return _LxdProfile.fromJson(json);
}

/// @nodoc
mixin _$LxdProfile {
  Map<String, String> get config => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LxdProfileCopyWith<LxdProfile> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LxdProfileCopyWith<$Res> {
  factory $LxdProfileCopyWith(
          LxdProfile value, $Res Function(LxdProfile) then) =
      _$LxdProfileCopyWithImpl<$Res>;
  $Res call({Map<String, String> config, String description, String name});
}

/// @nodoc
class _$LxdProfileCopyWithImpl<$Res> implements $LxdProfileCopyWith<$Res> {
  _$LxdProfileCopyWithImpl(this._value, this._then);

  final LxdProfile _value;
  // ignore: unused_field
  final $Res Function(LxdProfile) _then;

  @override
  $Res call({
    Object? config = freezed,
    Object? description = freezed,
    Object? name = freezed,
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
    ));
  }
}

/// @nodoc
abstract class _$$_LxdProfileCopyWith<$Res>
    implements $LxdProfileCopyWith<$Res> {
  factory _$$_LxdProfileCopyWith(
          _$_LxdProfile value, $Res Function(_$_LxdProfile) then) =
      __$$_LxdProfileCopyWithImpl<$Res>;
  @override
  $Res call({Map<String, String> config, String description, String name});
}

/// @nodoc
class __$$_LxdProfileCopyWithImpl<$Res> extends _$LxdProfileCopyWithImpl<$Res>
    implements _$$_LxdProfileCopyWith<$Res> {
  __$$_LxdProfileCopyWithImpl(
      _$_LxdProfile _value, $Res Function(_$_LxdProfile) _then)
      : super(_value, (v) => _then(v as _$_LxdProfile));

  @override
  _$_LxdProfile get _value => super._value as _$_LxdProfile;

  @override
  $Res call({
    Object? config = freezed,
    Object? description = freezed,
    Object? name = freezed,
  }) {
    return _then(_$_LxdProfile(
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
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_LxdProfile implements _LxdProfile {
  const _$_LxdProfile(
      {required final Map<String, String> config,
      required this.description,
      required this.name})
      : _config = config;

  factory _$_LxdProfile.fromJson(Map<String, dynamic> json) =>
      _$$_LxdProfileFromJson(json);

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
  String toString() {
    return 'LxdProfile(config: $config, description: $description, name: $name)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LxdProfile &&
            const DeepCollectionEquality().equals(other._config, _config) &&
            const DeepCollectionEquality()
                .equals(other.description, description) &&
            const DeepCollectionEquality().equals(other.name, name));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_config),
      const DeepCollectionEquality().hash(description),
      const DeepCollectionEquality().hash(name));

  @JsonKey(ignore: true)
  @override
  _$$_LxdProfileCopyWith<_$_LxdProfile> get copyWith =>
      __$$_LxdProfileCopyWithImpl<_$_LxdProfile>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_LxdProfileToJson(this);
  }
}

abstract class _LxdProfile implements LxdProfile {
  const factory _LxdProfile(
      {required final Map<String, String> config,
      required final String description,
      required final String name}) = _$_LxdProfile;

  factory _LxdProfile.fromJson(Map<String, dynamic> json) =
      _$_LxdProfile.fromJson;

  @override
  Map<String, String> get config => throw _privateConstructorUsedError;
  @override
  String get description => throw _privateConstructorUsedError;
  @override
  String get name => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_LxdProfileCopyWith<_$_LxdProfile> get copyWith =>
      throw _privateConstructorUsedError;
}
