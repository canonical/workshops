// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'project.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

LxdProject _$LxdProjectFromJson(Map<String, dynamic> json) {
  return _LxdProject.fromJson(json);
}

/// @nodoc
mixin _$LxdProject {
  Map<String, String> get config => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LxdProjectCopyWith<LxdProject> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LxdProjectCopyWith<$Res> {
  factory $LxdProjectCopyWith(
          LxdProject value, $Res Function(LxdProject) then) =
      _$LxdProjectCopyWithImpl<$Res>;
  $Res call({Map<String, String> config, String description, String name});
}

/// @nodoc
class _$LxdProjectCopyWithImpl<$Res> implements $LxdProjectCopyWith<$Res> {
  _$LxdProjectCopyWithImpl(this._value, this._then);

  final LxdProject _value;
  // ignore: unused_field
  final $Res Function(LxdProject) _then;

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
abstract class _$$_LxdProjectCopyWith<$Res>
    implements $LxdProjectCopyWith<$Res> {
  factory _$$_LxdProjectCopyWith(
          _$_LxdProject value, $Res Function(_$_LxdProject) then) =
      __$$_LxdProjectCopyWithImpl<$Res>;
  @override
  $Res call({Map<String, String> config, String description, String name});
}

/// @nodoc
class __$$_LxdProjectCopyWithImpl<$Res> extends _$LxdProjectCopyWithImpl<$Res>
    implements _$$_LxdProjectCopyWith<$Res> {
  __$$_LxdProjectCopyWithImpl(
      _$_LxdProject _value, $Res Function(_$_LxdProject) _then)
      : super(_value, (v) => _then(v as _$_LxdProject));

  @override
  _$_LxdProject get _value => super._value as _$_LxdProject;

  @override
  $Res call({
    Object? config = freezed,
    Object? description = freezed,
    Object? name = freezed,
  }) {
    return _then(_$_LxdProject(
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
class _$_LxdProject implements _LxdProject {
  const _$_LxdProject(
      {required final Map<String, String> config,
      required this.description,
      required this.name})
      : _config = config;

  factory _$_LxdProject.fromJson(Map<String, dynamic> json) =>
      _$$_LxdProjectFromJson(json);

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
    return 'LxdProject(config: $config, description: $description, name: $name)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LxdProject &&
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
  _$$_LxdProjectCopyWith<_$_LxdProject> get copyWith =>
      __$$_LxdProjectCopyWithImpl<_$_LxdProject>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_LxdProjectToJson(this);
  }
}

abstract class _LxdProject implements LxdProject {
  const factory _LxdProject(
      {required final Map<String, String> config,
      required final String description,
      required final String name}) = _$_LxdProject;

  factory _LxdProject.fromJson(Map<String, dynamic> json) =
      _$_LxdProject.fromJson;

  @override
  Map<String, String> get config => throw _privateConstructorUsedError;
  @override
  String get description => throw _privateConstructorUsedError;
  @override
  String get name => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_LxdProjectCopyWith<_$_LxdProject> get copyWith =>
      throw _privateConstructorUsedError;
}
