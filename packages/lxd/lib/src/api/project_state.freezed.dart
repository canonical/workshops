// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'project_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

LxdProjectStateResource _$LxdProjectStateResourceFromJson(
    Map<String, dynamic> json) {
  return _LxdProjectStateResource.fromJson(json);
}

/// @nodoc
mixin _$LxdProjectStateResource {
  @JsonKey(name: 'Limit')
  int get limit => throw _privateConstructorUsedError;
  @JsonKey(name: 'Usage')
  int get usage => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LxdProjectStateResourceCopyWith<LxdProjectStateResource> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LxdProjectStateResourceCopyWith<$Res> {
  factory $LxdProjectStateResourceCopyWith(LxdProjectStateResource value,
          $Res Function(LxdProjectStateResource) then) =
      _$LxdProjectStateResourceCopyWithImpl<$Res, LxdProjectStateResource>;
  @useResult
  $Res call(
      {@JsonKey(name: 'Limit') int limit, @JsonKey(name: 'Usage') int usage});
}

/// @nodoc
class _$LxdProjectStateResourceCopyWithImpl<$Res,
        $Val extends LxdProjectStateResource>
    implements $LxdProjectStateResourceCopyWith<$Res> {
  _$LxdProjectStateResourceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? limit = null,
    Object? usage = null,
  }) {
    return _then(_value.copyWith(
      limit: null == limit
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int,
      usage: null == usage
          ? _value.usage
          : usage // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_LxdProjectStateResourceCopyWith<$Res>
    implements $LxdProjectStateResourceCopyWith<$Res> {
  factory _$$_LxdProjectStateResourceCopyWith(_$_LxdProjectStateResource value,
          $Res Function(_$_LxdProjectStateResource) then) =
      __$$_LxdProjectStateResourceCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'Limit') int limit, @JsonKey(name: 'Usage') int usage});
}

