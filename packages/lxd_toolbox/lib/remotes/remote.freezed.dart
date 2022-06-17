// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'remote.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Remote _$RemoteFromJson(Map<String, dynamic> json) {
  return _Remote.fromJson(json);
}

/// @nodoc
mixin _$Remote {
  String get name => throw _privateConstructorUsedError;
  String get address => throw _privateConstructorUsedError;
  dynamic get isStatic => throw _privateConstructorUsedError;
  dynamic get isPublic => throw _privateConstructorUsedError;
  String? get protocol => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RemoteCopyWith<Remote> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RemoteCopyWith<$Res> {
  factory $RemoteCopyWith(Remote value, $Res Function(Remote) then) =
      _$RemoteCopyWithImpl<$Res>;
  $Res call(
      {String name,
      String address,
      dynamic isStatic,
      dynamic isPublic,
      String? protocol});
}

/// @nodoc
class _$RemoteCopyWithImpl<$Res> implements $RemoteCopyWith<$Res> {
  _$RemoteCopyWithImpl(this._value, this._then);

  final Remote _value;
  // ignore: unused_field
  final $Res Function(Remote) _then;

  @override
  $Res call({
    Object? name = freezed,
    Object? address = freezed,
    Object? isStatic = freezed,
    Object? isPublic = freezed,
    Object? protocol = freezed,
  }) {
    return _then(_value.copyWith(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      address: address == freezed
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      isStatic: isStatic == freezed
          ? _value.isStatic
          : isStatic // ignore: cast_nullable_to_non_nullable
              as dynamic,
      isPublic: isPublic == freezed
          ? _value.isPublic
          : isPublic // ignore: cast_nullable_to_non_nullable
              as dynamic,
      protocol: protocol == freezed
          ? _value.protocol
          : protocol // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$$_RemoteCopyWith<$Res> implements $RemoteCopyWith<$Res> {
  factory _$$_RemoteCopyWith(_$_Remote value, $Res Function(_$_Remote) then) =
      __$$_RemoteCopyWithImpl<$Res>;
  @override
  $Res call(
      {String name,
      String address,
      dynamic isStatic,
      dynamic isPublic,
      String? protocol});
}

/// @nodoc
class __$$_RemoteCopyWithImpl<$Res> extends _$RemoteCopyWithImpl<$Res>
    implements _$$_RemoteCopyWith<$Res> {
  __$$_RemoteCopyWithImpl(_$_Remote _value, $Res Function(_$_Remote) _then)
      : super(_value, (v) => _then(v as _$_Remote));

  @override
  _$_Remote get _value => super._value as _$_Remote;

  @override
  $Res call({
    Object? name = freezed,
    Object? address = freezed,
    Object? isStatic = freezed,
    Object? isPublic = freezed,
    Object? protocol = freezed,
  }) {
    return _then(_$_Remote(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      address: address == freezed
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      isStatic: isStatic == freezed ? _value.isStatic : isStatic,
      isPublic: isPublic == freezed ? _value.isPublic : isPublic,
      protocol: protocol == freezed
          ? _value.protocol
          : protocol // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Remote extends _Remote {
  const _$_Remote(
      {required this.name,
      required this.address,
      this.isStatic = false,
      this.isPublic = true,
      this.protocol})
      : super._();

  factory _$_Remote.fromJson(Map<String, dynamic> json) =>
      _$$_RemoteFromJson(json);

  @override
  final String name;
  @override
  final String address;
  @override
  @JsonKey()
  final dynamic isStatic;
  @override
  @JsonKey()
  final dynamic isPublic;
  @override
  final String? protocol;

  @override
  String toString() {
    return 'Remote(name: $name, address: $address, isStatic: $isStatic, isPublic: $isPublic, protocol: $protocol)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Remote &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.address, address) &&
            const DeepCollectionEquality().equals(other.isStatic, isStatic) &&
            const DeepCollectionEquality().equals(other.isPublic, isPublic) &&
            const DeepCollectionEquality().equals(other.protocol, protocol));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(address),
      const DeepCollectionEquality().hash(isStatic),
      const DeepCollectionEquality().hash(isPublic),
      const DeepCollectionEquality().hash(protocol));

  @JsonKey(ignore: true)
  @override
  _$$_RemoteCopyWith<_$_Remote> get copyWith =>
      __$$_RemoteCopyWithImpl<_$_Remote>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_RemoteToJson(this);
  }
}

abstract class _Remote extends Remote {
  const factory _Remote(
      {required final String name,
      required final String address,
      final dynamic isStatic,
      final dynamic isPublic,
      final String? protocol}) = _$_Remote;
  const _Remote._() : super._();

  factory _Remote.fromJson(Map<String, dynamic> json) = _$_Remote.fromJson;

  @override
  String get name => throw _privateConstructorUsedError;
  @override
  String get address => throw _privateConstructorUsedError;
  @override
  dynamic get isStatic => throw _privateConstructorUsedError;
  @override
  dynamic get isPublic => throw _privateConstructorUsedError;
  @override
  String? get protocol => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_RemoteCopyWith<_$_Remote> get copyWith =>
      throw _privateConstructorUsedError;
}
