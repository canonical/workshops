// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'device_config.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

LxdDeviceConfig _$LxdDeviceConfigFromJson(Map<String, dynamic> json) {
  switch (json['type']) {
    case 'none':
      return LxdNoConfig.fromJson(json);
    case 'nic':
      return LxdNicConfig.fromJson(json);
    case 'disk':
      return LxdDiskConfig.fromJson(json);
    case 'unix-char':
      return LxdUnixCharConfig.fromJson(json);
    case 'unix-block':
      return LxdUnixBlockConfig.fromJson(json);
    case 'usb':
      return LxdUsbConfig.fromJson(json);
    case 'gpu':
      return LxdGpuConfig.fromJson(json);
    case 'infiniband':
      return LxdInfinibandConfig.fromJson(json);
    case 'proxy':
      return LxdProxyConfig.fromJson(json);
    case 'unix-hotplug':
      return LxdUnixHotplugConfig.fromJson(json);
    case 'tpm':
      return LxdTpmConfig.fromJson(json);
    case 'pci':
      return LxdPciConfig.fromJson(json);

    default:
      throw CheckedFromJsonException(json, 'type', 'LxdDeviceConfig',
          'Invalid union type "${json['type']}"!');
  }
}

/// @nodoc
mixin _$LxdDeviceConfig {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() none,
    required TResult Function() nic,
    required TResult Function(String source, String path) disk,
    required TResult Function() unixChar,
    required TResult Function() unixBlock,
    required TResult Function() usb,
    required TResult Function() gpu,
    required TResult Function() infiniband,
    required TResult Function() proxy,
    required TResult Function() unixHotplug,
    required TResult Function() tpm,
    required TResult Function() pci,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? none,
    TResult Function()? nic,
    TResult Function(String source, String path)? disk,
    TResult Function()? unixChar,
    TResult Function()? unixBlock,
    TResult Function()? usb,
    TResult Function()? gpu,
    TResult Function()? infiniband,
    TResult Function()? proxy,
    TResult Function()? unixHotplug,
    TResult Function()? tpm,
    TResult Function()? pci,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? none,
    TResult Function()? nic,
    TResult Function(String source, String path)? disk,
    TResult Function()? unixChar,
    TResult Function()? unixBlock,
    TResult Function()? usb,
    TResult Function()? gpu,
    TResult Function()? infiniband,
    TResult Function()? proxy,
    TResult Function()? unixHotplug,
    TResult Function()? tpm,
    TResult Function()? pci,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LxdNoConfig value) none,
    required TResult Function(LxdNicConfig value) nic,
    required TResult Function(LxdDiskConfig value) disk,
    required TResult Function(LxdUnixCharConfig value) unixChar,
    required TResult Function(LxdUnixBlockConfig value) unixBlock,
    required TResult Function(LxdUsbConfig value) usb,
    required TResult Function(LxdGpuConfig value) gpu,
    required TResult Function(LxdInfinibandConfig value) infiniband,
    required TResult Function(LxdProxyConfig value) proxy,
    required TResult Function(LxdUnixHotplugConfig value) unixHotplug,
    required TResult Function(LxdTpmConfig value) tpm,
    required TResult Function(LxdPciConfig value) pci,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(LxdNoConfig value)? none,
    TResult Function(LxdNicConfig value)? nic,
    TResult Function(LxdDiskConfig value)? disk,
    TResult Function(LxdUnixCharConfig value)? unixChar,
    TResult Function(LxdUnixBlockConfig value)? unixBlock,
    TResult Function(LxdUsbConfig value)? usb,
    TResult Function(LxdGpuConfig value)? gpu,
    TResult Function(LxdInfinibandConfig value)? infiniband,
    TResult Function(LxdProxyConfig value)? proxy,
    TResult Function(LxdUnixHotplugConfig value)? unixHotplug,
    TResult Function(LxdTpmConfig value)? tpm,
    TResult Function(LxdPciConfig value)? pci,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LxdNoConfig value)? none,
    TResult Function(LxdNicConfig value)? nic,
    TResult Function(LxdDiskConfig value)? disk,
    TResult Function(LxdUnixCharConfig value)? unixChar,
    TResult Function(LxdUnixBlockConfig value)? unixBlock,
    TResult Function(LxdUsbConfig value)? usb,
    TResult Function(LxdGpuConfig value)? gpu,
    TResult Function(LxdInfinibandConfig value)? infiniband,
    TResult Function(LxdProxyConfig value)? proxy,
    TResult Function(LxdUnixHotplugConfig value)? unixHotplug,
    TResult Function(LxdTpmConfig value)? tpm,
    TResult Function(LxdPciConfig value)? pci,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LxdDeviceConfigCopyWith<$Res> {
  factory $LxdDeviceConfigCopyWith(
          LxdDeviceConfig value, $Res Function(LxdDeviceConfig) then) =
      _$LxdDeviceConfigCopyWithImpl<$Res>;
}

/// @nodoc
class _$LxdDeviceConfigCopyWithImpl<$Res>
    implements $LxdDeviceConfigCopyWith<$Res> {
  _$LxdDeviceConfigCopyWithImpl(this._value, this._then);

  final LxdDeviceConfig _value;
  // ignore: unused_field
  final $Res Function(LxdDeviceConfig) _then;
}

/// @nodoc
abstract class _$$LxdNoConfigCopyWith<$Res> {
  factory _$$LxdNoConfigCopyWith(
          _$LxdNoConfig value, $Res Function(_$LxdNoConfig) then) =
      __$$LxdNoConfigCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LxdNoConfigCopyWithImpl<$Res>
    extends _$LxdDeviceConfigCopyWithImpl<$Res>
    implements _$$LxdNoConfigCopyWith<$Res> {
  __$$LxdNoConfigCopyWithImpl(
      _$LxdNoConfig _value, $Res Function(_$LxdNoConfig) _then)
      : super(_value, (v) => _then(v as _$LxdNoConfig));

  @override
  _$LxdNoConfig get _value => super._value as _$LxdNoConfig;
}

/// @nodoc
@JsonSerializable()
class _$LxdNoConfig implements LxdNoConfig {
  const _$LxdNoConfig({final String? $type}) : $type = $type ?? 'none';

  factory _$LxdNoConfig.fromJson(Map<String, dynamic> json) =>
      _$$LxdNoConfigFromJson(json);

  @JsonKey(name: 'type')
  final String $type;

