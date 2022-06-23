import 'package:freezed_annotation/freezed_annotation.dart';

part 'device_config.freezed.dart';
part 'device_config.g.dart';

@Freezed(unionKey: 'type', unionValueCase: FreezedUnionCase.pascal)
class LxdDeviceConfig with _$LxdDeviceConfig {
  @FreezedUnionValue('none')
  const factory LxdDeviceConfig.none() = LxdNoConfig;

  @FreezedUnionValue('nic')
  const factory LxdDeviceConfig.nic() = LxdNicConfig;

  @FreezedUnionValue('disk')
  const factory LxdDeviceConfig.disk({
    required String source,
    required String path,
  }) = LxdDiskConfig;

  @FreezedUnionValue('unix-char')
  const factory LxdDeviceConfig.unixChar() = LxdUnixCharConfig;

  @FreezedUnionValue('unix-block')
  const factory LxdDeviceConfig.unixBlock() = LxdUnixBlockConfig;

  @FreezedUnionValue('usb')
  const factory LxdDeviceConfig.usb() = LxdUsbConfig;

  @FreezedUnionValue('gpu')
  const factory LxdDeviceConfig.gpu() = LxdGpuConfig;

  @FreezedUnionValue('infiniband')
  const factory LxdDeviceConfig.infiniband() = LxdInfinibandConfig;

  @FreezedUnionValue('proxy')
  const factory LxdDeviceConfig.proxy() = LxdProxyConfig;

  @FreezedUnionValue('unix-hotplug')
  const factory LxdDeviceConfig.unixHotplug() = LxdUnixHotplugConfig;

  @FreezedUnionValue('tpm')
  const factory LxdDeviceConfig.tpm() = LxdTpmConfig;

  @FreezedUnionValue('pci')
  const factory LxdDeviceConfig.pci() = LxdPciConfig;

  factory LxdDeviceConfig.fromJson(Map<String, dynamic> json) =>
      _$LxdDeviceConfigFromJson(json);
}