/// @nodoc
class __$$_LxdProjectStateResourceCopyWithImpl<$Res>
    extends _$LxdProjectStateResourceCopyWithImpl<$Res,
        _$_LxdProjectStateResource>
    implements _$$_LxdProjectStateResourceCopyWith<$Res> {
  __$$_LxdProjectStateResourceCopyWithImpl(_$_LxdProjectStateResource _value,
      $Res Function(_$_LxdProjectStateResource) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? limit = null,
    Object? usage = null,
  }) {
    return _then(_$_LxdProjectStateResource(
      limit: null == limit
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int,
      usage: null == usage
          ? _value.usage
          : usage // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_LxdProjectStateResource implements _LxdProjectStateResource {
  const _$_LxdProjectStateResource(
      {@JsonKey(name: 'Limit') required this.limit,
      @JsonKey(name: 'Usage') required this.usage});

  factory _$_LxdProjectStateResource.fromJson(Map<String, dynamic> json) =>
      _$$_LxdProjectStateResourceFromJson(json);

  @override
  @JsonKey(name: 'Limit')
  final int limit;
  @override
  @JsonKey(name: 'Usage')
  final int usage;

  @override
  String toString() {
    return 'LxdProjectStateResource(limit: $limit, usage: $usage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LxdProjectStateResource &&
            (identical(other.limit, limit) || other.limit == limit) &&
            (identical(other.usage, usage) || other.usage == usage));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, limit, usage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LxdProjectStateResourceCopyWith<_$_LxdProjectStateResource>
      get copyWith =>
          __$$_LxdProjectStateResourceCopyWithImpl<_$_LxdProjectStateResource>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_LxdProjectStateResourceToJson(
      this,
    );
  }
}

abstract class _LxdProjectStateResource implements LxdProjectStateResource {
  const factory _LxdProjectStateResource(
          {@JsonKey(name: 'Limit') required final int limit,
          @JsonKey(name: 'Usage') required final int usage}) =
      _$_LxdProjectStateResource;

  factory _LxdProjectStateResource.fromJson(Map<String, dynamic> json) =
      _$_LxdProjectStateResource.fromJson;

  @override
  @JsonKey(name: 'Limit')
  int get limit;
  @override
  @JsonKey(name: 'Usage')
  int get usage;
  @override
  @JsonKey(ignore: true)
  _$$_LxdProjectStateResourceCopyWith<_$_LxdProjectStateResource>
      get copyWith => throw _privateConstructorUsedError;
}

LxdProjectState _$LxdProjectStateFromJson(Map<String, dynamic> json) {
  return _LxdProjectState.fromJson(json);
}

/// @nodoc
mixin _$LxdProjectState {
  Map<String, LxdProjectStateResource> get resources =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LxdProjectStateCopyWith<LxdProjectState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LxdProjectStateCopyWith<$Res> {
  factory $LxdProjectStateCopyWith(
          LxdProjectState value, $Res Function(LxdProjectState) then) =
      _$LxdProjectStateCopyWithImpl<$Res, LxdProjectState>;
  @useResult
  $Res call({Map<String, LxdProjectStateResource> resources});
}

/// @nodoc
class _$LxdProjectStateCopyWithImpl<$Res, $Val extends LxdProjectState>
    implements $LxdProjectStateCopyWith<$Res> {
  _$LxdProjectStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? resources = null,
  }) {
    return _then(_value.copyWith(
      resources: null == resources
          ? _value.resources
          : resources // ignore: cast_nullable_to_non_nullable
              as Map<String, LxdProjectStateResource>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_LxdProjectStateCopyWith<$Res>
    implements $LxdProjectStateCopyWith<$Res> {
  factory _$$_LxdProjectStateCopyWith(
          _$_LxdProjectState value, $Res Function(_$_LxdProjectState) then) =
      __$$_LxdProjectStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Map<String, LxdProjectStateResource> resources});
}

/// @nodoc
class __$$_LxdProjectStateCopyWithImpl<$Res>
    extends _$LxdProjectStateCopyWithImpl<$Res, _$_LxdProjectState>
    implements _$$_LxdProjectStateCopyWith<$Res> {
  __$$_LxdProjectStateCopyWithImpl(
      _$_LxdProjectState _value, $Res Function(_$_LxdProjectState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? resources = null,
  }) {
    return _then(_$_LxdProjectState(
      resources: null == resources
          ? _value._resources
          : resources // ignore: cast_nullable_to_non_nullable
              as Map<String, LxdProjectStateResource>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_LxdProjectState implements _LxdProjectState {
  const _$_LxdProjectState(
      {required final Map<String, LxdProjectStateResource> resources})
      : _resources = resources;

  factory _$_LxdProjectState.fromJson(Map<String, dynamic> json) =>
      _$$_LxdProjectStateFromJson(json);

  final Map<String, LxdProjectStateResource> _resources;
  @override
  Map<String, LxdProjectStateResource> get resources {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_resources);
  }

  @override
  String toString() {
    return 'LxdProjectState(resources: $resources)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LxdProjectState &&
            const DeepCollectionEquality()
                .equals(other._resources, _resources));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_resources));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LxdProjectStateCopyWith<_$_LxdProjectState> get copyWith =>
      __$$_LxdProjectStateCopyWithImpl<_$_LxdProjectState>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_LxdProjectStateToJson(
      this,
    );
  }
}

abstract class _LxdProjectState implements LxdProjectState {
  const factory _LxdProjectState(
          {required final Map<String, LxdProjectStateResource> resources}) =
      _$_LxdProjectState;

  factory _LxdProjectState.fromJson(Map<String, dynamic> json) =
      _$_LxdProjectState.fromJson;

  @override
  Map<String, LxdProjectStateResource> get resources;
  @override
  @JsonKey(ignore: true)
  _$$_LxdProjectStateCopyWith<_$_LxdProjectState> get copyWith =>
      throw _privateConstructorUsedError;
}