  @override
  String toString() {
    return 'LxdDeviceConfig.none()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LxdNoConfig);
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() none,
    required TResult Function() nic,
    required TResult Function(String source, String path) disk,
    required TResult Function() unixChar,
    required TResult Function() unixBlock,
    required TResult Function() usb,
    required TResult Function() gpu,
    required TResult Function() infiniband,
    required TResult Function() proxy,
    required TResult Function() unixHotplug,
    required TResult Function() tpm,
    required TResult Function() pci,
  }) {
    return none();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? none,
    TResult Function()? nic,
    TResult Function(String source, String path)? disk,
    TResult Function()? unixChar,
    TResult Function()? unixBlock,
    TResult Function()? usb,
    TResult Function()? gpu,
    TResult Function()? infiniband,
    TResult Function()? proxy,
    TResult Function()? unixHotplug,
    TResult Function()? tpm,
    TResult Function()? pci,
  }) {
    return none?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? none,
    TResult Function()? nic,
    TResult Function(String source, String path)? disk,
    TResult Function()? unixChar,
    TResult Function()? unixBlock,
    TResult Function()? usb,
    TResult Function()? gpu,
    TResult Function()? infiniband,
    TResult Function()? proxy,
    TResult Function()? unixHotplug,
    TResult Function()? tpm,
    TResult Function()? pci,
    required TResult orElse(),
  }) {
    if (none != null) {
      return none();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LxdNoConfig value) none,
    required TResult Function(LxdNicConfig value) nic,
    required TResult Function(LxdDiskConfig value) disk,
    required TResult Function(LxdUnixCharConfig value) unixChar,
    required TResult Function(LxdUnixBlockConfig value) unixBlock,
    required TResult Function(LxdUsbConfig value) usb,
    required TResult Function(LxdGpuConfig value) gpu,
    required TResult Function(LxdInfinibandConfig value) infiniband,
    required TResult Function(LxdProxyConfig value) proxy,
    required TResult Function(LxdUnixHotplugConfig value) unixHotplug,
    required TResult Function(LxdTpmConfig value) tpm,
    required TResult Function(LxdPciConfig value) pci,
  }) {
    return none(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(LxdNoConfig value)? none,
    TResult Function(LxdNicConfig value)? nic,
    TResult Function(LxdDiskConfig value)? disk,
    TResult Function(LxdUnixCharConfig value)? unixChar,
    TResult Function(LxdUnixBlockConfig value)? unixBlock,
    TResult Function(LxdUsbConfig value)? usb,
    TResult Function(LxdGpuConfig value)? gpu,
    TResult Function(LxdInfinibandConfig value)? infiniband,
    TResult Function(LxdProxyConfig value)? proxy,
    TResult Function(LxdUnixHotplugConfig value)? unixHotplug,
    TResult Function(LxdTpmConfig value)? tpm,
    TResult Function(LxdPciConfig value)? pci,
  }) {
    return none?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LxdNoConfig value)? none,
    TResult Function(LxdNicConfig value)? nic,
    TResult Function(LxdDiskConfig value)? disk,
    TResult Function(LxdUnixCharConfig value)? unixChar,
    TResult Function(LxdUnixBlockConfig value)? unixBlock,
    TResult Function(LxdUsbConfig value)? usb,
    TResult Function(LxdGpuConfig value)? gpu,
    TResult Function(LxdInfinibandConfig value)? infiniband,
    TResult Function(LxdProxyConfig value)? proxy,
    TResult Function(LxdUnixHotplugConfig value)? unixHotplug,
    TResult Function(LxdTpmConfig value)? tpm,
    TResult Function(LxdPciConfig value)? pci,
    required TResult orElse(),
  }) {
    if (none != null) {
      return none(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$LxdNoConfigToJson(this);
  }
}

abstract class LxdNoConfig implements LxdDeviceConfig {
  const factory LxdNoConfig() = _$LxdNoConfig;

  factory LxdNoConfig.fromJson(Map<String, dynamic> json) =
      _$LxdNoConfig.fromJson;
}

/// @nodoc
abstract class _$$LxdNicConfigCopyWith<$Res> {
  factory _$$LxdNicConfigCopyWith(
          _$LxdNicConfig value, $Res Function(_$LxdNicConfig) then) =
      __$$LxdNicConfigCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LxdNicConfigCopyWithImpl<$Res>
    extends _$LxdDeviceConfigCopyWithImpl<$Res>
    implements _$$LxdNicConfigCopyWith<$Res> {
  __$$LxdNicConfigCopyWithImpl(
      _$LxdNicConfig _value, $Res Function(_$LxdNicConfig) _then)
      : super(_value, (v) => _then(v as _$LxdNicConfig));

  @override
  _$LxdNicConfig get _value => super._value as _$LxdNicConfig;
}

/// @nodoc
@JsonSerializable()
class _$LxdNicConfig implements LxdNicConfig {
  const _$LxdNicConfig({final String? $type}) : $type = $type ?? 'nic';

  factory _$LxdNicConfig.fromJson(Map<String, dynamic> json) =>
      _$$LxdNicConfigFromJson(json);

  @JsonKey(name: 'type')
  final String $type;

  @override
  String toString() {
    return 'LxdDeviceConfig.nic()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LxdNicConfig);
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() none,
    required TResult Function() nic,
    required TResult Function(String source, String path) disk,
    required TResult Function() unixChar,
    required TResult Function() unixBlock,
    required TResult Function() usb,
    required TResult Function() gpu,
    required TResult Function() infiniband,
    required TResult Function() proxy,
    required TResult Function() unixHotplug,
    required TResult Function() tpm,
    required TResult Function() pci,
  }) {
    return nic();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? none,
    TResult Function()? nic,
    TResult Function(String source, String path)? disk,
    TResult Function()? unixChar,
    TResult Function()? unixBlock,
    TResult Function()? usb,
    TResult Function()? gpu,
    TResult Function()? infiniband,
    TResult Function()? proxy,
    TResult Function()? unixHotplug,
    TResult Function()? tpm,
    TResult Function()? pci,
  }) {
    return nic?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? none,
    TResult Function()? nic,
    TResult Function(String source, String path)? disk,
    TResult Function()? unixChar,
    TResult Function()? unixBlock,
    TResult Function()? usb,
    TResult Function()? gpu,
    TResult Function()? infiniband,
    TResult Function()? proxy,
    TResult Function()? unixHotplug,
    TResult Function()? tpm,
    TResult Function()? pci,
    required TResult orElse(),
  }) {
    if (nic != null) {
      return nic();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LxdNoConfig value) none,
    required TResult Function(LxdNicConfig value) nic,
    required TResult Function(LxdDiskConfig value) disk,
    required TResult Function(LxdUnixCharConfig value) unixChar,
    required TResult Function(LxdUnixBlockConfig value) unixBlock,
    required TResult Function(LxdUsbConfig value) usb,
    required TResult Function(LxdGpuConfig value) gpu,
    required TResult Function(LxdInfinibandConfig value) infiniband,
    required TResult Function(LxdProxyConfig value) proxy,
    required TResult Function(LxdUnixHotplugConfig value) unixHotplug,
    required TResult Function(LxdTpmConfig value) tpm,
    required TResult Function(LxdPciConfig value) pci,
  }) {
    return nic(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(LxdNoConfig value)? none,
    TResult Function(LxdNicConfig value)? nic,
    TResult Function(LxdDiskConfig value)? disk,
    TResult Function(LxdUnixCharConfig value)? unixChar,
    TResult Function(LxdUnixBlockConfig value)? unixBlock,
    TResult Function(LxdUsbConfig value)? usb,
    TResult Function(LxdGpuConfig value)? gpu,
    TResult Function(LxdInfinibandConfig value)? infiniband,
    TResult Function(LxdProxyConfig value)? proxy,
    TResult Function(LxdUnixHotplugConfig value)? unixHotplug,
    TResult Function(LxdTpmConfig value)? tpm,
    TResult Function(LxdPciConfig value)? pci,
  }) {
    return nic?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LxdNoConfig value)? none,
    TResult Function(LxdNicConfig value)? nic,
    TResult Function(LxdDiskConfig value)? disk,
    TResult Function(LxdUnixCharConfig value)? unixChar,
    TResult Function(LxdUnixBlockConfig value)? unixBlock,
    TResult Function(LxdUsbConfig value)? usb,
    TResult Function(LxdGpuConfig value)? gpu,
    TResult Function(LxdInfinibandConfig value)? infiniband,
    TResult Function(LxdProxyConfig value)? proxy,
    TResult Function(LxdUnixHotplugConfig value)? unixHotplug,
    TResult Function(LxdTpmConfig value)? tpm,
    TResult Function(LxdPciConfig value)? pci,
    required TResult orElse(),
  }) {
    if (nic != null) {
      return nic(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$LxdNicConfigToJson(this);
  }
}

abstract class LxdNicConfig implements LxdDeviceConfig {
  const factory LxdNicConfig() = _$LxdNicConfig;

  factory LxdNicConfig.fromJson(Map<String, dynamic> json) =
      _$LxdNicConfig.fromJson;
}

/// @nodoc
abstract class _$$LxdDiskConfigCopyWith<$Res> {
  factory _$$LxdDiskConfigCopyWith(
          _$LxdDiskConfig value, $Res Function(_$LxdDiskConfig) then) =
      __$$LxdDiskConfigCopyWithImpl<$Res>;
  $Res call({String source, String path});
}

/// @nodoc
class __$$LxdDiskConfigCopyWithImpl<$Res>
    extends _$LxdDeviceConfigCopyWithImpl<$Res>
    implements _$$LxdDiskConfigCopyWith<$Res> {
  __$$LxdDiskConfigCopyWithImpl(
      _$LxdDiskConfig _value, $Res Function(_$LxdDiskConfig) _then)
      : super(_value, (v) => _then(v as _$LxdDiskConfig));

  @override
  _$LxdDiskConfig get _value => super._value as _$LxdDiskConfig;

  @override
  $Res call({
    Object? source = freezed,
    Object? path = freezed,
  }) {
    return _then(_$LxdDiskConfig(
      source: source == freezed
          ? _value.source
          : source // ignore: cast_nullable_to_non_nullable
              as String,
      path: path == freezed
          ? _value.path
          : path // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LxdDiskConfig implements LxdDiskConfig {
  const _$LxdDiskConfig(
      {required this.source, required this.path, final String? $type})
      : $type = $type ?? 'disk';

  factory _$LxdDiskConfig.fromJson(Map<String, dynamic> json) =>
      _$$LxdDiskConfigFromJson(json);

  @override
  final String source;
  @override
  final String path;

  @JsonKey(name: 'type')
  final String $type;

  @override
  String toString() {
    return 'LxdDeviceConfig.disk(source: $source, path: $path)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LxdDiskConfig &&
            const DeepCollectionEquality().equals(other.source, source) &&
            const DeepCollectionEquality().equals(other.path, path));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(source),
      const DeepCollectionEquality().hash(path));

  @JsonKey(ignore: true)
  @override
  _$$LxdDiskConfigCopyWith<_$LxdDiskConfig> get copyWith =>
      __$$LxdDiskConfigCopyWithImpl<_$LxdDiskConfig>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() none,
    required TResult Function() nic,
    required TResult Function(String source, String path) disk,
    required TResult Function() unixChar,
    required TResult Function() unixBlock,
    required TResult Function() usb,
    required TResult Function() gpu,
    required TResult Function() infiniband,
    required TResult Function() proxy,
    required TResult Function() unixHotplug,
    required TResult Function() tpm,
    required TResult Function() pci,
  }) {
    return disk(source, path);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? none,
    TResult Function()? nic,
    TResult Function(String source, String path)? disk,
    TResult Function()? unixChar,
    TResult Function()? unixBlock,
    TResult Function()? usb,
    TResult Function()? gpu,
    TResult Function()? infiniband,
    TResult Function()? proxy,
    TResult Function()? unixHotplug,
    TResult Function()? tpm,
    TResult Function()? pci,
  }) {
    return disk?.call(source, path);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? none,
    TResult Function()? nic,
    TResult Function(String source, String path)? disk,
    TResult Function()? unixChar,
    TResult Function()? unixBlock,
    TResult Function()? usb,
    TResult Function()? gpu,
    TResult Function()? infiniband,
    TResult Function()? proxy,
    TResult Function()? unixHotplug,
    TResult Function()? tpm,
    TResult Function()? pci,
    required TResult orElse(),
  }) {
    if (disk != null) {
      return disk(source, path);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LxdNoConfig value) none,
    required TResult Function(LxdNicConfig value) nic,
    required TResult Function(LxdDiskConfig value) disk,
    required TResult Function(LxdUnixCharConfig value) unixChar,
    required TResult Function(LxdUnixBlockConfig value) unixBlock,
    required TResult Function(LxdUsbConfig value) usb,
    required TResult Function(LxdGpuConfig value) gpu,
    required TResult Function(LxdInfinibandConfig value) infiniband,
    required TResult Function(LxdProxyConfig value) proxy,
    required TResult Function(LxdUnixHotplugConfig value) unixHotplug,
    required TResult Function(LxdTpmConfig value) tpm,
    required TResult Function(LxdPciConfig value) pci,
  }) {
    return disk(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(LxdNoConfig value)? none,
    TResult Function(LxdNicConfig value)? nic,
    TResult Function(LxdDiskConfig value)? disk,
    TResult Function(LxdUnixCharConfig value)? unixChar,
    TResult Function(LxdUnixBlockConfig value)? unixBlock,
    TResult Function(LxdUsbConfig value)? usb,
    TResult Function(LxdGpuConfig value)? gpu,
    TResult Function(LxdInfinibandConfig value)? infiniband,
    TResult Function(LxdProxyConfig value)? proxy,
    TResult Function(LxdUnixHotplugConfig value)? unixHotplug,
    TResult Function(LxdTpmConfig value)? tpm,
    TResult Function(LxdPciConfig value)? pci,
  }) {
    return disk?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LxdNoConfig value)? none,
    TResult Function(LxdNicConfig value)? nic,
    TResult Function(LxdDiskConfig value)? disk,
    TResult Function(LxdUnixCharConfig value)? unixChar,
    TResult Function(LxdUnixBlockConfig value)? unixBlock,
    TResult Function(LxdUsbConfig value)? usb,
    TResult Function(LxdGpuConfig value)? gpu,
    TResult Function(LxdInfinibandConfig value)? infiniband,
    TResult Function(LxdProxyConfig value)? proxy,
    TResult Function(LxdUnixHotplugConfig value)? unixHotplug,
    TResult Function(LxdTpmConfig value)? tpm,
    TResult Function(LxdPciConfig value)? pci,
    required TResult orElse(),
  }) {
    if (disk != null) {
      return disk(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$LxdDiskConfigToJson(this);
  }
}

abstract class LxdDiskConfig implements LxdDeviceConfig {
  const factory LxdDiskConfig(
      {required final String source,
      required final String path}) = _$LxdDiskConfig;

  factory LxdDiskConfig.fromJson(Map<String, dynamic> json) =
      _$LxdDiskConfig.fromJson;

  String get source;
  String get path;
  @JsonKey(ignore: true)
  _$$LxdDiskConfigCopyWith<_$LxdDiskConfig> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LxdUnixCharConfigCopyWith<$Res> {
  factory _$$LxdUnixCharConfigCopyWith(
          _$LxdUnixCharConfig value, $Res Function(_$LxdUnixCharConfig) then) =
      __$$LxdUnixCharConfigCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LxdUnixCharConfigCopyWithImpl<$Res>
    extends _$LxdDeviceConfigCopyWithImpl<$Res>
    implements _$$LxdUnixCharConfigCopyWith<$Res> {
  __$$LxdUnixCharConfigCopyWithImpl(
      _$LxdUnixCharConfig _value, $Res Function(_$LxdUnixCharConfig) _then)
      : super(_value, (v) => _then(v as _$LxdUnixCharConfig));

  @override
  _$LxdUnixCharConfig get _value => super._value as _$LxdUnixCharConfig;
}

/// @nodoc
@JsonSerializable()
class _$LxdUnixCharConfig implements LxdUnixCharConfig {
  const _$LxdUnixCharConfig({final String? $type})
      : $type = $type ?? 'unix-char';

  factory _$LxdUnixCharConfig.fromJson(Map<String, dynamic> json) =>
      _$$LxdUnixCharConfigFromJson(json);

  @JsonKey(name: 'type')
  final String $type;

  @override
  String toString() {
    return 'LxdDeviceConfig.unixChar()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LxdUnixCharConfig);
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() none,
    required TResult Function() nic,
    required TResult Function(String source, String path) disk,
    required TResult Function() unixChar,
    required TResult Function() unixBlock,
    required TResult Function() usb,
    required TResult Function() gpu,
    required TResult Function() infiniband,
    required TResult Function() proxy,
    required TResult Function() unixHotplug,
    required TResult Function() tpm,
    required TResult Function() pci,
  }) {
    return unixChar();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? none,
    TResult Function()? nic,
    TResult Function(String source, String path)? disk,
    TResult Function()? unixChar,
    TResult Function()? unixBlock,
    TResult Function()? usb,
    TResult Function()? gpu,
    TResult Function()? infiniband,
    TResult Function()? proxy,
    TResult Function()? unixHotplug,
    TResult Function()? tpm,
    TResult Function()? pci,
  }) {
    return unixChar?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? none,
    TResult Function()? nic,
    TResult Function(String source, String path)? disk,
    TResult Function()? unixChar,
    TResult Function()? unixBlock,
    TResult Function()? usb,
    TResult Function()? gpu,
    TResult Function()? infiniband,
    TResult Function()? proxy,
    TResult Function()? unixHotplug,
    TResult Function()? tpm,
    TResult Function()? pci,
    required TResult orElse(),
  }) {
    if (unixChar != null) {
      return unixChar();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LxdNoConfig value) none,
    required TResult Function(LxdNicConfig value) nic,
    required TResult Function(LxdDiskConfig value) disk,
    required TResult Function(LxdUnixCharConfig value) unixChar,
    required TResult Function(LxdUnixBlockConfig value) unixBlock,
    required TResult Function(LxdUsbConfig value) usb,
    required TResult Function(LxdGpuConfig value) gpu,
    required TResult Function(LxdInfinibandConfig value) infiniband,
    required TResult Function(LxdProxyConfig value) proxy,
    required TResult Function(LxdUnixHotplugConfig value) unixHotplug,
    required TResult Function(LxdTpmConfig value) tpm,
    required TResult Function(LxdPciConfig value) pci,
  }) {
    return unixChar(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(LxdNoConfig value)? none,
    TResult Function(LxdNicConfig value)? nic,
    TResult Function(LxdDiskConfig value)? disk,
    TResult Function(LxdUnixCharConfig value)? unixChar,
    TResult Function(LxdUnixBlockConfig value)? unixBlock,
    TResult Function(LxdUsbConfig value)? usb,
    TResult Function(LxdGpuConfig value)? gpu,
    TResult Function(LxdInfinibandConfig value)? infiniband,
    TResult Function(LxdProxyConfig value)? proxy,
    TResult Function(LxdUnixHotplugConfig value)? unixHotplug,
    TResult Function(LxdTpmConfig value)? tpm,
    TResult Function(LxdPciConfig value)? pci,
  }) {
    return unixChar?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LxdNoConfig value)? none,
    TResult Function(LxdNicConfig value)? nic,
    TResult Function(LxdDiskConfig value)? disk,
    TResult Function(LxdUnixCharConfig value)? unixChar,
    TResult Function(LxdUnixBlockConfig value)? unixBlock,
    TResult Function(LxdUsbConfig value)? usb,
    TResult Function(LxdGpuConfig value)? gpu,
    TResult Function(LxdInfinibandConfig value)? infiniband,
    TResult Function(LxdProxyConfig value)? proxy,
    TResult Function(LxdUnixHotplugConfig value)? unixHotplug,
    TResult Function(LxdTpmConfig value)? tpm,
    TResult Function(LxdPciConfig value)? pci,
    required TResult orElse(),
  }) {
    if (unixChar != null) {
      return unixChar(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$LxdUnixCharConfigToJson(this);
  }
}

abstract class LxdUnixCharConfig implements LxdDeviceConfig {
  const factory LxdUnixCharConfig() = _$LxdUnixCharConfig;

  factory LxdUnixCharConfig.fromJson(Map<String, dynamic> json) =
      _$LxdUnixCharConfig.fromJson;
}

/// @nodoc
abstract class _$$LxdUnixBlockConfigCopyWith<$Res> {
  factory _$$LxdUnixBlockConfigCopyWith(_$LxdUnixBlockConfig value,
          $Res Function(_$LxdUnixBlockConfig) then) =
      __$$LxdUnixBlockConfigCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LxdUnixBlockConfigCopyWithImpl<$Res>
    extends _$LxdDeviceConfigCopyWithImpl<$Res>
    implements _$$LxdUnixBlockConfigCopyWith<$Res> {
  __$$LxdUnixBlockConfigCopyWithImpl(
      _$LxdUnixBlockConfig _value, $Res Function(_$LxdUnixBlockConfig) _then)
      : super(_value, (v) => _then(v as _$LxdUnixBlockConfig));

  @override
  _$LxdUnixBlockConfig get _value => super._value as _$LxdUnixBlockConfig;
}

/// @nodoc
@JsonSerializable()
class _$LxdUnixBlockConfig implements LxdUnixBlockConfig {
  const _$LxdUnixBlockConfig({final String? $type})
      : $type = $type ?? 'unix-block';

  factory _$LxdUnixBlockConfig.fromJson(Map<String, dynamic> json) =>
      _$$LxdUnixBlockConfigFromJson(json);

  @JsonKey(name: 'type')
  final String $type;

  @override
  String toString() {
    return 'LxdDeviceConfig.unixBlock()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LxdUnixBlockConfig);
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() none,
    required TResult Function() nic,
    required TResult Function(String source, String path) disk,
    required TResult Function() unixChar,
    required TResult Function() unixBlock,
    required TResult Function() usb,
    required TResult Function() gpu,
    required TResult Function() infiniband,
    required TResult Function() proxy,
    required TResult Function() unixHotplug,
    required TResult Function() tpm,
    required TResult Function() pci,
  }) {
    return unixBlock();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? none,
    TResult Function()? nic,
    TResult Function(String source, String path)? disk,
    TResult Function()? unixChar,
    TResult Function()? unixBlock,
    TResult Function()? usb,
    TResult Function()? gpu,
    TResult Function()? infiniband,
    TResult Function()? proxy,
    TResult Function()? unixHotplug,
    TResult Function()? tpm,
    TResult Function()? pci,
  }) {
    return unixBlock?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? none,
    TResult Function()? nic,
    TResult Function(String source, String path)? disk,
    TResult Function()? unixChar,
    TResult Function()? unixBlock,
    TResult Function()? usb,
    TResult Function()? gpu,
    TResult Function()? infiniband,
    TResult Function()? proxy,
    TResult Function()? unixHotplug,
    TResult Function()? tpm,
    TResult Function()? pci,
    required TResult orElse(),
  }) {
    if (unixBlock != null) {
      return unixBlock();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LxdNoConfig value) none,
    required TResult Function(LxdNicConfig value) nic,
    required TResult Function(LxdDiskConfig value) disk,
    required TResult Function(LxdUnixCharConfig value) unixChar,
    required TResult Function(LxdUnixBlockConfig value) unixBlock,
    required TResult Function(LxdUsbConfig value) usb,
    required TResult Function(LxdGpuConfig value) gpu,
    required TResult Function(LxdInfinibandConfig value) infiniband,
    required TResult Function(LxdProxyConfig value) proxy,
    required TResult Function(LxdUnixHotplugConfig value) unixHotplug,
    required TResult Function(LxdTpmConfig value) tpm,
    required TResult Function(LxdPciConfig value) pci,
  }) {
    return unixBlock(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(LxdNoConfig value)? none,
    TResult Function(LxdNicConfig value)? nic,
    TResult Function(LxdDiskConfig value)? disk,
    TResult Function(LxdUnixCharConfig value)? unixChar,
    TResult Function(LxdUnixBlockConfig value)? unixBlock,
    TResult Function(LxdUsbConfig value)? usb,
    TResult Function(LxdGpuConfig value)? gpu,
    TResult Function(LxdInfinibandConfig value)? infiniband,
    TResult Function(LxdProxyConfig value)? proxy,
    TResult Function(LxdUnixHotplugConfig value)? unixHotplug,
    TResult Function(LxdTpmConfig value)? tpm,
    TResult Function(LxdPciConfig value)? pci,
  }) {
    return unixBlock?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LxdNoConfig value)? none,
    TResult Function(LxdNicConfig value)? nic,
    TResult Function(LxdDiskConfig value)? disk,
    TResult Function(LxdUnixCharConfig value)? unixChar,
    TResult Function(LxdUnixBlockConfig value)? unixBlock,
    TResult Function(LxdUsbConfig value)? usb,
    TResult Function(LxdGpuConfig value)? gpu,
    TResult Function(LxdInfinibandConfig value)? infiniband,
    TResult Function(LxdProxyConfig value)? proxy,
    TResult Function(LxdUnixHotplugConfig value)? unixHotplug,
    TResult Function(LxdTpmConfig value)? tpm,
    TResult Function(LxdPciConfig value)? pci,
    required TResult orElse(),
  }) {
    if (unixBlock != null) {
      return unixBlock(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$LxdUnixBlockConfigToJson(this);
  }
}

abstract class LxdUnixBlockConfig implements LxdDeviceConfig {
  const factory LxdUnixBlockConfig() = _$LxdUnixBlockConfig;

  factory LxdUnixBlockConfig.fromJson(Map<String, dynamic> json) =
      _$LxdUnixBlockConfig.fromJson;
}

/// @nodoc
abstract class _$$LxdUsbConfigCopyWith<$Res> {
  factory _$$LxdUsbConfigCopyWith(
          _$LxdUsbConfig value, $Res Function(_$LxdUsbConfig) then) =
      __$$LxdUsbConfigCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LxdUsbConfigCopyWithImpl<$Res>
    extends _$LxdDeviceConfigCopyWithImpl<$Res>
    implements _$$LxdUsbConfigCopyWith<$Res> {
  __$$LxdUsbConfigCopyWithImpl(
      _$LxdUsbConfig _value, $Res Function(_$LxdUsbConfig) _then)
      : super(_value, (v) => _then(v as _$LxdUsbConfig));

  @override
  _$LxdUsbConfig get _value => super._value as _$LxdUsbConfig;
}

/// @nodoc
@JsonSerializable()
class _$LxdUsbConfig implements LxdUsbConfig {
  const _$LxdUsbConfig({final String? $type}) : $type = $type ?? 'usb';

  factory _$LxdUsbConfig.fromJson(Map<String, dynamic> json) =>
      _$$LxdUsbConfigFromJson(json);

  @JsonKey(name: 'type')
  final String $type;

  @override
  String toString() {
    return 'LxdDeviceConfig.usb()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LxdUsbConfig);
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() none,
    required TResult Function() nic,
    required TResult Function(String source, String path) disk,
    required TResult Function() unixChar,
    required TResult Function() unixBlock,
    required TResult Function() usb,
    required TResult Function() gpu,
    required TResult Function() infiniband,
    required TResult Function() proxy,
    required TResult Function() unixHotplug,
    required TResult Function() tpm,
    required TResult Function() pci,
  }) {
    return usb();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? none,
    TResult Function()? nic,
    TResult Function(String source, String path)? disk,
    TResult Function()? unixChar,
    TResult Function()? unixBlock,
    TResult Function()? usb,
    TResult Function()? gpu,
    TResult Function()? infiniband,
    TResult Function()? proxy,
    TResult Function()? unixHotplug,
    TResult Function()? tpm,
    TResult Function()? pci,
  }) {
    return usb?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? none,
    TResult Function()? nic,
    TResult Function(String source, String path)? disk,
    TResult Function()? unixChar,
    TResult Function()? unixBlock,
    TResult Function()? usb,
    TResult Function()? gpu,
    TResult Function()? infiniband,
    TResult Function()? proxy,
    TResult Function()? unixHotplug,
    TResult Function()? tpm,
    TResult Function()? pci,
    required TResult orElse(),
  }) {
    if (usb != null) {
      return usb();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LxdNoConfig value) none,
    required TResult Function(LxdNicConfig value) nic,
    required TResult Function(LxdDiskConfig value) disk,
    required TResult Function(LxdUnixCharConfig value) unixChar,
    required TResult Function(LxdUnixBlockConfig value) unixBlock,
    required TResult Function(LxdUsbConfig value) usb,
    required TResult Function(LxdGpuConfig value) gpu,
    required TResult Function(LxdInfinibandConfig value) infiniband,
    required TResult Function(LxdProxyConfig value) proxy,
    required TResult Function(LxdUnixHotplugConfig value) unixHotplug,
    required TResult Function(LxdTpmConfig value) tpm,
    required TResult Function(LxdPciConfig value) pci,
  }) {
    return usb(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(LxdNoConfig value)? none,
    TResult Function(LxdNicConfig value)? nic,
    TResult Function(LxdDiskConfig value)? disk,
    TResult Function(LxdUnixCharConfig value)? unixChar,
    TResult Function(LxdUnixBlockConfig value)? unixBlock,
    TResult Function(LxdUsbConfig value)? usb,
    TResult Function(LxdGpuConfig value)? gpu,
    TResult Function(LxdInfinibandConfig value)? infiniband,
    TResult Function(LxdProxyConfig value)? proxy,
    TResult Function(LxdUnixHotplugConfig value)? unixHotplug,
    TResult Function(LxdTpmConfig value)? tpm,
    TResult Function(LxdPciConfig value)? pci,
  }) {
    return usb?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LxdNoConfig value)? none,
    TResult Function(LxdNicConfig value)? nic,
    TResult Function(LxdDiskConfig value)? disk,
    TResult Function(LxdUnixCharConfig value)? unixChar,
    TResult Function(LxdUnixBlockConfig value)? unixBlock,
    TResult Function(LxdUsbConfig value)? usb,
    TResult Function(LxdGpuConfig value)? gpu,
    TResult Function(LxdInfinibandConfig value)? infiniband,
    TResult Function(LxdProxyConfig value)? proxy,
    TResult Function(LxdUnixHotplugConfig value)? unixHotplug,
    TResult Function(LxdTpmConfig value)? tpm,
    TResult Function(LxdPciConfig value)? pci,
    required TResult orElse(),
  }) {
    if (usb != null) {
      return usb(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$LxdUsbConfigToJson(this);
  }
}

abstract class LxdUsbConfig implements LxdDeviceConfig {
  const factory LxdUsbConfig() = _$LxdUsbConfig;

  factory LxdUsbConfig.fromJson(Map<String, dynamic> json) =
      _$LxdUsbConfig.fromJson;
}

/// @nodoc
abstract class _$$LxdGpuConfigCopyWith<$Res> {
  factory _$$LxdGpuConfigCopyWith(
          _$LxdGpuConfig value, $Res Function(_$LxdGpuConfig) then) =
      __$$LxdGpuConfigCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LxdGpuConfigCopyWithImpl<$Res>
    extends _$LxdDeviceConfigCopyWithImpl<$Res>
    implements _$$LxdGpuConfigCopyWith<$Res> {
  __$$LxdGpuConfigCopyWithImpl(
      _$LxdGpuConfig _value, $Res Function(_$LxdGpuConfig) _then)
      : super(_value, (v) => _then(v as _$LxdGpuConfig));

  @override
  _$LxdGpuConfig get _value => super._value as _$LxdGpuConfig;
}

/// @nodoc
@JsonSerializable()
class _$LxdGpuConfig implements LxdGpuConfig {
  const _$LxdGpuConfig({final String? $type}) : $type = $type ?? 'gpu';

  factory _$LxdGpuConfig.fromJson(Map<String, dynamic> json) =>
      _$$LxdGpuConfigFromJson(json);

  @JsonKey(name: 'type')
  final String $type;

  @override
  String toString() {
    return 'LxdDeviceConfig.gpu()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LxdGpuConfig);
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() none,
    required TResult Function() nic,
    required TResult Function(String source, String path) disk,
    required TResult Function() unixChar,
    required TResult Function() unixBlock,
    required TResult Function() usb,
    required TResult Function() gpu,
    required TResult Function() infiniband,
    required TResult Function() proxy,
    required TResult Function() unixHotplug,
    required TResult Function() tpm,
    required TResult Function() pci,
  }) {
    return gpu();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? none,
    TResult Function()? nic,
    TResult Function(String source, String path)? disk,
    TResult Function()? unixChar,
    TResult Function()? unixBlock,
    TResult Function()? usb,
    TResult Function()? gpu,
    TResult Function()? infiniband,
    TResult Function()? proxy,
    TResult Function()? unixHotplug,
    TResult Function()? tpm,
    TResult Function()? pci,
  }) {
    return gpu?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? none,
    TResult Function()? nic,
    TResult Function(String source, String path)? disk,
    TResult Function()? unixChar,
    TResult Function()? unixBlock,
    TResult Function()? usb,
    TResult Function()? gpu,
    TResult Function()? infiniband,
    TResult Function()? proxy,
    TResult Function()? unixHotplug,
    TResult Function()? tpm,
    TResult Function()? pci,
    required TResult orElse(),
  }) {
    if (gpu != null) {
      return gpu();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LxdNoConfig value) none,
    required TResult Function(LxdNicConfig value) nic,
    required TResult Function(LxdDiskConfig value) disk,
    required TResult Function(LxdUnixCharConfig value) unixChar,
    required TResult Function(LxdUnixBlockConfig value) unixBlock,
    required TResult Function(LxdUsbConfig value) usb,
    required TResult Function(LxdGpuConfig value) gpu,
    required TResult Function(LxdInfinibandConfig value) infiniband,
    required TResult Function(LxdProxyConfig value) proxy,
    required TResult Function(LxdUnixHotplugConfig value) unixHotplug,
    required TResult Function(LxdTpmConfig value) tpm,
    required TResult Function(LxdPciConfig value) pci,
  }) {
    return gpu(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(LxdNoConfig value)? none,
    TResult Function(LxdNicConfig value)? nic,
    TResult Function(LxdDiskConfig value)? disk,
    TResult Function(LxdUnixCharConfig value)? unixChar,
    TResult Function(LxdUnixBlockConfig value)? unixBlock,
    TResult Function(LxdUsbConfig value)? usb,
    TResult Function(LxdGpuConfig value)? gpu,
    TResult Function(LxdInfinibandConfig value)? infiniband,
    TResult Function(LxdProxyConfig value)? proxy,
    TResult Function(LxdUnixHotplugConfig value)? unixHotplug,
    TResult Function(LxdTpmConfig value)? tpm,
    TResult Function(LxdPciConfig value)? pci,
  }) {
    return gpu?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LxdNoConfig value)? none,
    TResult Function(LxdNicConfig value)? nic,
    TResult Function(LxdDiskConfig value)? disk,
    TResult Function(LxdUnixCharConfig value)? unixChar,
    TResult Function(LxdUnixBlockConfig value)? unixBlock,
    TResult Function(LxdUsbConfig value)? usb,
    TResult Function(LxdGpuConfig value)? gpu,
    TResult Function(LxdInfinibandConfig value)? infiniband,
    TResult Function(LxdProxyConfig value)? proxy,
    TResult Function(LxdUnixHotplugConfig value)? unixHotplug,
    TResult Function(LxdTpmConfig value)? tpm,
    TResult Function(LxdPciConfig value)? pci,
    required TResult orElse(),
  }) {
    if (gpu != null) {
      return gpu(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$LxdGpuConfigToJson(this);
  }
}

abstract class LxdGpuConfig implements LxdDeviceConfig {
  const factory LxdGpuConfig() = _$LxdGpuConfig;

  factory LxdGpuConfig.fromJson(Map<String, dynamic> json) =
      _$LxdGpuConfig.fromJson;
}

/// @nodoc
abstract class _$$LxdInfinibandConfigCopyWith<$Res> {
  factory _$$LxdInfinibandConfigCopyWith(_$LxdInfinibandConfig value,
          $Res Function(_$LxdInfinibandConfig) then) =
      __$$LxdInfinibandConfigCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LxdInfinibandConfigCopyWithImpl<$Res>
    extends _$LxdDeviceConfigCopyWithImpl<$Res>
    implements _$$LxdInfinibandConfigCopyWith<$Res> {
  __$$LxdInfinibandConfigCopyWithImpl(
      _$LxdInfinibandConfig _value, $Res Function(_$LxdInfinibandConfig) _then)
      : super(_value, (v) => _then(v as _$LxdInfinibandConfig));

  @override
  _$LxdInfinibandConfig get _value => super._value as _$LxdInfinibandConfig;
}

/// @nodoc
@JsonSerializable()
class _$LxdInfinibandConfig implements LxdInfinibandConfig {
  const _$LxdInfinibandConfig({final String? $type})
      : $type = $type ?? 'infiniband';

  factory _$LxdInfinibandConfig.fromJson(Map<String, dynamic> json) =>
      _$$LxdInfinibandConfigFromJson(json);

  @JsonKey(name: 'type')
  final String $type;

  @override
  String toString() {
    return 'LxdDeviceConfig.infiniband()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LxdInfinibandConfig);
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() none,
    required TResult Function() nic,
    required TResult Function(String source, String path) disk,
    required TResult Function() unixChar,
    required TResult Function() unixBlock,
    required TResult Function() usb,
    required TResult Function() gpu,
    required TResult Function() infiniband,
    required TResult Function() proxy,
    required TResult Function() unixHotplug,
    required TResult Function() tpm,
    required TResult Function() pci,
  }) {
    return infiniband();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? none,
    TResult Function()? nic,
    TResult Function(String source, String path)? disk,
    TResult Function()? unixChar,
    TResult Function()? unixBlock,
    TResult Function()? usb,
    TResult Function()? gpu,
    TResult Function()? infiniband,
    TResult Function()? proxy,
    TResult Function()? unixHotplug,
    TResult Function()? tpm,
    TResult Function()? pci,
  }) {
    return infiniband?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? none,
    TResult Function()? nic,
    TResult Function(String source, String path)? disk,
    TResult Function()? unixChar,
    TResult Function()? unixBlock,
    TResult Function()? usb,
    TResult Function()? gpu,
    TResult Function()? infiniband,
    TResult Function()? proxy,
    TResult Function()? unixHotplug,
    TResult Function()? tpm,
    TResult Function()? pci,
    required TResult orElse(),
  }) {
    if (infiniband != null) {
      return infiniband();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LxdNoConfig value) none,
    required TResult Function(LxdNicConfig value) nic,
    required TResult Function(LxdDiskConfig value) disk,
    required TResult Function(LxdUnixCharConfig value) unixChar,
    required TResult Function(LxdUnixBlockConfig value) unixBlock,
    required TResult Function(LxdUsbConfig value) usb,
    required TResult Function(LxdGpuConfig value) gpu,
    required TResult Function(LxdInfinibandConfig value) infiniband,
    required TResult Function(LxdProxyConfig value) proxy,
    required TResult Function(LxdUnixHotplugConfig value) unixHotplug,
    required TResult Function(LxdTpmConfig value) tpm,
    required TResult Function(LxdPciConfig value) pci,
  }) {
    return infiniband(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(LxdNoConfig value)? none,
    TResult Function(LxdNicConfig value)? nic,
    TResult Function(LxdDiskConfig value)? disk,
    TResult Function(LxdUnixCharConfig value)? unixChar,
    TResult Function(LxdUnixBlockConfig value)? unixBlock,
    TResult Function(LxdUsbConfig value)? usb,
    TResult Function(LxdGpuConfig value)? gpu,
    TResult Function(LxdInfinibandConfig value)? infiniband,
    TResult Function(LxdProxyConfig value)? proxy,
    TResult Function(LxdUnixHotplugConfig value)? unixHotplug,
    TResult Function(LxdTpmConfig value)? tpm,
    TResult Function(LxdPciConfig value)? pci,
  }) {
    return infiniband?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LxdNoConfig value)? none,
    TResult Function(LxdNicConfig value)? nic,
    TResult Function(LxdDiskConfig value)? disk,
    TResult Function(LxdUnixCharConfig value)? unixChar,
    TResult Function(LxdUnixBlockConfig value)? unixBlock,
    TResult Function(LxdUsbConfig value)? usb,
    TResult Function(LxdGpuConfig value)? gpu,
    TResult Function(LxdInfinibandConfig value)? infiniband,
    TResult Function(LxdProxyConfig value)? proxy,
    TResult Function(LxdUnixHotplugConfig value)? unixHotplug,
    TResult Function(LxdTpmConfig value)? tpm,
    TResult Function(LxdPciConfig value)? pci,
    required TResult orElse(),
  }) {
    if (infiniband != null) {
      return infiniband(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$LxdInfinibandConfigToJson(this);
  }
}

abstract class LxdInfinibandConfig implements LxdDeviceConfig {
  const factory LxdInfinibandConfig() = _$LxdInfinibandConfig;

  factory LxdInfinibandConfig.fromJson(Map<String, dynamic> json) =
      _$LxdInfinibandConfig.fromJson;
}

/// @nodoc
abstract class _$$LxdProxyConfigCopyWith<$Res> {
  factory _$$LxdProxyConfigCopyWith(
          _$LxdProxyConfig value, $Res Function(_$LxdProxyConfig) then) =
      __$$LxdProxyConfigCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LxdProxyConfigCopyWithImpl<$Res>
    extends _$LxdDeviceConfigCopyWithImpl<$Res>
    implements _$$LxdProxyConfigCopyWith<$Res> {
  __$$LxdProxyConfigCopyWithImpl(
      _$LxdProxyConfig _value, $Res Function(_$LxdProxyConfig) _then)
      : super(_value, (v) => _then(v as _$LxdProxyConfig));

  @override
  _$LxdProxyConfig get _value => super._value as _$LxdProxyConfig;
}

/// @nodoc
@JsonSerializable()
class _$LxdProxyConfig implements LxdProxyConfig {
  const _$LxdProxyConfig({final String? $type}) : $type = $type ?? 'proxy';

  factory _$LxdProxyConfig.fromJson(Map<String, dynamic> json) =>
      _$$LxdProxyConfigFromJson(json);

  @JsonKey(name: 'type')
  final String $type;

  @override
  String toString() {
    return 'LxdDeviceConfig.proxy()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LxdProxyConfig);
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() none,
    required TResult Function() nic,
    required TResult Function(String source, String path) disk,
    required TResult Function() unixChar,
    required TResult Function() unixBlock,
    required TResult Function() usb,
    required TResult Function() gpu,
    required TResult Function() infiniband,
    required TResult Function() proxy,
    required TResult Function() unixHotplug,
    required TResult Function() tpm,
    required TResult Function() pci,
  }) {
    return proxy();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? none,
    TResult Function()? nic,
    TResult Function(String source, String path)? disk,
    TResult Function()? unixChar,
    TResult Function()? unixBlock,
    TResult Function()? usb,
    TResult Function()? gpu,
    TResult Function()? infiniband,
    TResult Function()? proxy,
    TResult Function()? unixHotplug,
    TResult Function()? tpm,
    TResult Function()? pci,
  }) {
    return proxy?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? none,
    TResult Function()? nic,
    TResult Function(String source, String path)? disk,
    TResult Function()? unixChar,
    TResult Function()? unixBlock,
    TResult Function()? usb,
    TResult Function()? gpu,
    TResult Function()? infiniband,
    TResult Function()? proxy,
    TResult Function()? unixHotplug,
    TResult Function()? tpm,
    TResult Function()? pci,
    required TResult orElse(),
  }) {
    if (proxy != null) {
      return proxy();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LxdNoConfig value) none,
    required TResult Function(LxdNicConfig value) nic,
    required TResult Function(LxdDiskConfig value) disk,
    required TResult Function(LxdUnixCharConfig value) unixChar,
    required TResult Function(LxdUnixBlockConfig value) unixBlock,
    required TResult Function(LxdUsbConfig value) usb,
    required TResult Function(LxdGpuConfig value) gpu,
    required TResult Function(LxdInfinibandConfig value) infiniband,
    required TResult Function(LxdProxyConfig value) proxy,
    required TResult Function(LxdUnixHotplugConfig value) unixHotplug,
    required TResult Function(LxdTpmConfig value) tpm,
    required TResult Function(LxdPciConfig value) pci,
  }) {
    return proxy(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(LxdNoConfig value)? none,
    TResult Function(LxdNicConfig value)? nic,
    TResult Function(LxdDiskConfig value)? disk,
    TResult Function(LxdUnixCharConfig value)? unixChar,
    TResult Function(LxdUnixBlockConfig value)? unixBlock,
    TResult Function(LxdUsbConfig value)? usb,
    TResult Function(LxdGpuConfig value)? gpu,
    TResult Function(LxdInfinibandConfig value)? infiniband,
    TResult Function(LxdProxyConfig value)? proxy,
    TResult Function(LxdUnixHotplugConfig value)? unixHotplug,
    TResult Function(LxdTpmConfig value)? tpm,
    TResult Function(LxdPciConfig value)? pci,
  }) {
    return proxy?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LxdNoConfig value)? none,
    TResult Function(LxdNicConfig value)? nic,
    TResult Function(LxdDiskConfig value)? disk,
    TResult Function(LxdUnixCharConfig value)? unixChar,
    TResult Function(LxdUnixBlockConfig value)? unixBlock,
    TResult Function(LxdUsbConfig value)? usb,
    TResult Function(LxdGpuConfig value)? gpu,
    TResult Function(LxdInfinibandConfig value)? infiniband,
    TResult Function(LxdProxyConfig value)? proxy,
    TResult Function(LxdUnixHotplugConfig value)? unixHotplug,
    TResult Function(LxdTpmConfig value)? tpm,
    TResult Function(LxdPciConfig value)? pci,
    required TResult orElse(),
  }) {
    if (proxy != null) {
      return proxy(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$LxdProxyConfigToJson(this);
  }
}

abstract class LxdProxyConfig implements LxdDeviceConfig {
  const factory LxdProxyConfig() = _$LxdProxyConfig;

  factory LxdProxyConfig.fromJson(Map<String, dynamic> json) =
      _$LxdProxyConfig.fromJson;
}

/// @nodoc
abstract class _$$LxdUnixHotplugConfigCopyWith<$Res> {
  factory _$$LxdUnixHotplugConfigCopyWith(_$LxdUnixHotplugConfig value,
          $Res Function(_$LxdUnixHotplugConfig) then) =
      __$$LxdUnixHotplugConfigCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LxdUnixHotplugConfigCopyWithImpl<$Res>
    extends _$LxdDeviceConfigCopyWithImpl<$Res>
    implements _$$LxdUnixHotplugConfigCopyWith<$Res> {
  __$$LxdUnixHotplugConfigCopyWithImpl(_$LxdUnixHotplugConfig _value,
      $Res Function(_$LxdUnixHotplugConfig) _then)
      : super(_value, (v) => _then(v as _$LxdUnixHotplugConfig));

  @override
  _$LxdUnixHotplugConfig get _value => super._value as _$LxdUnixHotplugConfig;
}

/// @nodoc
@JsonSerializable()
class _$LxdUnixHotplugConfig implements LxdUnixHotplugConfig {
  const _$LxdUnixHotplugConfig({final String? $type})
      : $type = $type ?? 'unix-hotplug';

  factory _$LxdUnixHotplugConfig.fromJson(Map<String, dynamic> json) =>
      _$$LxdUnixHotplugConfigFromJson(json);

  @JsonKey(name: 'type')
  final String $type;

  @override
  String toString() {
    return 'LxdDeviceConfig.unixHotplug()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LxdUnixHotplugConfig);
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() none,
    required TResult Function() nic,
    required TResult Function(String source, String path) disk,
    required TResult Function() unixChar,
    required TResult Function() unixBlock,
    required TResult Function() usb,
    required TResult Function() gpu,
    required TResult Function() infiniband,
    required TResult Function() proxy,
    required TResult Function() unixHotplug,
    required TResult Function() tpm,
    required TResult Function() pci,
  }) {
    return unixHotplug();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? none,
    TResult Function()? nic,
    TResult Function(String source, String path)? disk,
    TResult Function()? unixChar,
    TResult Function()? unixBlock,
    TResult Function()? usb,
    TResult Function()? gpu,
    TResult Function()? infiniband,
    TResult Function()? proxy,
    TResult Function()? unixHotplug,
    TResult Function()? tpm,
    TResult Function()? pci,
  }) {
    return unixHotplug?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? none,
    TResult Function()? nic,
    TResult Function(String source, String path)? disk,
    TResult Function()? unixChar,
    TResult Function()? unixBlock,
    TResult Function()? usb,
    TResult Function()? gpu,
    TResult Function()? infiniband,
    TResult Function()? proxy,
    TResult Function()? unixHotplug,
    TResult Function()? tpm,
    TResult Function()? pci,
    required TResult orElse(),
  }) {
    if (unixHotplug != null) {
      return unixHotplug();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LxdNoConfig value) none,
    required TResult Function(LxdNicConfig value) nic,
    required TResult Function(LxdDiskConfig value) disk,
    required TResult Function(LxdUnixCharConfig value) unixChar,
    required TResult Function(LxdUnixBlockConfig value) unixBlock,
    required TResult Function(LxdUsbConfig value) usb,
    required TResult Function(LxdGpuConfig value) gpu,
    required TResult Function(LxdInfinibandConfig value) infiniband,
    required TResult Function(LxdProxyConfig value) proxy,
    required TResult Function(LxdUnixHotplugConfig value) unixHotplug,
    required TResult Function(LxdTpmConfig value) tpm,
    required TResult Function(LxdPciConfig value) pci,
  }) {
    return unixHotplug(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(LxdNoConfig value)? none,
    TResult Function(LxdNicConfig value)? nic,
    TResult Function(LxdDiskConfig value)? disk,
    TResult Function(LxdUnixCharConfig value)? unixChar,
    TResult Function(LxdUnixBlockConfig value)? unixBlock,
    TResult Function(LxdUsbConfig value)? usb,
    TResult Function(LxdGpuConfig value)? gpu,
    TResult Function(LxdInfinibandConfig value)? infiniband,
    TResult Function(LxdProxyConfig value)? proxy,
    TResult Function(LxdUnixHotplugConfig value)? unixHotplug,
    TResult Function(LxdTpmConfig value)? tpm,
    TResult Function(LxdPciConfig value)? pci,
  }) {
    return unixHotplug?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LxdNoConfig value)? none,
    TResult Function(LxdNicConfig value)? nic,
    TResult Function(LxdDiskConfig value)? disk,
    TResult Function(LxdUnixCharConfig value)? unixChar,
    TResult Function(LxdUnixBlockConfig value)? unixBlock,
    TResult Function(LxdUsbConfig value)? usb,
    TResult Function(LxdGpuConfig value)? gpu,
    TResult Function(LxdInfinibandConfig value)? infiniband,
    TResult Function(LxdProxyConfig value)? proxy,
    TResult Function(LxdUnixHotplugConfig value)? unixHotplug,
    TResult Function(LxdTpmConfig value)? tpm,
    TResult Function(LxdPciConfig value)? pci,
    required TResult orElse(),
  }) {
    if (unixHotplug != null) {
      return unixHotplug(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$LxdUnixHotplugConfigToJson(this);
  }
}

abstract class LxdUnixHotplugConfig implements LxdDeviceConfig {
  const factory LxdUnixHotplugConfig() = _$LxdUnixHotplugConfig;

  factory LxdUnixHotplugConfig.fromJson(Map<String, dynamic> json) =
      _$LxdUnixHotplugConfig.fromJson;
}

/// @nodoc
abstract class _$$LxdTpmConfigCopyWith<$Res> {
  factory _$$LxdTpmConfigCopyWith(
          _$LxdTpmConfig value, $Res Function(_$LxdTpmConfig) then) =
      __$$LxdTpmConfigCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LxdTpmConfigCopyWithImpl<$Res>
    extends _$LxdDeviceConfigCopyWithImpl<$Res>
    implements _$$LxdTpmConfigCopyWith<$Res> {
  __$$LxdTpmConfigCopyWithImpl(
      _$LxdTpmConfig _value, $Res Function(_$LxdTpmConfig) _then)
      : super(_value, (v) => _then(v as _$LxdTpmConfig));

  @override
  _$LxdTpmConfig get _value => super._value as _$LxdTpmConfig;
}

/// @nodoc
@JsonSerializable()
class _$LxdTpmConfig implements LxdTpmConfig {
  const _$LxdTpmConfig({final String? $type}) : $type = $type ?? 'tpm';

  factory _$LxdTpmConfig.fromJson(Map<String, dynamic> json) =>
      _$$LxdTpmConfigFromJson(json);

  @JsonKey(name: 'type')
  final String $type;

  @override
  String toString() {
    return 'LxdDeviceConfig.tpm()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LxdTpmConfig);
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() none,
    required TResult Function() nic,
    required TResult Function(String source, String path) disk,
    required TResult Function() unixChar,
    required TResult Function() unixBlock,
    required TResult Function() usb,
    required TResult Function() gpu,
    required TResult Function() infiniband,
    required TResult Function() proxy,
    required TResult Function() unixHotplug,
    required TResult Function() tpm,
    required TResult Function() pci,
  }) {
    return tpm();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? none,
    TResult Function()? nic,
    TResult Function(String source, String path)? disk,
    TResult Function()? unixChar,
    TResult Function()? unixBlock,
    TResult Function()? usb,
    TResult Function()? gpu,
    TResult Function()? infiniband,
    TResult Function()? proxy,
    TResult Function()? unixHotplug,
    TResult Function()? tpm,
    TResult Function()? pci,
  }) {
    return tpm?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? none,
    TResult Function()? nic,
    TResult Function(String source, String path)? disk,
    TResult Function()? unixChar,
    TResult Function()? unixBlock,
    TResult Function()? usb,
    TResult Function()? gpu,
    TResult Function()? infiniband,
    TResult Function()? proxy,
    TResult Function()? unixHotplug,
    TResult Function()? tpm,
    TResult Function()? pci,
    required TResult orElse(),
  }) {
    if (tpm != null) {
      return tpm();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LxdNoConfig value) none,
    required TResult Function(LxdNicConfig value) nic,
    required TResult Function(LxdDiskConfig value) disk,
    required TResult Function(LxdUnixCharConfig value) unixChar,
    required TResult Function(LxdUnixBlockConfig value) unixBlock,
    required TResult Function(LxdUsbConfig value) usb,
    required TResult Function(LxdGpuConfig value) gpu,
    required TResult Function(LxdInfinibandConfig value) infiniband,
    required TResult Function(LxdProxyConfig value) proxy,
    required TResult Function(LxdUnixHotplugConfig value) unixHotplug,
    required TResult Function(LxdTpmConfig value) tpm,
    required TResult Function(LxdPciConfig value) pci,
  }) {
    return tpm(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(LxdNoConfig value)? none,
    TResult Function(LxdNicConfig value)? nic,
    TResult Function(LxdDiskConfig value)? disk,
    TResult Function(LxdUnixCharConfig value)? unixChar,
    TResult Function(LxdUnixBlockConfig value)? unixBlock,
    TResult Function(LxdUsbConfig value)? usb,
    TResult Function(LxdGpuConfig value)? gpu,
    TResult Function(LxdInfinibandConfig value)? infiniband,
    TResult Function(LxdProxyConfig value)? proxy,
    TResult Function(LxdUnixHotplugConfig value)? unixHotplug,
    TResult Function(LxdTpmConfig value)? tpm,
    TResult Function(LxdPciConfig value)? pci,
  }) {
    return tpm?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LxdNoConfig value)? none,
    TResult Function(LxdNicConfig value)? nic,
    TResult Function(LxdDiskConfig value)? disk,
    TResult Function(LxdUnixCharConfig value)? unixChar,
    TResult Function(LxdUnixBlockConfig value)? unixBlock,
    TResult Function(LxdUsbConfig value)? usb,
    TResult Function(LxdGpuConfig value)? gpu,
    TResult Function(LxdInfinibandConfig value)? infiniband,
    TResult Function(LxdProxyConfig value)? proxy,
    TResult Function(LxdUnixHotplugConfig value)? unixHotplug,
    TResult Function(LxdTpmConfig value)? tpm,
    TResult Function(LxdPciConfig value)? pci,
    required TResult orElse(),
  }) {
    if (tpm != null) {
      return tpm(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$LxdTpmConfigToJson(this);
  }
}

abstract class LxdTpmConfig implements LxdDeviceConfig {
  const factory LxdTpmConfig() = _$LxdTpmConfig;

  factory LxdTpmConfig.fromJson(Map<String, dynamic> json) =
      _$LxdTpmConfig.fromJson;
}

/// @nodoc
abstract class _$$LxdPciConfigCopyWith<$Res> {
  factory _$$LxdPciConfigCopyWith(
          _$LxdPciConfig value, $Res Function(_$LxdPciConfig) then) =
      __$$LxdPciConfigCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LxdPciConfigCopyWithImpl<$Res>
    extends _$LxdDeviceConfigCopyWithImpl<$Res>
    implements _$$LxdPciConfigCopyWith<$Res> {
  __$$LxdPciConfigCopyWithImpl(
      _$LxdPciConfig _value, $Res Function(_$LxdPciConfig) _then)
      : super(_value, (v) => _then(v as _$LxdPciConfig));

  @override
  _$LxdPciConfig get _value => super._value as _$LxdPciConfig;
}

/// @nodoc
@JsonSerializable()
class _$LxdPciConfig implements LxdPciConfig {
  const _$LxdPciConfig({final String? $type}) : $type = $type ?? 'pci';

  factory _$LxdPciConfig.fromJson(Map<String, dynamic> json) =>
      _$$LxdPciConfigFromJson(json);

  @JsonKey(name: 'type')
  final String $type;

  @override
  String toString() {
    return 'LxdDeviceConfig.pci()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LxdPciConfig);
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() none,
    required TResult Function() nic,
    required TResult Function(String source, String path) disk,
    required TResult Function() unixChar,
    required TResult Function() unixBlock,
    required TResult Function() usb,
    required TResult Function() gpu,
    required TResult Function() infiniband,
    required TResult Function() proxy,
    required TResult Function() unixHotplug,
    required TResult Function() tpm,
    required TResult Function() pci,
  }) {
    return pci();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? none,
    TResult Function()? nic,
    TResult Function(String source, String path)? disk,
    TResult Function()? unixChar,
    TResult Function()? unixBlock,
    TResult Function()? usb,
    TResult Function()? gpu,
    TResult Function()? infiniband,
    TResult Function()? proxy,
    TResult Function()? unixHotplug,
    TResult Function()? tpm,
    TResult Function()? pci,
  }) {
    return pci?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? none,
    TResult Function()? nic,
    TResult Function(String source, String path)? disk,
    TResult Function()? unixChar,
    TResult Function()? unixBlock,
    TResult Function()? usb,
    TResult Function()? gpu,
    TResult Function()? infiniband,
    TResult Function()? proxy,
    TResult Function()? unixHotplug,
    TResult Function()? tpm,
    TResult Function()? pci,
    required TResult orElse(),
  }) {
    if (pci != null) {
      return pci();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LxdNoConfig value) none,
    required TResult Function(LxdNicConfig value) nic,
    required TResult Function(LxdDiskConfig value) disk,
    required TResult Function(LxdUnixCharConfig value) unixChar,
    required TResult Function(LxdUnixBlockConfig value) unixBlock,
    required TResult Function(LxdUsbConfig value) usb,
    required TResult Function(LxdGpuConfig value) gpu,
    required TResult Function(LxdInfinibandConfig value) infiniband,
    required TResult Function(LxdProxyConfig value) proxy,
    required TResult Function(LxdUnixHotplugConfig value) unixHotplug,
    required TResult Function(LxdTpmConfig value) tpm,
    required TResult Function(LxdPciConfig value) pci,
  }) {
    return pci(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(LxdNoConfig value)? none,
    TResult Function(LxdNicConfig value)? nic,
    TResult Function(LxdDiskConfig value)? disk,
    TResult Function(LxdUnixCharConfig value)? unixChar,
    TResult Function(LxdUnixBlockConfig value)? unixBlock,
    TResult Function(LxdUsbConfig value)? usb,
    TResult Function(LxdGpuConfig value)? gpu,
    TResult Function(LxdInfinibandConfig value)? infiniband,
    TResult Function(LxdProxyConfig value)? proxy,
    TResult Function(LxdUnixHotplugConfig value)? unixHotplug,
    TResult Function(LxdTpmConfig value)? tpm,
    TResult Function(LxdPciConfig value)? pci,
  }) {
    return pci?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LxdNoConfig value)? none,
    TResult Function(LxdNicConfig value)? nic,
    TResult Function(LxdDiskConfig value)? disk,
    TResult Function(LxdUnixCharConfig value)? unixChar,
    TResult Function(LxdUnixBlockConfig value)? unixBlock,
    TResult Function(LxdUsbConfig value)? usb,
    TResult Function(LxdGpuConfig value)? gpu,
    TResult Function(LxdInfinibandConfig value)? infiniband,
    TResult Function(LxdProxyConfig value)? proxy,
    TResult Function(LxdUnixHotplugConfig value)? unixHotplug,
    TResult Function(LxdTpmConfig value)? tpm,
    TResult Function(LxdPciConfig value)? pci,
    required TResult orElse(),
  }) {
    if (pci != null) {
      return pci(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$LxdPciConfigToJson(this);
  }
}

abstract class LxdPciConfig implements LxdDeviceConfig {
  const factory LxdPciConfig() = _$LxdPciConfig;

  factory LxdPciConfig.fromJson(Map<String, dynamic> json) =
      _$LxdPciConfig.fromJson;
}
