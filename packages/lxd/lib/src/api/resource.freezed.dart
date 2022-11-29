// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'resource.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

LxdCpuResources _$LxdCpuResourcesFromJson(Map<String, dynamic> json) {
  return _LxdCpuResources.fromJson(json);
}

/// @nodoc
mixin _$LxdCpuResources {
  String get architecture => throw _privateConstructorUsedError;
  List<String> get sockets => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LxdCpuResourcesCopyWith<LxdCpuResources> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LxdCpuResourcesCopyWith<$Res> {
  factory $LxdCpuResourcesCopyWith(
          LxdCpuResources value, $Res Function(LxdCpuResources) then) =
      _$LxdCpuResourcesCopyWithImpl<$Res>;
  $Res call({String architecture, List<String> sockets});
}

/// @nodoc
class _$LxdCpuResourcesCopyWithImpl<$Res>
    implements $LxdCpuResourcesCopyWith<$Res> {
  _$LxdCpuResourcesCopyWithImpl(this._value, this._then);

  final LxdCpuResources _value;
  // ignore: unused_field
  final $Res Function(LxdCpuResources) _then;

  @override
  $Res call({
    Object? architecture = freezed,
    Object? sockets = freezed,
  }) {
    return _then(_value.copyWith(
      architecture: architecture == freezed
          ? _value.architecture
          : architecture // ignore: cast_nullable_to_non_nullable
              as String,
      sockets: sockets == freezed
          ? _value.sockets
          : sockets // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
abstract class _$$_LxdCpuResourcesCopyWith<$Res>
    implements $LxdCpuResourcesCopyWith<$Res> {
  factory _$$_LxdCpuResourcesCopyWith(
          _$_LxdCpuResources value, $Res Function(_$_LxdCpuResources) then) =
      __$$_LxdCpuResourcesCopyWithImpl<$Res>;
  @override
  $Res call({String architecture, List<String> sockets});
}

/// @nodoc
class __$$_LxdCpuResourcesCopyWithImpl<$Res>
    extends _$LxdCpuResourcesCopyWithImpl<$Res>
    implements _$$_LxdCpuResourcesCopyWith<$Res> {
  __$$_LxdCpuResourcesCopyWithImpl(
      _$_LxdCpuResources _value, $Res Function(_$_LxdCpuResources) _then)
      : super(_value, (v) => _then(v as _$_LxdCpuResources));

  @override
  _$_LxdCpuResources get _value => super._value as _$_LxdCpuResources;

  @override
  $Res call({
    Object? architecture = freezed,
    Object? sockets = freezed,
  }) {
    return _then(_$_LxdCpuResources(
      architecture: architecture == freezed
          ? _value.architecture
          : architecture // ignore: cast_nullable_to_non_nullable
              as String,
      sockets: sockets == freezed
          ? _value._sockets
          : sockets // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_LxdCpuResources implements _LxdCpuResources {
  const _$_LxdCpuResources(
      {required this.architecture, required final List<String> sockets})
      : _sockets = sockets;

  factory _$_LxdCpuResources.fromJson(Map<String, dynamic> json) =>
      _$$_LxdCpuResourcesFromJson(json);

  @override
  final String architecture;
  final List<String> _sockets;
  @override
  List<String> get sockets {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_sockets);
  }

  @override
  String toString() {
    return 'LxdCpuResources(architecture: $architecture, sockets: $sockets)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LxdCpuResources &&
            const DeepCollectionEquality()
                .equals(other.architecture, architecture) &&
            const DeepCollectionEquality().equals(other._sockets, _sockets));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(architecture),
      const DeepCollectionEquality().hash(_sockets));

  @JsonKey(ignore: true)
  @override
  _$$_LxdCpuResourcesCopyWith<_$_LxdCpuResources> get copyWith =>
      __$$_LxdCpuResourcesCopyWithImpl<_$_LxdCpuResources>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_LxdCpuResourcesToJson(this);
  }
}

abstract class _LxdCpuResources implements LxdCpuResources {
  const factory _LxdCpuResources(
      {required final String architecture,
      required final List<String> sockets}) = _$_LxdCpuResources;

  factory _LxdCpuResources.fromJson(Map<String, dynamic> json) =
      _$_LxdCpuResources.fromJson;

  @override
  String get architecture => throw _privateConstructorUsedError;
  @override
  List<String> get sockets => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_LxdCpuResourcesCopyWith<_$_LxdCpuResources> get copyWith =>
      throw _privateConstructorUsedError;
}

LxdMemoryResources _$LxdMemoryResourcesFromJson(Map<String, dynamic> json) {
  return _LxdMemoryResources.fromJson(json);
}

/// @nodoc
mixin _$LxdMemoryResources {
  int get used => throw _privateConstructorUsedError;
  int get total => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LxdMemoryResourcesCopyWith<LxdMemoryResources> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LxdMemoryResourcesCopyWith<$Res> {
  factory $LxdMemoryResourcesCopyWith(
          LxdMemoryResources value, $Res Function(LxdMemoryResources) then) =
      _$LxdMemoryResourcesCopyWithImpl<$Res>;
  $Res call({int used, int total});
}

/// @nodoc
class _$LxdMemoryResourcesCopyWithImpl<$Res>
    implements $LxdMemoryResourcesCopyWith<$Res> {
  _$LxdMemoryResourcesCopyWithImpl(this._value, this._then);

  final LxdMemoryResources _value;
  // ignore: unused_field
  final $Res Function(LxdMemoryResources) _then;

  @override
  $Res call({
    Object? used = freezed,
    Object? total = freezed,
  }) {
    return _then(_value.copyWith(
      used: used == freezed
          ? _value.used
          : used // ignore: cast_nullable_to_non_nullable
              as int,
      total: total == freezed
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$$_LxdMemoryResourcesCopyWith<$Res>
    implements $LxdMemoryResourcesCopyWith<$Res> {
  factory _$$_LxdMemoryResourcesCopyWith(_$_LxdMemoryResources value,
          $Res Function(_$_LxdMemoryResources) then) =
      __$$_LxdMemoryResourcesCopyWithImpl<$Res>;
  @override
  $Res call({int used, int total});
}

/// @nodoc
class __$$_LxdMemoryResourcesCopyWithImpl<$Res>
    extends _$LxdMemoryResourcesCopyWithImpl<$Res>
    implements _$$_LxdMemoryResourcesCopyWith<$Res> {
  __$$_LxdMemoryResourcesCopyWithImpl(
      _$_LxdMemoryResources _value, $Res Function(_$_LxdMemoryResources) _then)
      : super(_value, (v) => _then(v as _$_LxdMemoryResources));

  @override
  _$_LxdMemoryResources get _value => super._value as _$_LxdMemoryResources;

  @override
  $Res call({
    Object? used = freezed,
    Object? total = freezed,
  }) {
    return _then(_$_LxdMemoryResources(
      used: used == freezed
          ? _value.used
          : used // ignore: cast_nullable_to_non_nullable
              as int,
      total: total == freezed
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_LxdMemoryResources implements _LxdMemoryResources {
  const _$_LxdMemoryResources({required this.used, required this.total});

  factory _$_LxdMemoryResources.fromJson(Map<String, dynamic> json) =>
      _$$_LxdMemoryResourcesFromJson(json);

  @override
  final int used;
  @override
  final int total;

  @override
  String toString() {
    return 'LxdMemoryResources(used: $used, total: $total)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LxdMemoryResources &&
            const DeepCollectionEquality().equals(other.used, used) &&
            const DeepCollectionEquality().equals(other.total, total));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(used),
      const DeepCollectionEquality().hash(total));

  @JsonKey(ignore: true)
  @override
  _$$_LxdMemoryResourcesCopyWith<_$_LxdMemoryResources> get copyWith =>
      __$$_LxdMemoryResourcesCopyWithImpl<_$_LxdMemoryResources>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_LxdMemoryResourcesToJson(this);
  }
}

abstract class _LxdMemoryResources implements LxdMemoryResources {
  const factory _LxdMemoryResources(
      {required final int used,
      required final int total}) = _$_LxdMemoryResources;

  factory _LxdMemoryResources.fromJson(Map<String, dynamic> json) =
      _$_LxdMemoryResources.fromJson;

  @override
  int get used => throw _privateConstructorUsedError;
  @override
  int get total => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_LxdMemoryResourcesCopyWith<_$_LxdMemoryResources> get copyWith =>
      throw _privateConstructorUsedError;
}

LxdGpuResources _$LxdGpuResourcesFromJson(Map<String, dynamic> json) {
  return _LxdGpuResources.fromJson(json);
}

/// @nodoc
mixin _$LxdGpuResources {
  List<LxdGpuCard> get cards => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LxdGpuResourcesCopyWith<LxdGpuResources> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LxdGpuResourcesCopyWith<$Res> {
  factory $LxdGpuResourcesCopyWith(
          LxdGpuResources value, $Res Function(LxdGpuResources) then) =
      _$LxdGpuResourcesCopyWithImpl<$Res>;
  $Res call({List<LxdGpuCard> cards});
}

/// @nodoc
class _$LxdGpuResourcesCopyWithImpl<$Res>
    implements $LxdGpuResourcesCopyWith<$Res> {
  _$LxdGpuResourcesCopyWithImpl(this._value, this._then);

  final LxdGpuResources _value;
  // ignore: unused_field
  final $Res Function(LxdGpuResources) _then;

  @override
  $Res call({
    Object? cards = freezed,
  }) {
    return _then(_value.copyWith(
      cards: cards == freezed
          ? _value.cards
          : cards // ignore: cast_nullable_to_non_nullable
              as List<LxdGpuCard>,
    ));
  }
}

/// @nodoc
abstract class _$$_LxdGpuResourcesCopyWith<$Res>
    implements $LxdGpuResourcesCopyWith<$Res> {
  factory _$$_LxdGpuResourcesCopyWith(
          _$_LxdGpuResources value, $Res Function(_$_LxdGpuResources) then) =
      __$$_LxdGpuResourcesCopyWithImpl<$Res>;
  @override
  $Res call({List<LxdGpuCard> cards});
}

/// @nodoc
class __$$_LxdGpuResourcesCopyWithImpl<$Res>
    extends _$LxdGpuResourcesCopyWithImpl<$Res>
    implements _$$_LxdGpuResourcesCopyWith<$Res> {
  __$$_LxdGpuResourcesCopyWithImpl(
      _$_LxdGpuResources _value, $Res Function(_$_LxdGpuResources) _then)
      : super(_value, (v) => _then(v as _$_LxdGpuResources));

  @override
  _$_LxdGpuResources get _value => super._value as _$_LxdGpuResources;

  @override
  $Res call({
    Object? cards = freezed,
  }) {
    return _then(_$_LxdGpuResources(
      cards: cards == freezed
          ? _value._cards
          : cards // ignore: cast_nullable_to_non_nullable
              as List<LxdGpuCard>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_LxdGpuResources implements _LxdGpuResources {
  const _$_LxdGpuResources({required final List<LxdGpuCard> cards})
      : _cards = cards;

  factory _$_LxdGpuResources.fromJson(Map<String, dynamic> json) =>
      _$$_LxdGpuResourcesFromJson(json);

  final List<LxdGpuCard> _cards;
  @override
  List<LxdGpuCard> get cards {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_cards);
  }

  @override
  String toString() {
    return 'LxdGpuResources(cards: $cards)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LxdGpuResources &&
            const DeepCollectionEquality().equals(other._cards, _cards));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_cards));

  @JsonKey(ignore: true)
  @override
  _$$_LxdGpuResourcesCopyWith<_$_LxdGpuResources> get copyWith =>
      __$$_LxdGpuResourcesCopyWithImpl<_$_LxdGpuResources>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_LxdGpuResourcesToJson(this);
  }
}

abstract class _LxdGpuResources implements LxdGpuResources {
  const factory _LxdGpuResources({required final List<LxdGpuCard> cards}) =
      _$_LxdGpuResources;

  factory _LxdGpuResources.fromJson(Map<String, dynamic> json) =
      _$_LxdGpuResources.fromJson;

  @override
  List<LxdGpuCard> get cards => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_LxdGpuResourcesCopyWith<_$_LxdGpuResources> get copyWith =>
      throw _privateConstructorUsedError;
}

LxdGpuCard _$LxdGpuCardFromJson(Map<String, dynamic> json) {
  return _LxdGpuCard.fromJson(json);
}

/// @nodoc
mixin _$LxdGpuCard {
  String get driver => throw _privateConstructorUsedError;
  String get driverVersion => throw _privateConstructorUsedError;
  String get vendor => throw _privateConstructorUsedError;
  String get vendorId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LxdGpuCardCopyWith<LxdGpuCard> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LxdGpuCardCopyWith<$Res> {
  factory $LxdGpuCardCopyWith(
          LxdGpuCard value, $Res Function(LxdGpuCard) then) =
      _$LxdGpuCardCopyWithImpl<$Res>;
  $Res call(
      {String driver, String driverVersion, String vendor, String vendorId});
}

/// @nodoc
class _$LxdGpuCardCopyWithImpl<$Res> implements $LxdGpuCardCopyWith<$Res> {
  _$LxdGpuCardCopyWithImpl(this._value, this._then);

  final LxdGpuCard _value;
  // ignore: unused_field
  final $Res Function(LxdGpuCard) _then;

  @override
  $Res call({
    Object? driver = freezed,
    Object? driverVersion = freezed,
    Object? vendor = freezed,
    Object? vendorId = freezed,
  }) {
    return _then(_value.copyWith(
      driver: driver == freezed
          ? _value.driver
          : driver // ignore: cast_nullable_to_non_nullable
              as String,
      driverVersion: driverVersion == freezed
          ? _value.driverVersion
          : driverVersion // ignore: cast_nullable_to_non_nullable
              as String,
      vendor: vendor == freezed
          ? _value.vendor
          : vendor // ignore: cast_nullable_to_non_nullable
              as String,
      vendorId: vendorId == freezed
          ? _value.vendorId
          : vendorId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_LxdGpuCardCopyWith<$Res>
    implements $LxdGpuCardCopyWith<$Res> {
  factory _$$_LxdGpuCardCopyWith(
          _$_LxdGpuCard value, $Res Function(_$_LxdGpuCard) then) =
      __$$_LxdGpuCardCopyWithImpl<$Res>;
  @override
  $Res call(
      {String driver, String driverVersion, String vendor, String vendorId});
}

/// @nodoc
class __$$_LxdGpuCardCopyWithImpl<$Res> extends _$LxdGpuCardCopyWithImpl<$Res>
    implements _$$_LxdGpuCardCopyWith<$Res> {
  __$$_LxdGpuCardCopyWithImpl(
      _$_LxdGpuCard _value, $Res Function(_$_LxdGpuCard) _then)
      : super(_value, (v) => _then(v as _$_LxdGpuCard));

  @override
  _$_LxdGpuCard get _value => super._value as _$_LxdGpuCard;

  @override
  $Res call({
    Object? driver = freezed,
    Object? driverVersion = freezed,
    Object? vendor = freezed,
    Object? vendorId = freezed,
  }) {
    return _then(_$_LxdGpuCard(
      driver: driver == freezed
          ? _value.driver
          : driver // ignore: cast_nullable_to_non_nullable
              as String,
      driverVersion: driverVersion == freezed
          ? _value.driverVersion
          : driverVersion // ignore: cast_nullable_to_non_nullable
              as String,
      vendor: vendor == freezed
          ? _value.vendor
          : vendor // ignore: cast_nullable_to_non_nullable
              as String,
      vendorId: vendorId == freezed
          ? _value.vendorId
          : vendorId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_LxdGpuCard implements _LxdGpuCard {
  const _$_LxdGpuCard(
      {required this.driver,
      required this.driverVersion,
      required this.vendor,
      required this.vendorId});

  factory _$_LxdGpuCard.fromJson(Map<String, dynamic> json) =>
      _$$_LxdGpuCardFromJson(json);

  @override
  final String driver;
  @override
  final String driverVersion;
  @override
  final String vendor;
  @override
  final String vendorId;

  @override
  String toString() {
    return 'LxdGpuCard(driver: $driver, driverVersion: $driverVersion, vendor: $vendor, vendorId: $vendorId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LxdGpuCard &&
            const DeepCollectionEquality().equals(other.driver, driver) &&
            const DeepCollectionEquality()
                .equals(other.driverVersion, driverVersion) &&
            const DeepCollectionEquality().equals(other.vendor, vendor) &&
            const DeepCollectionEquality().equals(other.vendorId, vendorId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(driver),
      const DeepCollectionEquality().hash(driverVersion),
      const DeepCollectionEquality().hash(vendor),
      const DeepCollectionEquality().hash(vendorId));

  @JsonKey(ignore: true)
  @override
  _$$_LxdGpuCardCopyWith<_$_LxdGpuCard> get copyWith =>
      __$$_LxdGpuCardCopyWithImpl<_$_LxdGpuCard>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_LxdGpuCardToJson(this);
  }
}

abstract class _LxdGpuCard implements LxdGpuCard {
  const factory _LxdGpuCard(
      {required final String driver,
      required final String driverVersion,
      required final String vendor,
      required final String vendorId}) = _$_LxdGpuCard;

  factory _LxdGpuCard.fromJson(Map<String, dynamic> json) =
      _$_LxdGpuCard.fromJson;

  @override
  String get driver => throw _privateConstructorUsedError;
  @override
  String get driverVersion => throw _privateConstructorUsedError;
  @override
  String get vendor => throw _privateConstructorUsedError;
  @override
  String get vendorId => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_LxdGpuCardCopyWith<_$_LxdGpuCard> get copyWith =>
      throw _privateConstructorUsedError;
}

LXdNetworkResources _$LXdNetworkResourcesFromJson(Map<String, dynamic> json) {
  return _LXdNetworkResources.fromJson(json);
}

/// @nodoc
mixin _$LXdNetworkResources {
  List<LxdNetworkCard> get cards => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LXdNetworkResourcesCopyWith<LXdNetworkResources> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LXdNetworkResourcesCopyWith<$Res> {
  factory $LXdNetworkResourcesCopyWith(
          LXdNetworkResources value, $Res Function(LXdNetworkResources) then) =
      _$LXdNetworkResourcesCopyWithImpl<$Res>;
  $Res call({List<LxdNetworkCard> cards});
}

/// @nodoc
class _$LXdNetworkResourcesCopyWithImpl<$Res>
    implements $LXdNetworkResourcesCopyWith<$Res> {
  _$LXdNetworkResourcesCopyWithImpl(this._value, this._then);

  final LXdNetworkResources _value;
  // ignore: unused_field
  final $Res Function(LXdNetworkResources) _then;

  @override
  $Res call({
    Object? cards = freezed,
  }) {
    return _then(_value.copyWith(
      cards: cards == freezed
          ? _value.cards
          : cards // ignore: cast_nullable_to_non_nullable
              as List<LxdNetworkCard>,
    ));
  }
}

/// @nodoc
abstract class _$$_LXdNetworkResourcesCopyWith<$Res>
    implements $LXdNetworkResourcesCopyWith<$Res> {
  factory _$$_LXdNetworkResourcesCopyWith(_$_LXdNetworkResources value,
          $Res Function(_$_LXdNetworkResources) then) =
      __$$_LXdNetworkResourcesCopyWithImpl<$Res>;
  @override
  $Res call({List<LxdNetworkCard> cards});
}

/// @nodoc
class __$$_LXdNetworkResourcesCopyWithImpl<$Res>
    extends _$LXdNetworkResourcesCopyWithImpl<$Res>
    implements _$$_LXdNetworkResourcesCopyWith<$Res> {
  __$$_LXdNetworkResourcesCopyWithImpl(_$_LXdNetworkResources _value,
      $Res Function(_$_LXdNetworkResources) _then)
      : super(_value, (v) => _then(v as _$_LXdNetworkResources));

  @override
  _$_LXdNetworkResources get _value => super._value as _$_LXdNetworkResources;

  @override
  $Res call({
    Object? cards = freezed,
  }) {
    return _then(_$_LXdNetworkResources(
      cards: cards == freezed
          ? _value._cards
          : cards // ignore: cast_nullable_to_non_nullable
              as List<LxdNetworkCard>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_LXdNetworkResources implements _LXdNetworkResources {
  const _$_LXdNetworkResources({required final List<LxdNetworkCard> cards})
      : _cards = cards;

  factory _$_LXdNetworkResources.fromJson(Map<String, dynamic> json) =>
      _$$_LXdNetworkResourcesFromJson(json);

  final List<LxdNetworkCard> _cards;
  @override
  List<LxdNetworkCard> get cards {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_cards);
  }

  @override
  String toString() {
    return 'LXdNetworkResources(cards: $cards)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LXdNetworkResources &&
            const DeepCollectionEquality().equals(other._cards, _cards));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_cards));

  @JsonKey(ignore: true)
  @override
  _$$_LXdNetworkResourcesCopyWith<_$_LXdNetworkResources> get copyWith =>
      __$$_LXdNetworkResourcesCopyWithImpl<_$_LXdNetworkResources>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_LXdNetworkResourcesToJson(this);
  }
}

abstract class _LXdNetworkResources implements LXdNetworkResources {
  const factory _LXdNetworkResources(
      {required final List<LxdNetworkCard> cards}) = _$_LXdNetworkResources;

  factory _LXdNetworkResources.fromJson(Map<String, dynamic> json) =
      _$_LXdNetworkResources.fromJson;

  @override
  List<LxdNetworkCard> get cards => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_LXdNetworkResourcesCopyWith<_$_LXdNetworkResources> get copyWith =>
      throw _privateConstructorUsedError;
}

LxdNetworkCard _$LxdNetworkCardFromJson(Map<String, dynamic> json) {
  return _LxdNetworkCard.fromJson(json);
}

/// @nodoc
mixin _$LxdNetworkCard {
  String get driver => throw _privateConstructorUsedError;
  String get driverVersion => throw _privateConstructorUsedError;
  String get vendor => throw _privateConstructorUsedError;
  String get vendorId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LxdNetworkCardCopyWith<LxdNetworkCard> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LxdNetworkCardCopyWith<$Res> {
  factory $LxdNetworkCardCopyWith(
          LxdNetworkCard value, $Res Function(LxdNetworkCard) then) =
      _$LxdNetworkCardCopyWithImpl<$Res>;
  $Res call(
      {String driver, String driverVersion, String vendor, String vendorId});
}

/// @nodoc
class _$LxdNetworkCardCopyWithImpl<$Res>
    implements $LxdNetworkCardCopyWith<$Res> {
  _$LxdNetworkCardCopyWithImpl(this._value, this._then);

  final LxdNetworkCard _value;
  // ignore: unused_field
  final $Res Function(LxdNetworkCard) _then;

  @override
  $Res call({
    Object? driver = freezed,
    Object? driverVersion = freezed,
    Object? vendor = freezed,
    Object? vendorId = freezed,
  }) {
    return _then(_value.copyWith(
      driver: driver == freezed
          ? _value.driver
          : driver // ignore: cast_nullable_to_non_nullable
              as String,
      driverVersion: driverVersion == freezed
          ? _value.driverVersion
          : driverVersion // ignore: cast_nullable_to_non_nullable
              as String,
      vendor: vendor == freezed
          ? _value.vendor
          : vendor // ignore: cast_nullable_to_non_nullable
              as String,
      vendorId: vendorId == freezed
          ? _value.vendorId
          : vendorId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_LxdNetworkCardCopyWith<$Res>
    implements $LxdNetworkCardCopyWith<$Res> {
  factory _$$_LxdNetworkCardCopyWith(
          _$_LxdNetworkCard value, $Res Function(_$_LxdNetworkCard) then) =
      __$$_LxdNetworkCardCopyWithImpl<$Res>;
  @override
  $Res call(
      {String driver, String driverVersion, String vendor, String vendorId});
}

/// @nodoc
class __$$_LxdNetworkCardCopyWithImpl<$Res>
    extends _$LxdNetworkCardCopyWithImpl<$Res>
    implements _$$_LxdNetworkCardCopyWith<$Res> {
  __$$_LxdNetworkCardCopyWithImpl(
      _$_LxdNetworkCard _value, $Res Function(_$_LxdNetworkCard) _then)
      : super(_value, (v) => _then(v as _$_LxdNetworkCard));

  @override
  _$_LxdNetworkCard get _value => super._value as _$_LxdNetworkCard;

  @override
  $Res call({
    Object? driver = freezed,
    Object? driverVersion = freezed,
    Object? vendor = freezed,
    Object? vendorId = freezed,
  }) {
    return _then(_$_LxdNetworkCard(
      driver: driver == freezed
          ? _value.driver
          : driver // ignore: cast_nullable_to_non_nullable
              as String,
      driverVersion: driverVersion == freezed
          ? _value.driverVersion
          : driverVersion // ignore: cast_nullable_to_non_nullable
              as String,
      vendor: vendor == freezed
          ? _value.vendor
          : vendor // ignore: cast_nullable_to_non_nullable
              as String,
      vendorId: vendorId == freezed
          ? _value.vendorId
          : vendorId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_LxdNetworkCard implements _LxdNetworkCard {
  const _$_LxdNetworkCard(
      {required this.driver,
      required this.driverVersion,
      required this.vendor,
      required this.vendorId});

  factory _$_LxdNetworkCard.fromJson(Map<String, dynamic> json) =>
      _$$_LxdNetworkCardFromJson(json);

  @override
  final String driver;
  @override
  final String driverVersion;
  @override
  final String vendor;
  @override
  final String vendorId;

  @override
  String toString() {
    return 'LxdNetworkCard(driver: $driver, driverVersion: $driverVersion, vendor: $vendor, vendorId: $vendorId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LxdNetworkCard &&
            const DeepCollectionEquality().equals(other.driver, driver) &&
            const DeepCollectionEquality()
                .equals(other.driverVersion, driverVersion) &&
            const DeepCollectionEquality().equals(other.vendor, vendor) &&
            const DeepCollectionEquality().equals(other.vendorId, vendorId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(driver),
      const DeepCollectionEquality().hash(driverVersion),
      const DeepCollectionEquality().hash(vendor),
      const DeepCollectionEquality().hash(vendorId));

  @JsonKey(ignore: true)
  @override
  _$$_LxdNetworkCardCopyWith<_$_LxdNetworkCard> get copyWith =>
      __$$_LxdNetworkCardCopyWithImpl<_$_LxdNetworkCard>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_LxdNetworkCardToJson(this);
  }
}

abstract class _LxdNetworkCard implements LxdNetworkCard {
  const factory _LxdNetworkCard(
      {required final String driver,
      required final String driverVersion,
      required final String vendor,
      required final String vendorId}) = _$_LxdNetworkCard;

  factory _LxdNetworkCard.fromJson(Map<String, dynamic> json) =
      _$_LxdNetworkCard.fromJson;

  @override
  String get driver => throw _privateConstructorUsedError;
  @override
  String get driverVersion => throw _privateConstructorUsedError;
  @override
  String get vendor => throw _privateConstructorUsedError;
  @override
  String get vendorId => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_LxdNetworkCardCopyWith<_$_LxdNetworkCard> get copyWith =>
      throw _privateConstructorUsedError;
}

LxdStorageResources _$LxdStorageResourcesFromJson(Map<String, dynamic> json) {
  return _LxdStorageResources.fromJson(json);
}

/// @nodoc
mixin _$LxdStorageResources {
  List<LxdStorageDisk> get disks => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LxdStorageResourcesCopyWith<LxdStorageResources> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LxdStorageResourcesCopyWith<$Res> {
  factory $LxdStorageResourcesCopyWith(
          LxdStorageResources value, $Res Function(LxdStorageResources) then) =
      _$LxdStorageResourcesCopyWithImpl<$Res>;
  $Res call({List<LxdStorageDisk> disks});
}

/// @nodoc
class _$LxdStorageResourcesCopyWithImpl<$Res>
    implements $LxdStorageResourcesCopyWith<$Res> {
  _$LxdStorageResourcesCopyWithImpl(this._value, this._then);

  final LxdStorageResources _value;
  // ignore: unused_field
  final $Res Function(LxdStorageResources) _then;

  @override
  $Res call({
    Object? disks = freezed,
  }) {
    return _then(_value.copyWith(
      disks: disks == freezed
          ? _value.disks
          : disks // ignore: cast_nullable_to_non_nullable
              as List<LxdStorageDisk>,
    ));
  }
}

/// @nodoc
abstract class _$$_LxdStorageResourcesCopyWith<$Res>
    implements $LxdStorageResourcesCopyWith<$Res> {
  factory _$$_LxdStorageResourcesCopyWith(_$_LxdStorageResources value,
          $Res Function(_$_LxdStorageResources) then) =
      __$$_LxdStorageResourcesCopyWithImpl<$Res>;
  @override
  $Res call({List<LxdStorageDisk> disks});
}

/// @nodoc
class __$$_LxdStorageResourcesCopyWithImpl<$Res>
    extends _$LxdStorageResourcesCopyWithImpl<$Res>
    implements _$$_LxdStorageResourcesCopyWith<$Res> {
  __$$_LxdStorageResourcesCopyWithImpl(_$_LxdStorageResources _value,
      $Res Function(_$_LxdStorageResources) _then)
      : super(_value, (v) => _then(v as _$_LxdStorageResources));

  @override
  _$_LxdStorageResources get _value => super._value as _$_LxdStorageResources;

  @override
  $Res call({
    Object? disks = freezed,
  }) {
    return _then(_$_LxdStorageResources(
      disks: disks == freezed
          ? _value._disks
          : disks // ignore: cast_nullable_to_non_nullable
              as List<LxdStorageDisk>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_LxdStorageResources implements _LxdStorageResources {
  const _$_LxdStorageResources({required final List<LxdStorageDisk> disks})
      : _disks = disks;

  factory _$_LxdStorageResources.fromJson(Map<String, dynamic> json) =>
      _$$_LxdStorageResourcesFromJson(json);

  final List<LxdStorageDisk> _disks;
  @override
  List<LxdStorageDisk> get disks {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_disks);
  }

  @override
  String toString() {
    return 'LxdStorageResources(disks: $disks)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LxdStorageResources &&
            const DeepCollectionEquality().equals(other._disks, _disks));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_disks));

  @JsonKey(ignore: true)
  @override
  _$$_LxdStorageResourcesCopyWith<_$_LxdStorageResources> get copyWith =>
      __$$_LxdStorageResourcesCopyWithImpl<_$_LxdStorageResources>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_LxdStorageResourcesToJson(this);
  }
}

abstract class _LxdStorageResources implements LxdStorageResources {
  const factory _LxdStorageResources(
      {required final List<LxdStorageDisk> disks}) = _$_LxdStorageResources;

  factory _LxdStorageResources.fromJson(Map<String, dynamic> json) =
      _$_LxdStorageResources.fromJson;

  @override
  List<LxdStorageDisk> get disks => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_LxdStorageResourcesCopyWith<_$_LxdStorageResources> get copyWith =>
      throw _privateConstructorUsedError;
}

LxdStorageDisk _$LxdStorageDiskFromJson(Map<String, dynamic> json) {
  return _LxdStorageDisk.fromJson(json);
}

/// @nodoc
mixin _$LxdStorageDisk {
  String get id => throw _privateConstructorUsedError;
  String get model => throw _privateConstructorUsedError;
  String get serial => throw _privateConstructorUsedError;
  int get size => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LxdStorageDiskCopyWith<LxdStorageDisk> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LxdStorageDiskCopyWith<$Res> {
  factory $LxdStorageDiskCopyWith(
          LxdStorageDisk value, $Res Function(LxdStorageDisk) then) =
      _$LxdStorageDiskCopyWithImpl<$Res>;
  $Res call({String id, String model, String serial, int size, String type});
}

/// @nodoc
class _$LxdStorageDiskCopyWithImpl<$Res>
    implements $LxdStorageDiskCopyWith<$Res> {
  _$LxdStorageDiskCopyWithImpl(this._value, this._then);

  final LxdStorageDisk _value;
  // ignore: unused_field
  final $Res Function(LxdStorageDisk) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? model = freezed,
    Object? serial = freezed,
    Object? size = freezed,
    Object? type = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      model: model == freezed
          ? _value.model
          : model // ignore: cast_nullable_to_non_nullable
              as String,
      serial: serial == freezed
          ? _value.serial
          : serial // ignore: cast_nullable_to_non_nullable
              as String,
      size: size == freezed
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as int,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_LxdStorageDiskCopyWith<$Res>
    implements $LxdStorageDiskCopyWith<$Res> {
  factory _$$_LxdStorageDiskCopyWith(
          _$_LxdStorageDisk value, $Res Function(_$_LxdStorageDisk) then) =
      __$$_LxdStorageDiskCopyWithImpl<$Res>;
  @override
  $Res call({String id, String model, String serial, int size, String type});
}

/// @nodoc
class __$$_LxdStorageDiskCopyWithImpl<$Res>
    extends _$LxdStorageDiskCopyWithImpl<$Res>
    implements _$$_LxdStorageDiskCopyWith<$Res> {
  __$$_LxdStorageDiskCopyWithImpl(
      _$_LxdStorageDisk _value, $Res Function(_$_LxdStorageDisk) _then)
      : super(_value, (v) => _then(v as _$_LxdStorageDisk));

  @override
  _$_LxdStorageDisk get _value => super._value as _$_LxdStorageDisk;

  @override
  $Res call({
    Object? id = freezed,
    Object? model = freezed,
    Object? serial = freezed,
    Object? size = freezed,
    Object? type = freezed,
  }) {
    return _then(_$_LxdStorageDisk(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      model: model == freezed
          ? _value.model
          : model // ignore: cast_nullable_to_non_nullable
              as String,
      serial: serial == freezed
          ? _value.serial
          : serial // ignore: cast_nullable_to_non_nullable
              as String,
      size: size == freezed
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as int,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_LxdStorageDisk implements _LxdStorageDisk {
  const _$_LxdStorageDisk(
      {required this.id,
      required this.model,
      required this.serial,
      required this.size,
      required this.type});

  factory _$_LxdStorageDisk.fromJson(Map<String, dynamic> json) =>
      _$$_LxdStorageDiskFromJson(json);

  @override
  final String id;
  @override
  final String model;
  @override
  final String serial;
  @override
  final int size;
  @override
  final String type;

  @override
  String toString() {
    return 'LxdStorageDisk(id: $id, model: $model, serial: $serial, size: $size, type: $type)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LxdStorageDisk &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.model, model) &&
            const DeepCollectionEquality().equals(other.serial, serial) &&
            const DeepCollectionEquality().equals(other.size, size) &&
            const DeepCollectionEquality().equals(other.type, type));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(model),
      const DeepCollectionEquality().hash(serial),
      const DeepCollectionEquality().hash(size),
      const DeepCollectionEquality().hash(type));

  @JsonKey(ignore: true)
  @override
  _$$_LxdStorageDiskCopyWith<_$_LxdStorageDisk> get copyWith =>
      __$$_LxdStorageDiskCopyWithImpl<_$_LxdStorageDisk>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_LxdStorageDiskToJson(this);
  }
}

abstract class _LxdStorageDisk implements LxdStorageDisk {
  const factory _LxdStorageDisk(
      {required final String id,
      required final String model,
      required final String serial,
      required final int size,
      required final String type}) = _$_LxdStorageDisk;

  factory _LxdStorageDisk.fromJson(Map<String, dynamic> json) =
      _$_LxdStorageDisk.fromJson;

  @override
  String get id => throw _privateConstructorUsedError;
  @override
  String get model => throw _privateConstructorUsedError;
  @override
  String get serial => throw _privateConstructorUsedError;
  @override
  int get size => throw _privateConstructorUsedError;
  @override
  String get type => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_LxdStorageDiskCopyWith<_$_LxdStorageDisk> get copyWith =>
      throw _privateConstructorUsedError;
}

LxdUsbResources _$LxdUsbResourcesFromJson(Map<String, dynamic> json) {
  return _LxdUsbResources.fromJson(json);
}

/// @nodoc
mixin _$LxdUsbResources {
  List<LxdUsbDevice> get devices => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LxdUsbResourcesCopyWith<LxdUsbResources> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LxdUsbResourcesCopyWith<$Res> {
  factory $LxdUsbResourcesCopyWith(
          LxdUsbResources value, $Res Function(LxdUsbResources) then) =
      _$LxdUsbResourcesCopyWithImpl<$Res>;
  $Res call({List<LxdUsbDevice> devices});
}

/// @nodoc
class _$LxdUsbResourcesCopyWithImpl<$Res>
    implements $LxdUsbResourcesCopyWith<$Res> {
  _$LxdUsbResourcesCopyWithImpl(this._value, this._then);

  final LxdUsbResources _value;
  // ignore: unused_field
  final $Res Function(LxdUsbResources) _then;

  @override
  $Res call({
    Object? devices = freezed,
  }) {
    return _then(_value.copyWith(
      devices: devices == freezed
          ? _value.devices
          : devices // ignore: cast_nullable_to_non_nullable
              as List<LxdUsbDevice>,
    ));
  }
}

/// @nodoc
abstract class _$$_LxdUsbResourcesCopyWith<$Res>
    implements $LxdUsbResourcesCopyWith<$Res> {
  factory _$$_LxdUsbResourcesCopyWith(
          _$_LxdUsbResources value, $Res Function(_$_LxdUsbResources) then) =
      __$$_LxdUsbResourcesCopyWithImpl<$Res>;
  @override
  $Res call({List<LxdUsbDevice> devices});
}

/// @nodoc
class __$$_LxdUsbResourcesCopyWithImpl<$Res>
    extends _$LxdUsbResourcesCopyWithImpl<$Res>
    implements _$$_LxdUsbResourcesCopyWith<$Res> {
  __$$_LxdUsbResourcesCopyWithImpl(
      _$_LxdUsbResources _value, $Res Function(_$_LxdUsbResources) _then)
      : super(_value, (v) => _then(v as _$_LxdUsbResources));

  @override
  _$_LxdUsbResources get _value => super._value as _$_LxdUsbResources;

  @override
  $Res call({
    Object? devices = freezed,
  }) {
    return _then(_$_LxdUsbResources(
      devices: devices == freezed
          ? _value._devices
          : devices // ignore: cast_nullable_to_non_nullable
              as List<LxdUsbDevice>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_LxdUsbResources implements _LxdUsbResources {
  const _$_LxdUsbResources({required final List<LxdUsbDevice> devices})
      : _devices = devices;

  factory _$_LxdUsbResources.fromJson(Map<String, dynamic> json) =>
      _$$_LxdUsbResourcesFromJson(json);

  final List<LxdUsbDevice> _devices;
  @override
  List<LxdUsbDevice> get devices {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_devices);
  }

  @override
  String toString() {
    return 'LxdUsbResources(devices: $devices)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LxdUsbResources &&
            const DeepCollectionEquality().equals(other._devices, _devices));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_devices));

  @JsonKey(ignore: true)
  @override
  _$$_LxdUsbResourcesCopyWith<_$_LxdUsbResources> get copyWith =>
      __$$_LxdUsbResourcesCopyWithImpl<_$_LxdUsbResources>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_LxdUsbResourcesToJson(this);
  }
}

abstract class _LxdUsbResources implements LxdUsbResources {
  const factory _LxdUsbResources({required final List<LxdUsbDevice> devices}) =
      _$_LxdUsbResources;

  factory _LxdUsbResources.fromJson(Map<String, dynamic> json) =
      _$_LxdUsbResources.fromJson;

  @override
  List<LxdUsbDevice> get devices => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_LxdUsbResourcesCopyWith<_$_LxdUsbResources> get copyWith =>
      throw _privateConstructorUsedError;
}

LxdUsbDevice _$LxdUsbDeviceFromJson(Map<String, dynamic> json) {
  return _LxdUsbDevice.fromJson(json);
}

/// @nodoc
mixin _$LxdUsbDevice {
  int get busAddress => throw _privateConstructorUsedError;
  int get deviceAddress => throw _privateConstructorUsedError;
  String get product => throw _privateConstructorUsedError;
  String get productId => throw _privateConstructorUsedError;
  double get speed => throw _privateConstructorUsedError;
  String get vendor => throw _privateConstructorUsedError;
  String get vendorId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LxdUsbDeviceCopyWith<LxdUsbDevice> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LxdUsbDeviceCopyWith<$Res> {
  factory $LxdUsbDeviceCopyWith(
          LxdUsbDevice value, $Res Function(LxdUsbDevice) then) =
      _$LxdUsbDeviceCopyWithImpl<$Res>;
  $Res call(
      {int busAddress,
      int deviceAddress,
      String product,
      String productId,
      double speed,
      String vendor,
      String vendorId});
}

/// @nodoc
class _$LxdUsbDeviceCopyWithImpl<$Res> implements $LxdUsbDeviceCopyWith<$Res> {
  _$LxdUsbDeviceCopyWithImpl(this._value, this._then);

  final LxdUsbDevice _value;
  // ignore: unused_field
  final $Res Function(LxdUsbDevice) _then;

  @override
  $Res call({
    Object? busAddress = freezed,
    Object? deviceAddress = freezed,
    Object? product = freezed,
    Object? productId = freezed,
    Object? speed = freezed,
    Object? vendor = freezed,
    Object? vendorId = freezed,
  }) {
    return _then(_value.copyWith(
      busAddress: busAddress == freezed
          ? _value.busAddress
          : busAddress // ignore: cast_nullable_to_non_nullable
              as int,
      deviceAddress: deviceAddress == freezed
          ? _value.deviceAddress
          : deviceAddress // ignore: cast_nullable_to_non_nullable
              as int,
      product: product == freezed
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as String,
      productId: productId == freezed
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as String,
      speed: speed == freezed
          ? _value.speed
          : speed // ignore: cast_nullable_to_non_nullable
              as double,
      vendor: vendor == freezed
          ? _value.vendor
          : vendor // ignore: cast_nullable_to_non_nullable
              as String,
      vendorId: vendorId == freezed
          ? _value.vendorId
          : vendorId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_LxdUsbDeviceCopyWith<$Res>
    implements $LxdUsbDeviceCopyWith<$Res> {
  factory _$$_LxdUsbDeviceCopyWith(
          _$_LxdUsbDevice value, $Res Function(_$_LxdUsbDevice) then) =
      __$$_LxdUsbDeviceCopyWithImpl<$Res>;
  @override
  $Res call(
      {int busAddress,
      int deviceAddress,
      String product,
      String productId,
      double speed,
      String vendor,
      String vendorId});
}

/// @nodoc
class __$$_LxdUsbDeviceCopyWithImpl<$Res>
    extends _$LxdUsbDeviceCopyWithImpl<$Res>
    implements _$$_LxdUsbDeviceCopyWith<$Res> {
  __$$_LxdUsbDeviceCopyWithImpl(
      _$_LxdUsbDevice _value, $Res Function(_$_LxdUsbDevice) _then)
      : super(_value, (v) => _then(v as _$_LxdUsbDevice));

  @override
  _$_LxdUsbDevice get _value => super._value as _$_LxdUsbDevice;

  @override
  $Res call({
    Object? busAddress = freezed,
    Object? deviceAddress = freezed,
    Object? product = freezed,
    Object? productId = freezed,
    Object? speed = freezed,
    Object? vendor = freezed,
    Object? vendorId = freezed,
  }) {
    return _then(_$_LxdUsbDevice(
      busAddress: busAddress == freezed
          ? _value.busAddress
          : busAddress // ignore: cast_nullable_to_non_nullable
              as int,
      deviceAddress: deviceAddress == freezed
          ? _value.deviceAddress
          : deviceAddress // ignore: cast_nullable_to_non_nullable
              as int,
      product: product == freezed
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as String,
      productId: productId == freezed
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as String,
      speed: speed == freezed
          ? _value.speed
          : speed // ignore: cast_nullable_to_non_nullable
              as double,
      vendor: vendor == freezed
          ? _value.vendor
          : vendor // ignore: cast_nullable_to_non_nullable
              as String,
      vendorId: vendorId == freezed
          ? _value.vendorId
          : vendorId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_LxdUsbDevice implements _LxdUsbDevice {
  const _$_LxdUsbDevice(
      {required this.busAddress,
      required this.deviceAddress,
      required this.product,
      required this.productId,
      required this.speed,
      required this.vendor,
      required this.vendorId});

  factory _$_LxdUsbDevice.fromJson(Map<String, dynamic> json) =>
      _$$_LxdUsbDeviceFromJson(json);

  @override
  final int busAddress;
  @override
  final int deviceAddress;
  @override
  final String product;
  @override
  final String productId;
  @override
  final double speed;
  @override
  final String vendor;
  @override
  final String vendorId;

  @override
  String toString() {
    return 'LxdUsbDevice(busAddress: $busAddress, deviceAddress: $deviceAddress, product: $product, productId: $productId, speed: $speed, vendor: $vendor, vendorId: $vendorId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LxdUsbDevice &&
            const DeepCollectionEquality()
                .equals(other.busAddress, busAddress) &&
            const DeepCollectionEquality()
                .equals(other.deviceAddress, deviceAddress) &&
            const DeepCollectionEquality().equals(other.product, product) &&
            const DeepCollectionEquality().equals(other.productId, productId) &&
            const DeepCollectionEquality().equals(other.speed, speed) &&
            const DeepCollectionEquality().equals(other.vendor, vendor) &&
            const DeepCollectionEquality().equals(other.vendorId, vendorId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(busAddress),
      const DeepCollectionEquality().hash(deviceAddress),
      const DeepCollectionEquality().hash(product),
      const DeepCollectionEquality().hash(productId),
      const DeepCollectionEquality().hash(speed),
      const DeepCollectionEquality().hash(vendor),
      const DeepCollectionEquality().hash(vendorId));

  @JsonKey(ignore: true)
  @override
  _$$_LxdUsbDeviceCopyWith<_$_LxdUsbDevice> get copyWith =>
      __$$_LxdUsbDeviceCopyWithImpl<_$_LxdUsbDevice>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_LxdUsbDeviceToJson(this);
  }
}

abstract class _LxdUsbDevice implements LxdUsbDevice {
  const factory _LxdUsbDevice(
      {required final int busAddress,
      required final int deviceAddress,
      required final String product,
      required final String productId,
      required final double speed,
      required final String vendor,
      required final String vendorId}) = _$_LxdUsbDevice;

  factory _LxdUsbDevice.fromJson(Map<String, dynamic> json) =
      _$_LxdUsbDevice.fromJson;

  @override
  int get busAddress => throw _privateConstructorUsedError;
  @override
  int get deviceAddress => throw _privateConstructorUsedError;
  @override
  String get product => throw _privateConstructorUsedError;
  @override
  String get productId => throw _privateConstructorUsedError;
  @override
  double get speed => throw _privateConstructorUsedError;
  @override
  String get vendor => throw _privateConstructorUsedError;
  @override
  String get vendorId => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_LxdUsbDeviceCopyWith<_$_LxdUsbDevice> get copyWith =>
      throw _privateConstructorUsedError;
}

LxdPciResources _$LxdPciResourcesFromJson(Map<String, dynamic> json) {
  return _LxdPciResources.fromJson(json);
}

/// @nodoc
mixin _$LxdPciResources {
  List<LxdPciDevice> get devices => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LxdPciResourcesCopyWith<LxdPciResources> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LxdPciResourcesCopyWith<$Res> {
  factory $LxdPciResourcesCopyWith(
          LxdPciResources value, $Res Function(LxdPciResources) then) =
      _$LxdPciResourcesCopyWithImpl<$Res>;
  $Res call({List<LxdPciDevice> devices});
}

/// @nodoc
class _$LxdPciResourcesCopyWithImpl<$Res>
    implements $LxdPciResourcesCopyWith<$Res> {
  _$LxdPciResourcesCopyWithImpl(this._value, this._then);

  final LxdPciResources _value;
  // ignore: unused_field
  final $Res Function(LxdPciResources) _then;

  @override
  $Res call({
    Object? devices = freezed,
  }) {
    return _then(_value.copyWith(
      devices: devices == freezed
          ? _value.devices
          : devices // ignore: cast_nullable_to_non_nullable
              as List<LxdPciDevice>,
    ));
  }
}

/// @nodoc
abstract class _$$_LxdPciResourcesCopyWith<$Res>
    implements $LxdPciResourcesCopyWith<$Res> {
  factory _$$_LxdPciResourcesCopyWith(
          _$_LxdPciResources value, $Res Function(_$_LxdPciResources) then) =
      __$$_LxdPciResourcesCopyWithImpl<$Res>;
  @override
  $Res call({List<LxdPciDevice> devices});
}

/// @nodoc
class __$$_LxdPciResourcesCopyWithImpl<$Res>
    extends _$LxdPciResourcesCopyWithImpl<$Res>
    implements _$$_LxdPciResourcesCopyWith<$Res> {
  __$$_LxdPciResourcesCopyWithImpl(
      _$_LxdPciResources _value, $Res Function(_$_LxdPciResources) _then)
      : super(_value, (v) => _then(v as _$_LxdPciResources));

  @override
  _$_LxdPciResources get _value => super._value as _$_LxdPciResources;

  @override
  $Res call({
    Object? devices = freezed,
  }) {
    return _then(_$_LxdPciResources(
      devices: devices == freezed
          ? _value._devices
          : devices // ignore: cast_nullable_to_non_nullable
              as List<LxdPciDevice>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_LxdPciResources implements _LxdPciResources {
  const _$_LxdPciResources({required final List<LxdPciDevice> devices})
      : _devices = devices;

  factory _$_LxdPciResources.fromJson(Map<String, dynamic> json) =>
      _$$_LxdPciResourcesFromJson(json);

  final List<LxdPciDevice> _devices;
  @override
  List<LxdPciDevice> get devices {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_devices);
  }

  @override
  String toString() {
    return 'LxdPciResources(devices: $devices)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LxdPciResources &&
            const DeepCollectionEquality().equals(other._devices, _devices));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_devices));

  @JsonKey(ignore: true)
  @override
  _$$_LxdPciResourcesCopyWith<_$_LxdPciResources> get copyWith =>
      __$$_LxdPciResourcesCopyWithImpl<_$_LxdPciResources>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_LxdPciResourcesToJson(this);
  }
}

abstract class _LxdPciResources implements LxdPciResources {
  const factory _LxdPciResources({required final List<LxdPciDevice> devices}) =
      _$_LxdPciResources;

  factory _LxdPciResources.fromJson(Map<String, dynamic> json) =
      _$_LxdPciResources.fromJson;

  @override
  List<LxdPciDevice> get devices => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_LxdPciResourcesCopyWith<_$_LxdPciResources> get copyWith =>
      throw _privateConstructorUsedError;
}

LxdPciDevice _$LxdPciDeviceFromJson(Map<String, dynamic> json) {
  return _LxdPciDevice.fromJson(json);
}

/// @nodoc
mixin _$LxdPciDevice {
  String get driver => throw _privateConstructorUsedError;
  String get driverVersion => throw _privateConstructorUsedError;
  String get pciAddress => throw _privateConstructorUsedError;
  String get product => throw _privateConstructorUsedError;
  String get productId => throw _privateConstructorUsedError;
  String get vendor => throw _privateConstructorUsedError;
  String get vendorId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LxdPciDeviceCopyWith<LxdPciDevice> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LxdPciDeviceCopyWith<$Res> {
  factory $LxdPciDeviceCopyWith(
          LxdPciDevice value, $Res Function(LxdPciDevice) then) =
      _$LxdPciDeviceCopyWithImpl<$Res>;
  $Res call(
      {String driver,
      String driverVersion,
      String pciAddress,
      String product,
      String productId,
      String vendor,
      String vendorId});
}

/// @nodoc
class _$LxdPciDeviceCopyWithImpl<$Res> implements $LxdPciDeviceCopyWith<$Res> {
  _$LxdPciDeviceCopyWithImpl(this._value, this._then);

  final LxdPciDevice _value;
  // ignore: unused_field
  final $Res Function(LxdPciDevice) _then;

  @override
  $Res call({
    Object? driver = freezed,
    Object? driverVersion = freezed,
    Object? pciAddress = freezed,
    Object? product = freezed,
    Object? productId = freezed,
    Object? vendor = freezed,
    Object? vendorId = freezed,
  }) {
    return _then(_value.copyWith(
      driver: driver == freezed
          ? _value.driver
          : driver // ignore: cast_nullable_to_non_nullable
              as String,
      driverVersion: driverVersion == freezed
          ? _value.driverVersion
          : driverVersion // ignore: cast_nullable_to_non_nullable
              as String,
      pciAddress: pciAddress == freezed
          ? _value.pciAddress
          : pciAddress // ignore: cast_nullable_to_non_nullable
              as String,
      product: product == freezed
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as String,
      productId: productId == freezed
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as String,
      vendor: vendor == freezed
          ? _value.vendor
          : vendor // ignore: cast_nullable_to_non_nullable
              as String,
      vendorId: vendorId == freezed
          ? _value.vendorId
          : vendorId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_LxdPciDeviceCopyWith<$Res>
    implements $LxdPciDeviceCopyWith<$Res> {
  factory _$$_LxdPciDeviceCopyWith(
          _$_LxdPciDevice value, $Res Function(_$_LxdPciDevice) then) =
      __$$_LxdPciDeviceCopyWithImpl<$Res>;
  @override
  $Res call(
      {String driver,
      String driverVersion,
      String pciAddress,
      String product,
      String productId,
      String vendor,
      String vendorId});
}

/// @nodoc
class __$$_LxdPciDeviceCopyWithImpl<$Res>
    extends _$LxdPciDeviceCopyWithImpl<$Res>
    implements _$$_LxdPciDeviceCopyWith<$Res> {
  __$$_LxdPciDeviceCopyWithImpl(
      _$_LxdPciDevice _value, $Res Function(_$_LxdPciDevice) _then)
      : super(_value, (v) => _then(v as _$_LxdPciDevice));

  @override
  _$_LxdPciDevice get _value => super._value as _$_LxdPciDevice;

  @override
  $Res call({
    Object? driver = freezed,
    Object? driverVersion = freezed,
    Object? pciAddress = freezed,
    Object? product = freezed,
    Object? productId = freezed,
    Object? vendor = freezed,
    Object? vendorId = freezed,
  }) {
    return _then(_$_LxdPciDevice(
      driver: driver == freezed
          ? _value.driver
          : driver // ignore: cast_nullable_to_non_nullable
              as String,
      driverVersion: driverVersion == freezed
          ? _value.driverVersion
          : driverVersion // ignore: cast_nullable_to_non_nullable
              as String,
      pciAddress: pciAddress == freezed
          ? _value.pciAddress
          : pciAddress // ignore: cast_nullable_to_non_nullable
              as String,
      product: product == freezed
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as String,
      productId: productId == freezed
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as String,
      vendor: vendor == freezed
          ? _value.vendor
          : vendor // ignore: cast_nullable_to_non_nullable
              as String,
      vendorId: vendorId == freezed
          ? _value.vendorId
          : vendorId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_LxdPciDevice implements _LxdPciDevice {
  const _$_LxdPciDevice(
      {required this.driver,
      required this.driverVersion,
      required this.pciAddress,
      required this.product,
      required this.productId,
      required this.vendor,
      required this.vendorId});

  factory _$_LxdPciDevice.fromJson(Map<String, dynamic> json) =>
      _$$_LxdPciDeviceFromJson(json);

  @override
  final String driver;
  @override
  final String driverVersion;
  @override
  final String pciAddress;
  @override
  final String product;
  @override
  final String productId;
  @override
  final String vendor;
  @override
  final String vendorId;

  @override
  String toString() {
    return 'LxdPciDevice(driver: $driver, driverVersion: $driverVersion, pciAddress: $pciAddress, product: $product, productId: $productId, vendor: $vendor, vendorId: $vendorId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LxdPciDevice &&
            const DeepCollectionEquality().equals(other.driver, driver) &&
            const DeepCollectionEquality()
                .equals(other.driverVersion, driverVersion) &&
            const DeepCollectionEquality()
                .equals(other.pciAddress, pciAddress) &&
            const DeepCollectionEquality().equals(other.product, product) &&
            const DeepCollectionEquality().equals(other.productId, productId) &&
            const DeepCollectionEquality().equals(other.vendor, vendor) &&
            const DeepCollectionEquality().equals(other.vendorId, vendorId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(driver),
      const DeepCollectionEquality().hash(driverVersion),
      const DeepCollectionEquality().hash(pciAddress),
      const DeepCollectionEquality().hash(product),
      const DeepCollectionEquality().hash(productId),
      const DeepCollectionEquality().hash(vendor),
      const DeepCollectionEquality().hash(vendorId));

  @JsonKey(ignore: true)
  @override
  _$$_LxdPciDeviceCopyWith<_$_LxdPciDevice> get copyWith =>
      __$$_LxdPciDeviceCopyWithImpl<_$_LxdPciDevice>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_LxdPciDeviceToJson(this);
  }
}

abstract class _LxdPciDevice implements LxdPciDevice {
  const factory _LxdPciDevice(
      {required final String driver,
      required final String driverVersion,
      required final String pciAddress,
      required final String product,
      required final String productId,
      required final String vendor,
      required final String vendorId}) = _$_LxdPciDevice;

  factory _LxdPciDevice.fromJson(Map<String, dynamic> json) =
      _$_LxdPciDevice.fromJson;

  @override
  String get driver => throw _privateConstructorUsedError;
  @override
  String get driverVersion => throw _privateConstructorUsedError;
  @override
  String get pciAddress => throw _privateConstructorUsedError;
  @override
  String get product => throw _privateConstructorUsedError;
  @override
  String get productId => throw _privateConstructorUsedError;
  @override
  String get vendor => throw _privateConstructorUsedError;
  @override
  String get vendorId => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_LxdPciDeviceCopyWith<_$_LxdPciDevice> get copyWith =>
      throw _privateConstructorUsedError;
}

LxdFirmware _$LxdFirmwareFromJson(Map<String, dynamic> json) {
  return _LxdFirmware.fromJson(json);
}

/// @nodoc
mixin _$LxdFirmware {
  String get date => throw _privateConstructorUsedError;
  String get vendor => throw _privateConstructorUsedError;
  String get version => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LxdFirmwareCopyWith<LxdFirmware> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LxdFirmwareCopyWith<$Res> {
  factory $LxdFirmwareCopyWith(
          LxdFirmware value, $Res Function(LxdFirmware) then) =
      _$LxdFirmwareCopyWithImpl<$Res>;
  $Res call({String date, String vendor, String version});
}

/// @nodoc
class _$LxdFirmwareCopyWithImpl<$Res> implements $LxdFirmwareCopyWith<$Res> {
  _$LxdFirmwareCopyWithImpl(this._value, this._then);

  final LxdFirmware _value;
  // ignore: unused_field
  final $Res Function(LxdFirmware) _then;

  @override
  $Res call({
    Object? date = freezed,
    Object? vendor = freezed,
    Object? version = freezed,
  }) {
    return _then(_value.copyWith(
      date: date == freezed
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      vendor: vendor == freezed
          ? _value.vendor
          : vendor // ignore: cast_nullable_to_non_nullable
              as String,
      version: version == freezed
          ? _value.version
          : version // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_LxdFirmwareCopyWith<$Res>
    implements $LxdFirmwareCopyWith<$Res> {
  factory _$$_LxdFirmwareCopyWith(
          _$_LxdFirmware value, $Res Function(_$_LxdFirmware) then) =
      __$$_LxdFirmwareCopyWithImpl<$Res>;
  @override
  $Res call({String date, String vendor, String version});
}

/// @nodoc
class __$$_LxdFirmwareCopyWithImpl<$Res> extends _$LxdFirmwareCopyWithImpl<$Res>
    implements _$$_LxdFirmwareCopyWith<$Res> {
  __$$_LxdFirmwareCopyWithImpl(
      _$_LxdFirmware _value, $Res Function(_$_LxdFirmware) _then)
      : super(_value, (v) => _then(v as _$_LxdFirmware));

  @override
  _$_LxdFirmware get _value => super._value as _$_LxdFirmware;

  @override
  $Res call({
    Object? date = freezed,
    Object? vendor = freezed,
    Object? version = freezed,
  }) {
    return _then(_$_LxdFirmware(
      date: date == freezed
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      vendor: vendor == freezed
          ? _value.vendor
          : vendor // ignore: cast_nullable_to_non_nullable
              as String,
      version: version == freezed
          ? _value.version
          : version // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_LxdFirmware implements _LxdFirmware {
  const _$_LxdFirmware(
      {required this.date, required this.vendor, required this.version});

  factory _$_LxdFirmware.fromJson(Map<String, dynamic> json) =>
      _$$_LxdFirmwareFromJson(json);

  @override
  final String date;
  @override
  final String vendor;
  @override
  final String version;

  @override
  String toString() {
    return 'LxdFirmware(date: $date, vendor: $vendor, version: $version)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LxdFirmware &&
            const DeepCollectionEquality().equals(other.date, date) &&
            const DeepCollectionEquality().equals(other.vendor, vendor) &&
            const DeepCollectionEquality().equals(other.version, version));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(date),
      const DeepCollectionEquality().hash(vendor),
      const DeepCollectionEquality().hash(version));

  @JsonKey(ignore: true)
  @override
  _$$_LxdFirmwareCopyWith<_$_LxdFirmware> get copyWith =>
      __$$_LxdFirmwareCopyWithImpl<_$_LxdFirmware>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_LxdFirmwareToJson(this);
  }
}

abstract class _LxdFirmware implements LxdFirmware {
  const factory _LxdFirmware(
      {required final String date,
      required final String vendor,
      required final String version}) = _$_LxdFirmware;

  factory _LxdFirmware.fromJson(Map<String, dynamic> json) =
      _$_LxdFirmware.fromJson;

  @override
  String get date => throw _privateConstructorUsedError;
  @override
  String get vendor => throw _privateConstructorUsedError;
  @override
  String get version => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_LxdFirmwareCopyWith<_$_LxdFirmware> get copyWith =>
      throw _privateConstructorUsedError;
}

LxdChassis _$LxdChassisFromJson(Map<String, dynamic> json) {
  return _LxdChassis.fromJson(json);
}

/// @nodoc
mixin _$LxdChassis {
  String get serial => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  String get vendor => throw _privateConstructorUsedError;
  String get version => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LxdChassisCopyWith<LxdChassis> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LxdChassisCopyWith<$Res> {
  factory $LxdChassisCopyWith(
          LxdChassis value, $Res Function(LxdChassis) then) =
      _$LxdChassisCopyWithImpl<$Res>;
  $Res call({String serial, String type, String vendor, String version});
}

/// @nodoc
class _$LxdChassisCopyWithImpl<$Res> implements $LxdChassisCopyWith<$Res> {
  _$LxdChassisCopyWithImpl(this._value, this._then);

  final LxdChassis _value;
  // ignore: unused_field
  final $Res Function(LxdChassis) _then;

  @override
  $Res call({
    Object? serial = freezed,
    Object? type = freezed,
    Object? vendor = freezed,
    Object? version = freezed,
  }) {
    return _then(_value.copyWith(
      serial: serial == freezed
          ? _value.serial
          : serial // ignore: cast_nullable_to_non_nullable
              as String,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      vendor: vendor == freezed
          ? _value.vendor
          : vendor // ignore: cast_nullable_to_non_nullable
              as String,
      version: version == freezed
          ? _value.version
          : version // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_LxdChassisCopyWith<$Res>
    implements $LxdChassisCopyWith<$Res> {
  factory _$$_LxdChassisCopyWith(
          _$_LxdChassis value, $Res Function(_$_LxdChassis) then) =
      __$$_LxdChassisCopyWithImpl<$Res>;
  @override
  $Res call({String serial, String type, String vendor, String version});
}

/// @nodoc
class __$$_LxdChassisCopyWithImpl<$Res> extends _$LxdChassisCopyWithImpl<$Res>
    implements _$$_LxdChassisCopyWith<$Res> {
  __$$_LxdChassisCopyWithImpl(
      _$_LxdChassis _value, $Res Function(_$_LxdChassis) _then)
      : super(_value, (v) => _then(v as _$_LxdChassis));

  @override
  _$_LxdChassis get _value => super._value as _$_LxdChassis;

  @override
  $Res call({
    Object? serial = freezed,
    Object? type = freezed,
    Object? vendor = freezed,
    Object? version = freezed,
  }) {
    return _then(_$_LxdChassis(
      serial: serial == freezed
          ? _value.serial
          : serial // ignore: cast_nullable_to_non_nullable
              as String,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      vendor: vendor == freezed
          ? _value.vendor
          : vendor // ignore: cast_nullable_to_non_nullable
              as String,
      version: version == freezed
          ? _value.version
          : version // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_LxdChassis implements _LxdChassis {
  const _$_LxdChassis(
      {required this.serial,
      required this.type,
      required this.vendor,
      required this.version});

  factory _$_LxdChassis.fromJson(Map<String, dynamic> json) =>
      _$$_LxdChassisFromJson(json);

  @override
  final String serial;
  @override
  final String type;
  @override
  final String vendor;
  @override
  final String version;

  @override
  String toString() {
    return 'LxdChassis(serial: $serial, type: $type, vendor: $vendor, version: $version)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LxdChassis &&
            const DeepCollectionEquality().equals(other.serial, serial) &&
            const DeepCollectionEquality().equals(other.type, type) &&
            const DeepCollectionEquality().equals(other.vendor, vendor) &&
            const DeepCollectionEquality().equals(other.version, version));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(serial),
      const DeepCollectionEquality().hash(type),
      const DeepCollectionEquality().hash(vendor),
      const DeepCollectionEquality().hash(version));

  @JsonKey(ignore: true)
  @override
  _$$_LxdChassisCopyWith<_$_LxdChassis> get copyWith =>
      __$$_LxdChassisCopyWithImpl<_$_LxdChassis>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_LxdChassisToJson(this);
  }
}

abstract class _LxdChassis implements LxdChassis {
  const factory _LxdChassis(
      {required final String serial,
      required final String type,
      required final String vendor,
      required final String version}) = _$_LxdChassis;

  factory _LxdChassis.fromJson(Map<String, dynamic> json) =
      _$_LxdChassis.fromJson;

  @override
  String get serial => throw _privateConstructorUsedError;
  @override
  String get type => throw _privateConstructorUsedError;
  @override
  String get vendor => throw _privateConstructorUsedError;
  @override
  String get version => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_LxdChassisCopyWith<_$_LxdChassis> get copyWith =>
      throw _privateConstructorUsedError;
}

LxdMotherboard _$LxdMotherboardFromJson(Map<String, dynamic> json) {
  return _LxdMotherboard.fromJson(json);
}

/// @nodoc
mixin _$LxdMotherboard {
  String get product => throw _privateConstructorUsedError;
  String get serial => throw _privateConstructorUsedError;
  String get vendor => throw _privateConstructorUsedError;
  String get version => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LxdMotherboardCopyWith<LxdMotherboard> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LxdMotherboardCopyWith<$Res> {
  factory $LxdMotherboardCopyWith(
          LxdMotherboard value, $Res Function(LxdMotherboard) then) =
      _$LxdMotherboardCopyWithImpl<$Res>;
  $Res call({String product, String serial, String vendor, String version});
}

/// @nodoc
class _$LxdMotherboardCopyWithImpl<$Res>
    implements $LxdMotherboardCopyWith<$Res> {
  _$LxdMotherboardCopyWithImpl(this._value, this._then);

  final LxdMotherboard _value;
  // ignore: unused_field
  final $Res Function(LxdMotherboard) _then;

  @override
  $Res call({
    Object? product = freezed,
    Object? serial = freezed,
    Object? vendor = freezed,
    Object? version = freezed,
  }) {
    return _then(_value.copyWith(
      product: product == freezed
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as String,
      serial: serial == freezed
          ? _value.serial
          : serial // ignore: cast_nullable_to_non_nullable
              as String,
      vendor: vendor == freezed
          ? _value.vendor
          : vendor // ignore: cast_nullable_to_non_nullable
              as String,
      version: version == freezed
          ? _value.version
          : version // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_LxdMotherboardCopyWith<$Res>
    implements $LxdMotherboardCopyWith<$Res> {
  factory _$$_LxdMotherboardCopyWith(
          _$_LxdMotherboard value, $Res Function(_$_LxdMotherboard) then) =
      __$$_LxdMotherboardCopyWithImpl<$Res>;
  @override
  $Res call({String product, String serial, String vendor, String version});
}

/// @nodoc
class __$$_LxdMotherboardCopyWithImpl<$Res>
    extends _$LxdMotherboardCopyWithImpl<$Res>
    implements _$$_LxdMotherboardCopyWith<$Res> {
  __$$_LxdMotherboardCopyWithImpl(
      _$_LxdMotherboard _value, $Res Function(_$_LxdMotherboard) _then)
      : super(_value, (v) => _then(v as _$_LxdMotherboard));

  @override
  _$_LxdMotherboard get _value => super._value as _$_LxdMotherboard;

  @override
  $Res call({
    Object? product = freezed,
    Object? serial = freezed,
    Object? vendor = freezed,
    Object? version = freezed,
  }) {
    return _then(_$_LxdMotherboard(
      product: product == freezed
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as String,
      serial: serial == freezed
          ? _value.serial
          : serial // ignore: cast_nullable_to_non_nullable
              as String,
      vendor: vendor == freezed
          ? _value.vendor
          : vendor // ignore: cast_nullable_to_non_nullable
              as String,
      version: version == freezed
          ? _value.version
          : version // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_LxdMotherboard implements _LxdMotherboard {
  const _$_LxdMotherboard(
      {required this.product,
      required this.serial,
      required this.vendor,
      required this.version});

  factory _$_LxdMotherboard.fromJson(Map<String, dynamic> json) =>
      _$$_LxdMotherboardFromJson(json);

  @override
  final String product;
  @override
  final String serial;
  @override
  final String vendor;
  @override
  final String version;

  @override
  String toString() {
    return 'LxdMotherboard(product: $product, serial: $serial, vendor: $vendor, version: $version)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LxdMotherboard &&
            const DeepCollectionEquality().equals(other.product, product) &&
            const DeepCollectionEquality().equals(other.serial, serial) &&
            const DeepCollectionEquality().equals(other.vendor, vendor) &&
            const DeepCollectionEquality().equals(other.version, version));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(product),
      const DeepCollectionEquality().hash(serial),
      const DeepCollectionEquality().hash(vendor),
      const DeepCollectionEquality().hash(version));

  @JsonKey(ignore: true)
  @override
  _$$_LxdMotherboardCopyWith<_$_LxdMotherboard> get copyWith =>
      __$$_LxdMotherboardCopyWithImpl<_$_LxdMotherboard>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_LxdMotherboardToJson(this);
  }
}

abstract class _LxdMotherboard implements LxdMotherboard {
  const factory _LxdMotherboard(
      {required final String product,
      required final String serial,
      required final String vendor,
      required final String version}) = _$_LxdMotherboard;

  factory _LxdMotherboard.fromJson(Map<String, dynamic> json) =
      _$_LxdMotherboard.fromJson;

  @override
  String get product => throw _privateConstructorUsedError;
  @override
  String get serial => throw _privateConstructorUsedError;
  @override
  String get vendor => throw _privateConstructorUsedError;
  @override
  String get version => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_LxdMotherboardCopyWith<_$_LxdMotherboard> get copyWith =>
      throw _privateConstructorUsedError;
}

LxdSystemResources _$LxdSystemResourcesFromJson(Map<String, dynamic> json) {
  return _LxdSystemResources.fromJson(json);
}

/// @nodoc
mixin _$LxdSystemResources {
  String get uuid => throw _privateConstructorUsedError;
  String get vendor => throw _privateConstructorUsedError;
  String get product => throw _privateConstructorUsedError;
  String get family => throw _privateConstructorUsedError;
  String get version => throw _privateConstructorUsedError;
  String get sku => throw _privateConstructorUsedError;
  String get serial => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  LxdFirmware get firmware => throw _privateConstructorUsedError;
  LxdChassis get chassis => throw _privateConstructorUsedError;
  LxdMotherboard get motherboard => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LxdSystemResourcesCopyWith<LxdSystemResources> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LxdSystemResourcesCopyWith<$Res> {
  factory $LxdSystemResourcesCopyWith(
          LxdSystemResources value, $Res Function(LxdSystemResources) then) =
      _$LxdSystemResourcesCopyWithImpl<$Res>;
  $Res call(
      {String uuid,
      String vendor,
      String product,
      String family,
      String version,
      String sku,
      String serial,
      String type,
      LxdFirmware firmware,
      LxdChassis chassis,
      LxdMotherboard motherboard});

  $LxdFirmwareCopyWith<$Res> get firmware;
  $LxdChassisCopyWith<$Res> get chassis;
  $LxdMotherboardCopyWith<$Res> get motherboard;
}

/// @nodoc
class _$LxdSystemResourcesCopyWithImpl<$Res>
    implements $LxdSystemResourcesCopyWith<$Res> {
  _$LxdSystemResourcesCopyWithImpl(this._value, this._then);

  final LxdSystemResources _value;
  // ignore: unused_field
  final $Res Function(LxdSystemResources) _then;

  @override
  $Res call({
    Object? uuid = freezed,
    Object? vendor = freezed,
    Object? product = freezed,
    Object? family = freezed,
    Object? version = freezed,
    Object? sku = freezed,
    Object? serial = freezed,
    Object? type = freezed,
    Object? firmware = freezed,
    Object? chassis = freezed,
    Object? motherboard = freezed,
  }) {
    return _then(_value.copyWith(
      uuid: uuid == freezed
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      vendor: vendor == freezed
          ? _value.vendor
          : vendor // ignore: cast_nullable_to_non_nullable
              as String,
      product: product == freezed
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as String,
      family: family == freezed
          ? _value.family
          : family // ignore: cast_nullable_to_non_nullable
              as String,
      version: version == freezed
          ? _value.version
          : version // ignore: cast_nullable_to_non_nullable
              as String,
      sku: sku == freezed
          ? _value.sku
          : sku // ignore: cast_nullable_to_non_nullable
              as String,
      serial: serial == freezed
          ? _value.serial
          : serial // ignore: cast_nullable_to_non_nullable
              as String,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      firmware: firmware == freezed
          ? _value.firmware
          : firmware // ignore: cast_nullable_to_non_nullable
              as LxdFirmware,
      chassis: chassis == freezed
          ? _value.chassis
          : chassis // ignore: cast_nullable_to_non_nullable
              as LxdChassis,
      motherboard: motherboard == freezed
          ? _value.motherboard
          : motherboard // ignore: cast_nullable_to_non_nullable
              as LxdMotherboard,
    ));
  }

  @override
  $LxdFirmwareCopyWith<$Res> get firmware {
    return $LxdFirmwareCopyWith<$Res>(_value.firmware, (value) {
      return _then(_value.copyWith(firmware: value));
    });
  }

  @override
  $LxdChassisCopyWith<$Res> get chassis {
    return $LxdChassisCopyWith<$Res>(_value.chassis, (value) {
      return _then(_value.copyWith(chassis: value));
    });
  }

  @override
  $LxdMotherboardCopyWith<$Res> get motherboard {
    return $LxdMotherboardCopyWith<$Res>(_value.motherboard, (value) {
      return _then(_value.copyWith(motherboard: value));
    });
  }
}

/// @nodoc
abstract class _$$_LxdSystemResourcesCopyWith<$Res>
    implements $LxdSystemResourcesCopyWith<$Res> {
  factory _$$_LxdSystemResourcesCopyWith(_$_LxdSystemResources value,
          $Res Function(_$_LxdSystemResources) then) =
      __$$_LxdSystemResourcesCopyWithImpl<$Res>;
  @override
  $Res call(
      {String uuid,
      String vendor,
      String product,
      String family,
      String version,
      String sku,
      String serial,
      String type,
      LxdFirmware firmware,
      LxdChassis chassis,
      LxdMotherboard motherboard});

  @override
  $LxdFirmwareCopyWith<$Res> get firmware;
  @override
  $LxdChassisCopyWith<$Res> get chassis;
  @override
  $LxdMotherboardCopyWith<$Res> get motherboard;
}

/// @nodoc
class __$$_LxdSystemResourcesCopyWithImpl<$Res>
    extends _$LxdSystemResourcesCopyWithImpl<$Res>
    implements _$$_LxdSystemResourcesCopyWith<$Res> {
  __$$_LxdSystemResourcesCopyWithImpl(
      _$_LxdSystemResources _value, $Res Function(_$_LxdSystemResources) _then)
      : super(_value, (v) => _then(v as _$_LxdSystemResources));

  @override
  _$_LxdSystemResources get _value => super._value as _$_LxdSystemResources;

  @override
  $Res call({
    Object? uuid = freezed,
    Object? vendor = freezed,
    Object? product = freezed,
    Object? family = freezed,
    Object? version = freezed,
    Object? sku = freezed,
    Object? serial = freezed,
    Object? type = freezed,
    Object? firmware = freezed,
    Object? chassis = freezed,
    Object? motherboard = freezed,
  }) {
    return _then(_$_LxdSystemResources(
      uuid: uuid == freezed
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      vendor: vendor == freezed
          ? _value.vendor
          : vendor // ignore: cast_nullable_to_non_nullable
              as String,
      product: product == freezed
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as String,
      family: family == freezed
          ? _value.family
          : family // ignore: cast_nullable_to_non_nullable
              as String,
      version: version == freezed
          ? _value.version
          : version // ignore: cast_nullable_to_non_nullable
              as String,
      sku: sku == freezed
          ? _value.sku
          : sku // ignore: cast_nullable_to_non_nullable
              as String,
      serial: serial == freezed
          ? _value.serial
          : serial // ignore: cast_nullable_to_non_nullable
              as String,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      firmware: firmware == freezed
          ? _value.firmware
          : firmware // ignore: cast_nullable_to_non_nullable
              as LxdFirmware,
      chassis: chassis == freezed
          ? _value.chassis
          : chassis // ignore: cast_nullable_to_non_nullable
              as LxdChassis,
      motherboard: motherboard == freezed
          ? _value.motherboard
          : motherboard // ignore: cast_nullable_to_non_nullable
              as LxdMotherboard,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_LxdSystemResources implements _LxdSystemResources {
  const _$_LxdSystemResources(
      {required this.uuid,
      required this.vendor,
      required this.product,
      required this.family,
      required this.version,
      required this.sku,
      required this.serial,
      required this.type,
      required this.firmware,
      required this.chassis,
      required this.motherboard});

  factory _$_LxdSystemResources.fromJson(Map<String, dynamic> json) =>
      _$$_LxdSystemResourcesFromJson(json);

  @override
  final String uuid;
  @override
  final String vendor;
  @override
  final String product;
  @override
  final String family;
  @override
  final String version;
  @override
  final String sku;
  @override
  final String serial;
  @override
  final String type;
  @override
  final LxdFirmware firmware;
  @override
  final LxdChassis chassis;
  @override
  final LxdMotherboard motherboard;

  @override
  String toString() {
    return 'LxdSystemResources(uuid: $uuid, vendor: $vendor, product: $product, family: $family, version: $version, sku: $sku, serial: $serial, type: $type, firmware: $firmware, chassis: $chassis, motherboard: $motherboard)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LxdSystemResources &&
            const DeepCollectionEquality().equals(other.uuid, uuid) &&
            const DeepCollectionEquality().equals(other.vendor, vendor) &&
            const DeepCollectionEquality().equals(other.product, product) &&
            const DeepCollectionEquality().equals(other.family, family) &&
            const DeepCollectionEquality().equals(other.version, version) &&
            const DeepCollectionEquality().equals(other.sku, sku) &&
            const DeepCollectionEquality().equals(other.serial, serial) &&
            const DeepCollectionEquality().equals(other.type, type) &&
            const DeepCollectionEquality().equals(other.firmware, firmware) &&
            const DeepCollectionEquality().equals(other.chassis, chassis) &&
            const DeepCollectionEquality()
                .equals(other.motherboard, motherboard));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(uuid),
      const DeepCollectionEquality().hash(vendor),
      const DeepCollectionEquality().hash(product),
      const DeepCollectionEquality().hash(family),
      const DeepCollectionEquality().hash(version),
      const DeepCollectionEquality().hash(sku),
      const DeepCollectionEquality().hash(serial),
      const DeepCollectionEquality().hash(type),
      const DeepCollectionEquality().hash(firmware),
      const DeepCollectionEquality().hash(chassis),
      const DeepCollectionEquality().hash(motherboard));

  @JsonKey(ignore: true)
  @override
  _$$_LxdSystemResourcesCopyWith<_$_LxdSystemResources> get copyWith =>
      __$$_LxdSystemResourcesCopyWithImpl<_$_LxdSystemResources>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_LxdSystemResourcesToJson(this);
  }
}

abstract class _LxdSystemResources implements LxdSystemResources {
  const factory _LxdSystemResources(
      {required final String uuid,
      required final String vendor,
      required final String product,
      required final String family,
      required final String version,
      required final String sku,
      required final String serial,
      required final String type,
      required final LxdFirmware firmware,
      required final LxdChassis chassis,
      required final LxdMotherboard motherboard}) = _$_LxdSystemResources;

  factory _LxdSystemResources.fromJson(Map<String, dynamic> json) =
      _$_LxdSystemResources.fromJson;

  @override
  String get uuid => throw _privateConstructorUsedError;
  @override
  String get vendor => throw _privateConstructorUsedError;
  @override
  String get product => throw _privateConstructorUsedError;
  @override
  String get family => throw _privateConstructorUsedError;
  @override
  String get version => throw _privateConstructorUsedError;
  @override
  String get sku => throw _privateConstructorUsedError;
  @override
  String get serial => throw _privateConstructorUsedError;
  @override
  String get type => throw _privateConstructorUsedError;
  @override
  LxdFirmware get firmware => throw _privateConstructorUsedError;
  @override
  LxdChassis get chassis => throw _privateConstructorUsedError;
  @override
  LxdMotherboard get motherboard => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_LxdSystemResourcesCopyWith<_$_LxdSystemResources> get copyWith =>
      throw _privateConstructorUsedError;
}

LxdResources _$LxdResourcesFromJson(Map<String, dynamic> json) {
  return _LxdResources.fromJson(json);
}

/// @nodoc
mixin _$LxdResources {
  LxdCpuResources get cpu => throw _privateConstructorUsedError;
  LxdMemoryResources get memory => throw _privateConstructorUsedError;
  LxdGpuResources get gpu => throw _privateConstructorUsedError;
  LXdNetworkResources get network => throw _privateConstructorUsedError;
  LxdStorageResources get storage => throw _privateConstructorUsedError;
  LxdUsbResources get usb => throw _privateConstructorUsedError;
  LxdPciResources get pci => throw _privateConstructorUsedError;
  LxdSystemResources get system => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LxdResourcesCopyWith<LxdResources> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LxdResourcesCopyWith<$Res> {
  factory $LxdResourcesCopyWith(
          LxdResources value, $Res Function(LxdResources) then) =
      _$LxdResourcesCopyWithImpl<$Res>;
  $Res call(
      {LxdCpuResources cpu,
      LxdMemoryResources memory,
      LxdGpuResources gpu,
      LXdNetworkResources network,
      LxdStorageResources storage,
      LxdUsbResources usb,
      LxdPciResources pci,
      LxdSystemResources system});

  $LxdCpuResourcesCopyWith<$Res> get cpu;
  $LxdMemoryResourcesCopyWith<$Res> get memory;
  $LxdGpuResourcesCopyWith<$Res> get gpu;
  $LXdNetworkResourcesCopyWith<$Res> get network;
  $LxdStorageResourcesCopyWith<$Res> get storage;
  $LxdUsbResourcesCopyWith<$Res> get usb;
  $LxdPciResourcesCopyWith<$Res> get pci;
  $LxdSystemResourcesCopyWith<$Res> get system;
}

/// @nodoc
class _$LxdResourcesCopyWithImpl<$Res> implements $LxdResourcesCopyWith<$Res> {
  _$LxdResourcesCopyWithImpl(this._value, this._then);

  final LxdResources _value;
  // ignore: unused_field
  final $Res Function(LxdResources) _then;

  @override
  $Res call({
    Object? cpu = freezed,
    Object? memory = freezed,
    Object? gpu = freezed,
    Object? network = freezed,
    Object? storage = freezed,
    Object? usb = freezed,
    Object? pci = freezed,
    Object? system = freezed,
  }) {
    return _then(_value.copyWith(
      cpu: cpu == freezed
          ? _value.cpu
          : cpu // ignore: cast_nullable_to_non_nullable
              as LxdCpuResources,
      memory: memory == freezed
          ? _value.memory
          : memory // ignore: cast_nullable_to_non_nullable
              as LxdMemoryResources,
      gpu: gpu == freezed
          ? _value.gpu
          : gpu // ignore: cast_nullable_to_non_nullable
              as LxdGpuResources,
      network: network == freezed
          ? _value.network
          : network // ignore: cast_nullable_to_non_nullable
              as LXdNetworkResources,
      storage: storage == freezed
          ? _value.storage
          : storage // ignore: cast_nullable_to_non_nullable
              as LxdStorageResources,
      usb: usb == freezed
          ? _value.usb
          : usb // ignore: cast_nullable_to_non_nullable
              as LxdUsbResources,
      pci: pci == freezed
          ? _value.pci
          : pci // ignore: cast_nullable_to_non_nullable
              as LxdPciResources,
      system: system == freezed
          ? _value.system
          : system // ignore: cast_nullable_to_non_nullable
              as LxdSystemResources,
    ));
  }

  @override
  $LxdCpuResourcesCopyWith<$Res> get cpu {
    return $LxdCpuResourcesCopyWith<$Res>(_value.cpu, (value) {
      return _then(_value.copyWith(cpu: value));
    });
  }

  @override
  $LxdMemoryResourcesCopyWith<$Res> get memory {
    return $LxdMemoryResourcesCopyWith<$Res>(_value.memory, (value) {
      return _then(_value.copyWith(memory: value));
    });
  }

  @override
  $LxdGpuResourcesCopyWith<$Res> get gpu {
    return $LxdGpuResourcesCopyWith<$Res>(_value.gpu, (value) {
      return _then(_value.copyWith(gpu: value));
    });
  }

  @override
  $LXdNetworkResourcesCopyWith<$Res> get network {
    return $LXdNetworkResourcesCopyWith<$Res>(_value.network, (value) {
      return _then(_value.copyWith(network: value));
    });
  }

  @override
  $LxdStorageResourcesCopyWith<$Res> get storage {
    return $LxdStorageResourcesCopyWith<$Res>(_value.storage, (value) {
      return _then(_value.copyWith(storage: value));
    });
  }

  @override
  $LxdUsbResourcesCopyWith<$Res> get usb {
    return $LxdUsbResourcesCopyWith<$Res>(_value.usb, (value) {
      return _then(_value.copyWith(usb: value));
    });
  }

  @override
  $LxdPciResourcesCopyWith<$Res> get pci {
    return $LxdPciResourcesCopyWith<$Res>(_value.pci, (value) {
      return _then(_value.copyWith(pci: value));
    });
  }

  @override
  $LxdSystemResourcesCopyWith<$Res> get system {
    return $LxdSystemResourcesCopyWith<$Res>(_value.system, (value) {
      return _then(_value.copyWith(system: value));
    });
  }
}

/// @nodoc
abstract class _$$_LxdResourcesCopyWith<$Res>
    implements $LxdResourcesCopyWith<$Res> {
  factory _$$_LxdResourcesCopyWith(
          _$_LxdResources value, $Res Function(_$_LxdResources) then) =
      __$$_LxdResourcesCopyWithImpl<$Res>;
  @override
  $Res call(
      {LxdCpuResources cpu,
      LxdMemoryResources memory,
      LxdGpuResources gpu,
      LXdNetworkResources network,
      LxdStorageResources storage,
      LxdUsbResources usb,
      LxdPciResources pci,
      LxdSystemResources system});

  @override
  $LxdCpuResourcesCopyWith<$Res> get cpu;
  @override
  $LxdMemoryResourcesCopyWith<$Res> get memory;
  @override
  $LxdGpuResourcesCopyWith<$Res> get gpu;
  @override
  $LXdNetworkResourcesCopyWith<$Res> get network;
  @override
  $LxdStorageResourcesCopyWith<$Res> get storage;
  @override
  $LxdUsbResourcesCopyWith<$Res> get usb;
  @override
  $LxdPciResourcesCopyWith<$Res> get pci;
  @override
  $LxdSystemResourcesCopyWith<$Res> get system;
}

/// @nodoc
class __$$_LxdResourcesCopyWithImpl<$Res>
    extends _$LxdResourcesCopyWithImpl<$Res>
    implements _$$_LxdResourcesCopyWith<$Res> {
  __$$_LxdResourcesCopyWithImpl(
      _$_LxdResources _value, $Res Function(_$_LxdResources) _then)
      : super(_value, (v) => _then(v as _$_LxdResources));

  @override
  _$_LxdResources get _value => super._value as _$_LxdResources;

  @override
  $Res call({
    Object? cpu = freezed,
    Object? memory = freezed,
    Object? gpu = freezed,
    Object? network = freezed,
    Object? storage = freezed,
    Object? usb = freezed,
    Object? pci = freezed,
    Object? system = freezed,
  }) {
    return _then(_$_LxdResources(
      cpu: cpu == freezed
          ? _value.cpu
          : cpu // ignore: cast_nullable_to_non_nullable
              as LxdCpuResources,
      memory: memory == freezed
          ? _value.memory
          : memory // ignore: cast_nullable_to_non_nullable
              as LxdMemoryResources,
      gpu: gpu == freezed
          ? _value.gpu
          : gpu // ignore: cast_nullable_to_non_nullable
              as LxdGpuResources,
      network: network == freezed
          ? _value.network
          : network // ignore: cast_nullable_to_non_nullable
              as LXdNetworkResources,
      storage: storage == freezed
          ? _value.storage
          : storage // ignore: cast_nullable_to_non_nullable
              as LxdStorageResources,
      usb: usb == freezed
          ? _value.usb
          : usb // ignore: cast_nullable_to_non_nullable
              as LxdUsbResources,
      pci: pci == freezed
          ? _value.pci
          : pci // ignore: cast_nullable_to_non_nullable
              as LxdPciResources,
      system: system == freezed
          ? _value.system
          : system // ignore: cast_nullable_to_non_nullable
              as LxdSystemResources,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_LxdResources implements _LxdResources {
  const _$_LxdResources(
      {required this.cpu,
      required this.memory,
      required this.gpu,
      required this.network,
      required this.storage,
      required this.usb,
      required this.pci,
      required this.system});

  factory _$_LxdResources.fromJson(Map<String, dynamic> json) =>
      _$$_LxdResourcesFromJson(json);

  @override
  final LxdCpuResources cpu;
  @override
  final LxdMemoryResources memory;
  @override
  final LxdGpuResources gpu;
  @override
  final LXdNetworkResources network;
  @override
  final LxdStorageResources storage;
  @override
  final LxdUsbResources usb;
  @override
  final LxdPciResources pci;
  @override
  final LxdSystemResources system;

  @override
  String toString() {
    return 'LxdResources(cpu: $cpu, memory: $memory, gpu: $gpu, network: $network, storage: $storage, usb: $usb, pci: $pci, system: $system)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LxdResources &&
            const DeepCollectionEquality().equals(other.cpu, cpu) &&
            const DeepCollectionEquality().equals(other.memory, memory) &&
            const DeepCollectionEquality().equals(other.gpu, gpu) &&
            const DeepCollectionEquality().equals(other.network, network) &&
            const DeepCollectionEquality().equals(other.storage, storage) &&
            const DeepCollectionEquality().equals(other.usb, usb) &&
            const DeepCollectionEquality().equals(other.pci, pci) &&
            const DeepCollectionEquality().equals(other.system, system));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(cpu),
      const DeepCollectionEquality().hash(memory),
      const DeepCollectionEquality().hash(gpu),
      const DeepCollectionEquality().hash(network),
      const DeepCollectionEquality().hash(storage),
      const DeepCollectionEquality().hash(usb),
      const DeepCollectionEquality().hash(pci),
      const DeepCollectionEquality().hash(system));

  @JsonKey(ignore: true)
  @override
  _$$_LxdResourcesCopyWith<_$_LxdResources> get copyWith =>
      __$$_LxdResourcesCopyWithImpl<_$_LxdResources>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_LxdResourcesToJson(this);
  }
}

abstract class _LxdResources implements LxdResources {
  const factory _LxdResources(
      {required final LxdCpuResources cpu,
      required final LxdMemoryResources memory,
      required final LxdGpuResources gpu,
      required final LXdNetworkResources network,
      required final LxdStorageResources storage,
      required final LxdUsbResources usb,
      required final LxdPciResources pci,
      required final LxdSystemResources system}) = _$_LxdResources;

  factory _LxdResources.fromJson(Map<String, dynamic> json) =
      _$_LxdResources.fromJson;

  @override
  LxdCpuResources get cpu => throw _privateConstructorUsedError;
  @override
  LxdMemoryResources get memory => throw _privateConstructorUsedError;
  @override
  LxdGpuResources get gpu => throw _privateConstructorUsedError;
  @override
  LXdNetworkResources get network => throw _privateConstructorUsedError;
  @override
  LxdStorageResources get storage => throw _privateConstructorUsedError;
  @override
  LxdUsbResources get usb => throw _privateConstructorUsedError;
  @override
  LxdPciResources get pci => throw _privateConstructorUsedError;
  @override
  LxdSystemResources get system => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_LxdResourcesCopyWith<_$_LxdResources> get copyWith =>
      throw _privateConstructorUsedError;
}
