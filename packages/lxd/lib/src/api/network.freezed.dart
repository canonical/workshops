// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'network.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

LxdNetwork _$LxdNetworkFromJson(Map<String, dynamic> json) {
  return _LxdNetwork.fromJson(json);
}

/// @nodoc
mixin _$LxdNetwork {
  Map<String, String> get config => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  bool get managed => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LxdNetworkCopyWith<LxdNetwork> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LxdNetworkCopyWith<$Res> {
  factory $LxdNetworkCopyWith(
          LxdNetwork value, $Res Function(LxdNetwork) then) =
      _$LxdNetworkCopyWithImpl<$Res>;
  $Res call(
      {Map<String, String> config,
      String description,
      bool managed,
      String name,
      String status,
      String type});
}

/// @nodoc
class _$LxdNetworkCopyWithImpl<$Res> implements $LxdNetworkCopyWith<$Res> {
  _$LxdNetworkCopyWithImpl(this._value, this._then);

  final LxdNetwork _value;
  // ignore: unused_field
  final $Res Function(LxdNetwork) _then;

  @override
  $Res call({
    Object? config = freezed,
    Object? description = freezed,
    Object? managed = freezed,
    Object? name = freezed,
    Object? status = freezed,
    Object? type = freezed,
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
      managed: managed == freezed
          ? _value.managed
          : managed // ignore: cast_nullable_to_non_nullable
              as bool,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_LxdNetworkCopyWith<$Res>
    implements $LxdNetworkCopyWith<$Res> {
  factory _$$_LxdNetworkCopyWith(
          _$_LxdNetwork value, $Res Function(_$_LxdNetwork) then) =
      __$$_LxdNetworkCopyWithImpl<$Res>;
  @override
  $Res call(
      {Map<String, String> config,
      String description,
      bool managed,
      String name,
      String status,
      String type});
}

/// @nodoc
class __$$_LxdNetworkCopyWithImpl<$Res> extends _$LxdNetworkCopyWithImpl<$Res>
    implements _$$_LxdNetworkCopyWith<$Res> {
  __$$_LxdNetworkCopyWithImpl(
      _$_LxdNetwork _value, $Res Function(_$_LxdNetwork) _then)
      : super(_value, (v) => _then(v as _$_LxdNetwork));

  @override
  _$_LxdNetwork get _value => super._value as _$_LxdNetwork;

  @override
  $Res call({
    Object? config = freezed,
    Object? description = freezed,
    Object? managed = freezed,
    Object? name = freezed,
    Object? status = freezed,
    Object? type = freezed,
  }) {
    return _then(_$_LxdNetwork(
      config: config == freezed
          ? _value._config
          : config // ignore: cast_nullable_to_non_nullable
              as Map<String, String>,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      managed: managed == freezed
          ? _value.managed
          : managed // ignore: cast_nullable_to_non_nullable
              as bool,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_LxdNetwork implements _LxdNetwork {
  const _$_LxdNetwork(
      {required final Map<String, String> config,
      required this.description,
      required this.managed,
      required this.name,
      required this.status,
      required this.type})
      : _config = config;

  factory _$_LxdNetwork.fromJson(Map<String, dynamic> json) =>
      _$$_LxdNetworkFromJson(json);

  final Map<String, String> _config;
  @override
  Map<String, String> get config {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_config);
  }

  @override
  final String description;
  @override
  final bool managed;
  @override
  final String name;
  @override
  final String status;
  @override
  final String type;

  @override
  String toString() {
    return 'LxdNetwork(config: $config, description: $description, managed: $managed, name: $name, status: $status, type: $type)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LxdNetwork &&
            const DeepCollectionEquality().equals(other._config, _config) &&
            const DeepCollectionEquality()
                .equals(other.description, description) &&
            const DeepCollectionEquality().equals(other.managed, managed) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.status, status) &&
            const DeepCollectionEquality().equals(other.type, type));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_config),
      const DeepCollectionEquality().hash(description),
      const DeepCollectionEquality().hash(managed),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(status),
      const DeepCollectionEquality().hash(type));

  @JsonKey(ignore: true)
  @override
  _$$_LxdNetworkCopyWith<_$_LxdNetwork> get copyWith =>
      __$$_LxdNetworkCopyWithImpl<_$_LxdNetwork>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_LxdNetworkToJson(this);
  }
}

abstract class _LxdNetwork implements LxdNetwork {
  const factory _LxdNetwork(
      {required final Map<String, String> config,
      required final String description,
      required final bool managed,
      required final String name,
      required final String status,
      required final String type}) = _$_LxdNetwork;

  factory _LxdNetwork.fromJson(Map<String, dynamic> json) =
      _$_LxdNetwork.fromJson;

  @override
  Map<String, String> get config => throw _privateConstructorUsedError;
  @override
  String get description => throw _privateConstructorUsedError;
  @override
  bool get managed => throw _privateConstructorUsedError;
  @override
  String get name => throw _privateConstructorUsedError;
  @override
  String get status => throw _privateConstructorUsedError;
  @override
  String get type => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_LxdNetworkCopyWith<_$_LxdNetwork> get copyWith =>
      throw _privateConstructorUsedError;
}

LxdNetworkLease _$LxdNetworkLeaseFromJson(Map<String, dynamic> json) {
  return _LxdNetworkLease.fromJson(json);
}

/// @nodoc
mixin _$LxdNetworkLease {
  String get address => throw _privateConstructorUsedError;
  String get hostname => throw _privateConstructorUsedError;
  String get hwaddr => throw _privateConstructorUsedError;
  String get location => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LxdNetworkLeaseCopyWith<LxdNetworkLease> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LxdNetworkLeaseCopyWith<$Res> {
  factory $LxdNetworkLeaseCopyWith(
          LxdNetworkLease value, $Res Function(LxdNetworkLease) then) =
      _$LxdNetworkLeaseCopyWithImpl<$Res>;
  $Res call(
      {String address,
      String hostname,
      String hwaddr,
      String location,
      String type});
}

/// @nodoc
class _$LxdNetworkLeaseCopyWithImpl<$Res>
    implements $LxdNetworkLeaseCopyWith<$Res> {
  _$LxdNetworkLeaseCopyWithImpl(this._value, this._then);

  final LxdNetworkLease _value;
  // ignore: unused_field
  final $Res Function(LxdNetworkLease) _then;

  @override
  $Res call({
    Object? address = freezed,
    Object? hostname = freezed,
    Object? hwaddr = freezed,
    Object? location = freezed,
    Object? type = freezed,
  }) {
    return _then(_value.copyWith(
      address: address == freezed
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      hostname: hostname == freezed
          ? _value.hostname
          : hostname // ignore: cast_nullable_to_non_nullable
              as String,
      hwaddr: hwaddr == freezed
          ? _value.hwaddr
          : hwaddr // ignore: cast_nullable_to_non_nullable
              as String,
      location: location == freezed
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_LxdNetworkLeaseCopyWith<$Res>
    implements $LxdNetworkLeaseCopyWith<$Res> {
  factory _$$_LxdNetworkLeaseCopyWith(
          _$_LxdNetworkLease value, $Res Function(_$_LxdNetworkLease) then) =
      __$$_LxdNetworkLeaseCopyWithImpl<$Res>;
  @override
  $Res call(
      {String address,
      String hostname,
      String hwaddr,
      String location,
      String type});
}

/// @nodoc
class __$$_LxdNetworkLeaseCopyWithImpl<$Res>
    extends _$LxdNetworkLeaseCopyWithImpl<$Res>
    implements _$$_LxdNetworkLeaseCopyWith<$Res> {
  __$$_LxdNetworkLeaseCopyWithImpl(
      _$_LxdNetworkLease _value, $Res Function(_$_LxdNetworkLease) _then)
      : super(_value, (v) => _then(v as _$_LxdNetworkLease));

  @override
  _$_LxdNetworkLease get _value => super._value as _$_LxdNetworkLease;

  @override
  $Res call({
    Object? address = freezed,
    Object? hostname = freezed,
    Object? hwaddr = freezed,
    Object? location = freezed,
    Object? type = freezed,
  }) {
    return _then(_$_LxdNetworkLease(
      address: address == freezed
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      hostname: hostname == freezed
          ? _value.hostname
          : hostname // ignore: cast_nullable_to_non_nullable
              as String,
      hwaddr: hwaddr == freezed
          ? _value.hwaddr
          : hwaddr // ignore: cast_nullable_to_non_nullable
              as String,
      location: location == freezed
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_LxdNetworkLease implements _LxdNetworkLease {
  const _$_LxdNetworkLease(
      {required this.address,
      required this.hostname,
      required this.hwaddr,
      required this.location,
      required this.type});

  factory _$_LxdNetworkLease.fromJson(Map<String, dynamic> json) =>
      _$$_LxdNetworkLeaseFromJson(json);

  @override
  final String address;
  @override
  final String hostname;
  @override
  final String hwaddr;
  @override
  final String location;
  @override
  final String type;

  @override
  String toString() {
    return 'LxdNetworkLease(address: $address, hostname: $hostname, hwaddr: $hwaddr, location: $location, type: $type)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LxdNetworkLease &&
            const DeepCollectionEquality().equals(other.address, address) &&
            const DeepCollectionEquality().equals(other.hostname, hostname) &&
            const DeepCollectionEquality().equals(other.hwaddr, hwaddr) &&
            const DeepCollectionEquality().equals(other.location, location) &&
            const DeepCollectionEquality().equals(other.type, type));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(address),
      const DeepCollectionEquality().hash(hostname),
      const DeepCollectionEquality().hash(hwaddr),
      const DeepCollectionEquality().hash(location),
      const DeepCollectionEquality().hash(type));

  @JsonKey(ignore: true)
  @override
  _$$_LxdNetworkLeaseCopyWith<_$_LxdNetworkLease> get copyWith =>
      __$$_LxdNetworkLeaseCopyWithImpl<_$_LxdNetworkLease>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_LxdNetworkLeaseToJson(this);
  }
}

abstract class _LxdNetworkLease implements LxdNetworkLease {
  const factory _LxdNetworkLease(
      {required final String address,
      required final String hostname,
      required final String hwaddr,
      required final String location,
      required final String type}) = _$_LxdNetworkLease;

  factory _LxdNetworkLease.fromJson(Map<String, dynamic> json) =
      _$_LxdNetworkLease.fromJson;

  @override
  String get address => throw _privateConstructorUsedError;
  @override
  String get hostname => throw _privateConstructorUsedError;
  @override
  String get hwaddr => throw _privateConstructorUsedError;
  @override
  String get location => throw _privateConstructorUsedError;
  @override
  String get type => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_LxdNetworkLeaseCopyWith<_$_LxdNetworkLease> get copyWith =>
      throw _privateConstructorUsedError;
}

LxdNetworkState _$LxdNetworkStateFromJson(Map<String, dynamic> json) {
  return _LxdNetworkState.fromJson(json);
}

/// @nodoc
mixin _$LxdNetworkState {
  List<LxdNetworkAddress> get addresses => throw _privateConstructorUsedError;
  LxdNetworkCounters get counters => throw _privateConstructorUsedError;
  String get hwaddr => throw _privateConstructorUsedError;
  int get mtu => throw _privateConstructorUsedError;
  String get state => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LxdNetworkStateCopyWith<LxdNetworkState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LxdNetworkStateCopyWith<$Res> {
  factory $LxdNetworkStateCopyWith(
          LxdNetworkState value, $Res Function(LxdNetworkState) then) =
      _$LxdNetworkStateCopyWithImpl<$Res>;
  $Res call(
      {List<LxdNetworkAddress> addresses,
      LxdNetworkCounters counters,
      String hwaddr,
      int mtu,
      String state,
      String type});

  $LxdNetworkCountersCopyWith<$Res> get counters;
}

/// @nodoc
class _$LxdNetworkStateCopyWithImpl<$Res>
    implements $LxdNetworkStateCopyWith<$Res> {
  _$LxdNetworkStateCopyWithImpl(this._value, this._then);

  final LxdNetworkState _value;
  // ignore: unused_field
  final $Res Function(LxdNetworkState) _then;

  @override
  $Res call({
    Object? addresses = freezed,
    Object? counters = freezed,
    Object? hwaddr = freezed,
    Object? mtu = freezed,
    Object? state = freezed,
    Object? type = freezed,
  }) {
    return _then(_value.copyWith(
      addresses: addresses == freezed
          ? _value.addresses
          : addresses // ignore: cast_nullable_to_non_nullable
              as List<LxdNetworkAddress>,
      counters: counters == freezed
          ? _value.counters
          : counters // ignore: cast_nullable_to_non_nullable
              as LxdNetworkCounters,
      hwaddr: hwaddr == freezed
          ? _value.hwaddr
          : hwaddr // ignore: cast_nullable_to_non_nullable
              as String,
      mtu: mtu == freezed
          ? _value.mtu
          : mtu // ignore: cast_nullable_to_non_nullable
              as int,
      state: state == freezed
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as String,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }

  @override
  $LxdNetworkCountersCopyWith<$Res> get counters {
    return $LxdNetworkCountersCopyWith<$Res>(_value.counters, (value) {
      return _then(_value.copyWith(counters: value));
    });
  }
}

/// @nodoc
abstract class _$$_LxdNetworkStateCopyWith<$Res>
    implements $LxdNetworkStateCopyWith<$Res> {
  factory _$$_LxdNetworkStateCopyWith(
          _$_LxdNetworkState value, $Res Function(_$_LxdNetworkState) then) =
      __$$_LxdNetworkStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {List<LxdNetworkAddress> addresses,
      LxdNetworkCounters counters,
      String hwaddr,
      int mtu,
      String state,
      String type});

  @override
  $LxdNetworkCountersCopyWith<$Res> get counters;
}

/// @nodoc
class __$$_LxdNetworkStateCopyWithImpl<$Res>
    extends _$LxdNetworkStateCopyWithImpl<$Res>
    implements _$$_LxdNetworkStateCopyWith<$Res> {
  __$$_LxdNetworkStateCopyWithImpl(
      _$_LxdNetworkState _value, $Res Function(_$_LxdNetworkState) _then)
      : super(_value, (v) => _then(v as _$_LxdNetworkState));

  @override
  _$_LxdNetworkState get _value => super._value as _$_LxdNetworkState;

  @override
  $Res call({
    Object? addresses = freezed,
    Object? counters = freezed,
    Object? hwaddr = freezed,
    Object? mtu = freezed,
    Object? state = freezed,
    Object? type = freezed,
  }) {
    return _then(_$_LxdNetworkState(
      addresses: addresses == freezed
          ? _value._addresses
          : addresses // ignore: cast_nullable_to_non_nullable
              as List<LxdNetworkAddress>,
      counters: counters == freezed
          ? _value.counters
          : counters // ignore: cast_nullable_to_non_nullable
              as LxdNetworkCounters,
      hwaddr: hwaddr == freezed
          ? _value.hwaddr
          : hwaddr // ignore: cast_nullable_to_non_nullable
              as String,
      mtu: mtu == freezed
          ? _value.mtu
          : mtu // ignore: cast_nullable_to_non_nullable
              as int,
      state: state == freezed
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as String,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_LxdNetworkState implements _LxdNetworkState {
  const _$_LxdNetworkState(
      {required final List<LxdNetworkAddress> addresses,
      required this.counters,
      required this.hwaddr,
      required this.mtu,
      required this.state,
      required this.type})
      : _addresses = addresses;

  factory _$_LxdNetworkState.fromJson(Map<String, dynamic> json) =>
      _$$_LxdNetworkStateFromJson(json);

  final List<LxdNetworkAddress> _addresses;
  @override
  List<LxdNetworkAddress> get addresses {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_addresses);
  }

  @override
  final LxdNetworkCounters counters;
  @override
  final String hwaddr;
  @override
  final int mtu;
  @override
  final String state;
  @override
  final String type;

  @override
  String toString() {
    return 'LxdNetworkState(addresses: $addresses, counters: $counters, hwaddr: $hwaddr, mtu: $mtu, state: $state, type: $type)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LxdNetworkState &&
            const DeepCollectionEquality()
                .equals(other._addresses, _addresses) &&
            const DeepCollectionEquality().equals(other.counters, counters) &&
            const DeepCollectionEquality().equals(other.hwaddr, hwaddr) &&
            const DeepCollectionEquality().equals(other.mtu, mtu) &&
            const DeepCollectionEquality().equals(other.state, state) &&
            const DeepCollectionEquality().equals(other.type, type));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_addresses),
      const DeepCollectionEquality().hash(counters),
      const DeepCollectionEquality().hash(hwaddr),
      const DeepCollectionEquality().hash(mtu),
      const DeepCollectionEquality().hash(state),
      const DeepCollectionEquality().hash(type));

  @JsonKey(ignore: true)
  @override
  _$$_LxdNetworkStateCopyWith<_$_LxdNetworkState> get copyWith =>
      __$$_LxdNetworkStateCopyWithImpl<_$_LxdNetworkState>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_LxdNetworkStateToJson(this);
  }
}

abstract class _LxdNetworkState implements LxdNetworkState {
  const factory _LxdNetworkState(
      {required final List<LxdNetworkAddress> addresses,
      required final LxdNetworkCounters counters,
      required final String hwaddr,
      required final int mtu,
      required final String state,
      required final String type}) = _$_LxdNetworkState;

  factory _LxdNetworkState.fromJson(Map<String, dynamic> json) =
      _$_LxdNetworkState.fromJson;

  @override
  List<LxdNetworkAddress> get addresses => throw _privateConstructorUsedError;
  @override
  LxdNetworkCounters get counters => throw _privateConstructorUsedError;
  @override
  String get hwaddr => throw _privateConstructorUsedError;
  @override
  int get mtu => throw _privateConstructorUsedError;
  @override
  String get state => throw _privateConstructorUsedError;
  @override
  String get type => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_LxdNetworkStateCopyWith<_$_LxdNetworkState> get copyWith =>
      throw _privateConstructorUsedError;
}

LxdNetworkAddress _$LxdNetworkAddressFromJson(Map<String, dynamic> json) {
  return _LxdNetworkAddress.fromJson(json);
}

/// @nodoc
mixin _$LxdNetworkAddress {
  String get address => throw _privateConstructorUsedError;
  String get family => throw _privateConstructorUsedError;
  String get netmask => throw _privateConstructorUsedError;
  String get scope => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LxdNetworkAddressCopyWith<LxdNetworkAddress> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LxdNetworkAddressCopyWith<$Res> {
  factory $LxdNetworkAddressCopyWith(
          LxdNetworkAddress value, $Res Function(LxdNetworkAddress) then) =
      _$LxdNetworkAddressCopyWithImpl<$Res>;
  $Res call({String address, String family, String netmask, String scope});
}

/// @nodoc
class _$LxdNetworkAddressCopyWithImpl<$Res>
    implements $LxdNetworkAddressCopyWith<$Res> {
  _$LxdNetworkAddressCopyWithImpl(this._value, this._then);

  final LxdNetworkAddress _value;
  // ignore: unused_field
  final $Res Function(LxdNetworkAddress) _then;

  @override
  $Res call({
    Object? address = freezed,
    Object? family = freezed,
    Object? netmask = freezed,
    Object? scope = freezed,
  }) {
    return _then(_value.copyWith(
      address: address == freezed
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      family: family == freezed
          ? _value.family
          : family // ignore: cast_nullable_to_non_nullable
              as String,
      netmask: netmask == freezed
          ? _value.netmask
          : netmask // ignore: cast_nullable_to_non_nullable
              as String,
      scope: scope == freezed
          ? _value.scope
          : scope // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_LxdNetworkAddressCopyWith<$Res>
    implements $LxdNetworkAddressCopyWith<$Res> {
  factory _$$_LxdNetworkAddressCopyWith(_$_LxdNetworkAddress value,
          $Res Function(_$_LxdNetworkAddress) then) =
      __$$_LxdNetworkAddressCopyWithImpl<$Res>;
  @override
  $Res call({String address, String family, String netmask, String scope});
}

/// @nodoc
class __$$_LxdNetworkAddressCopyWithImpl<$Res>
    extends _$LxdNetworkAddressCopyWithImpl<$Res>
    implements _$$_LxdNetworkAddressCopyWith<$Res> {
  __$$_LxdNetworkAddressCopyWithImpl(
      _$_LxdNetworkAddress _value, $Res Function(_$_LxdNetworkAddress) _then)
      : super(_value, (v) => _then(v as _$_LxdNetworkAddress));

  @override
  _$_LxdNetworkAddress get _value => super._value as _$_LxdNetworkAddress;

  @override
  $Res call({
    Object? address = freezed,
    Object? family = freezed,
    Object? netmask = freezed,
    Object? scope = freezed,
  }) {
    return _then(_$_LxdNetworkAddress(
      address: address == freezed
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      family: family == freezed
          ? _value.family
          : family // ignore: cast_nullable_to_non_nullable
              as String,
      netmask: netmask == freezed
          ? _value.netmask
          : netmask // ignore: cast_nullable_to_non_nullable
              as String,
      scope: scope == freezed
          ? _value.scope
          : scope // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_LxdNetworkAddress implements _LxdNetworkAddress {
  const _$_LxdNetworkAddress(
      {required this.address,
      required this.family,
      required this.netmask,
      required this.scope});

  factory _$_LxdNetworkAddress.fromJson(Map<String, dynamic> json) =>
      _$$_LxdNetworkAddressFromJson(json);

  @override
  final String address;
  @override
  final String family;
  @override
  final String netmask;
  @override
  final String scope;

  @override
  String toString() {
    return 'LxdNetworkAddress(address: $address, family: $family, netmask: $netmask, scope: $scope)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LxdNetworkAddress &&
            const DeepCollectionEquality().equals(other.address, address) &&
            const DeepCollectionEquality().equals(other.family, family) &&
            const DeepCollectionEquality().equals(other.netmask, netmask) &&
            const DeepCollectionEquality().equals(other.scope, scope));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(address),
      const DeepCollectionEquality().hash(family),
      const DeepCollectionEquality().hash(netmask),
      const DeepCollectionEquality().hash(scope));

  @JsonKey(ignore: true)
  @override
  _$$_LxdNetworkAddressCopyWith<_$_LxdNetworkAddress> get copyWith =>
      __$$_LxdNetworkAddressCopyWithImpl<_$_LxdNetworkAddress>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_LxdNetworkAddressToJson(this);
  }
}

abstract class _LxdNetworkAddress implements LxdNetworkAddress {
  const factory _LxdNetworkAddress(
      {required final String address,
      required final String family,
      required final String netmask,
      required final String scope}) = _$_LxdNetworkAddress;

  factory _LxdNetworkAddress.fromJson(Map<String, dynamic> json) =
      _$_LxdNetworkAddress.fromJson;

  @override
  String get address => throw _privateConstructorUsedError;
  @override
  String get family => throw _privateConstructorUsedError;
  @override
  String get netmask => throw _privateConstructorUsedError;
  @override
  String get scope => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_LxdNetworkAddressCopyWith<_$_LxdNetworkAddress> get copyWith =>
      throw _privateConstructorUsedError;
}

LxdNetworkCounters _$LxdNetworkCountersFromJson(Map<String, dynamic> json) {
  return _LxdNetworkCounters.fromJson(json);
}

/// @nodoc
mixin _$LxdNetworkCounters {
  int get bytesReceived => throw _privateConstructorUsedError;
  int get bytesSent => throw _privateConstructorUsedError;
  int get packetsReceived => throw _privateConstructorUsedError;
  int get packetsSent => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LxdNetworkCountersCopyWith<LxdNetworkCounters> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LxdNetworkCountersCopyWith<$Res> {
  factory $LxdNetworkCountersCopyWith(
          LxdNetworkCounters value, $Res Function(LxdNetworkCounters) then) =
      _$LxdNetworkCountersCopyWithImpl<$Res>;
  $Res call(
      {int bytesReceived, int bytesSent, int packetsReceived, int packetsSent});
}

/// @nodoc
class _$LxdNetworkCountersCopyWithImpl<$Res>
    implements $LxdNetworkCountersCopyWith<$Res> {
  _$LxdNetworkCountersCopyWithImpl(this._value, this._then);

  final LxdNetworkCounters _value;
  // ignore: unused_field
  final $Res Function(LxdNetworkCounters) _then;

  @override
  $Res call({
    Object? bytesReceived = freezed,
    Object? bytesSent = freezed,
    Object? packetsReceived = freezed,
    Object? packetsSent = freezed,
  }) {
    return _then(_value.copyWith(
      bytesReceived: bytesReceived == freezed
          ? _value.bytesReceived
          : bytesReceived // ignore: cast_nullable_to_non_nullable
              as int,
      bytesSent: bytesSent == freezed
          ? _value.bytesSent
          : bytesSent // ignore: cast_nullable_to_non_nullable
              as int,
      packetsReceived: packetsReceived == freezed
          ? _value.packetsReceived
          : packetsReceived // ignore: cast_nullable_to_non_nullable
              as int,
      packetsSent: packetsSent == freezed
          ? _value.packetsSent
          : packetsSent // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$$_LxdNetworkCountersCopyWith<$Res>
    implements $LxdNetworkCountersCopyWith<$Res> {
  factory _$$_LxdNetworkCountersCopyWith(_$_LxdNetworkCounters value,
          $Res Function(_$_LxdNetworkCounters) then) =
      __$$_LxdNetworkCountersCopyWithImpl<$Res>;
  @override
  $Res call(
      {int bytesReceived, int bytesSent, int packetsReceived, int packetsSent});
}

/// @nodoc
class __$$_LxdNetworkCountersCopyWithImpl<$Res>
    extends _$LxdNetworkCountersCopyWithImpl<$Res>
    implements _$$_LxdNetworkCountersCopyWith<$Res> {
  __$$_LxdNetworkCountersCopyWithImpl(
      _$_LxdNetworkCounters _value, $Res Function(_$_LxdNetworkCounters) _then)
      : super(_value, (v) => _then(v as _$_LxdNetworkCounters));

  @override
  _$_LxdNetworkCounters get _value => super._value as _$_LxdNetworkCounters;

  @override
  $Res call({
    Object? bytesReceived = freezed,
    Object? bytesSent = freezed,
    Object? packetsReceived = freezed,
    Object? packetsSent = freezed,
  }) {
    return _then(_$_LxdNetworkCounters(
      bytesReceived: bytesReceived == freezed
          ? _value.bytesReceived
          : bytesReceived // ignore: cast_nullable_to_non_nullable
              as int,
      bytesSent: bytesSent == freezed
          ? _value.bytesSent
          : bytesSent // ignore: cast_nullable_to_non_nullable
              as int,
      packetsReceived: packetsReceived == freezed
          ? _value.packetsReceived
          : packetsReceived // ignore: cast_nullable_to_non_nullable
              as int,
      packetsSent: packetsSent == freezed
          ? _value.packetsSent
          : packetsSent // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_LxdNetworkCounters implements _LxdNetworkCounters {
  const _$_LxdNetworkCounters(
      {required this.bytesReceived,
      required this.bytesSent,
      required this.packetsReceived,
      required this.packetsSent});

  factory _$_LxdNetworkCounters.fromJson(Map<String, dynamic> json) =>
      _$$_LxdNetworkCountersFromJson(json);

  @override
  final int bytesReceived;
  @override
  final int bytesSent;
  @override
  final int packetsReceived;
  @override
  final int packetsSent;

  @override
  String toString() {
    return 'LxdNetworkCounters(bytesReceived: $bytesReceived, bytesSent: $bytesSent, packetsReceived: $packetsReceived, packetsSent: $packetsSent)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LxdNetworkCounters &&
            const DeepCollectionEquality()
                .equals(other.bytesReceived, bytesReceived) &&
            const DeepCollectionEquality().equals(other.bytesSent, bytesSent) &&
            const DeepCollectionEquality()
                .equals(other.packetsReceived, packetsReceived) &&
            const DeepCollectionEquality()
                .equals(other.packetsSent, packetsSent));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(bytesReceived),
      const DeepCollectionEquality().hash(bytesSent),
      const DeepCollectionEquality().hash(packetsReceived),
      const DeepCollectionEquality().hash(packetsSent));

  @JsonKey(ignore: true)
  @override
  _$$_LxdNetworkCountersCopyWith<_$_LxdNetworkCounters> get copyWith =>
      __$$_LxdNetworkCountersCopyWithImpl<_$_LxdNetworkCounters>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_LxdNetworkCountersToJson(this);
  }
}

abstract class _LxdNetworkCounters implements LxdNetworkCounters {
  const factory _LxdNetworkCounters(
      {required final int bytesReceived,
      required final int bytesSent,
      required final int packetsReceived,
      required final int packetsSent}) = _$_LxdNetworkCounters;

  factory _LxdNetworkCounters.fromJson(Map<String, dynamic> json) =
      _$_LxdNetworkCounters.fromJson;

  @override
  int get bytesReceived => throw _privateConstructorUsedError;
  @override
  int get bytesSent => throw _privateConstructorUsedError;
  @override
  int get packetsReceived => throw _privateConstructorUsedError;
  @override
  int get packetsSent => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_LxdNetworkCountersCopyWith<_$_LxdNetworkCounters> get copyWith =>
      throw _privateConstructorUsedError;
}
