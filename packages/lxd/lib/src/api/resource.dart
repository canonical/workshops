// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'resource.freezed.dart';
part 'resource.g.dart';

@freezed
class LxdCpuResources with _$LxdCpuResources {
  const factory LxdCpuResources({
    required String architecture,
    required List<String> sockets,
  }) = _LxdCpuResources;

  factory LxdCpuResources.fromJson(Map<String, dynamic> json) =>
      _$LxdCpuResourcesFromJson(json);
}

@freezed
class LxdMemoryResources with _$LxdMemoryResources {
  const factory LxdMemoryResources({
    required int used,
    required int total,
  }) = _LxdMemoryResources;

  factory LxdMemoryResources.fromJson(Map<String, dynamic> json) =>
      _$LxdMemoryResourcesFromJson(json);
}

@freezed
class LxdGpuResources with _$LxdGpuResources {
  const factory LxdGpuResources({
    required List<LxdGpuCard> cards,
  }) = _LxdGpuResources;

  factory LxdGpuResources.fromJson(Map<String, dynamic> json) =>
      _$LxdGpuResourcesFromJson(json);
}

@freezed
class LxdGpuCard with _$LxdGpuCard {
  const factory LxdGpuCard({
    required String driver,
    required String driverVersion,
    required String vendor,
    required String vendorId,
  }) = _LxdGpuCard;

  factory LxdGpuCard.fromJson(Map<String, dynamic> json) =>
      _$LxdGpuCardFromJson(json);
}

@freezed
class LXdNetworkResources with _$LXdNetworkResources {
  const factory LXdNetworkResources({
    required List<LxdNetworkCard> cards,
  }) = _LXdNetworkResources;

  factory LXdNetworkResources.fromJson(Map<String, dynamic> json) =>
      _$LXdNetworkResourcesFromJson(json);
}

@freezed
class LxdNetworkCard with _$LxdNetworkCard {
  const factory LxdNetworkCard({
    required String driver,
    required String driverVersion,
    required String vendor,
    required String vendorId,
  }) = _LxdNetworkCard;

  factory LxdNetworkCard.fromJson(Map<String, dynamic> json) =>
      _$LxdNetworkCardFromJson(json);
}

@freezed
class LxdStorageResources with _$LxdStorageResources {
  const factory LxdStorageResources({
    required List<LxdStorageDisk> disks,
  }) = _LxdStorageResources;

  factory LxdStorageResources.fromJson(Map<String, dynamic> json) =>
      _$LxdStorageResourcesFromJson(json);
}

@freezed
class LxdStorageDisk with _$LxdStorageDisk {
  const factory LxdStorageDisk({
    required String id,
    required String model,
    required String serial,
    required int size,
    required String type,
  }) = _LxdStorageDisk;

  factory LxdStorageDisk.fromJson(Map<String, dynamic> json) =>
      _$LxdStorageDiskFromJson(json);
}

@freezed
class LxdUsbResources with _$LxdUsbResources {
  const factory LxdUsbResources({
    required List<LxdUsbDevice> devices,
  }) = _LxdUsbResources;

  factory LxdUsbResources.fromJson(Map<String, dynamic> json) =>
      _$LxdUsbResourcesFromJson(json);
}

@freezed
class LxdUsbDevice with _$LxdUsbDevice {
  const factory LxdUsbDevice({
    required int busAddress,
    required int deviceAddress,
    required String product,
    required String productId,
    required double speed,
    required String vendor,
    required String vendorId,
  }) = _LxdUsbDevice;

  factory LxdUsbDevice.fromJson(Map<String, dynamic> json) =>
      _$LxdUsbDeviceFromJson(json);
}

@freezed
class LxdPciResources with _$LxdPciResources {
  const factory LxdPciResources({
    required List<LxdPciDevice> devices,
  }) = _LxdPciResources;

  factory LxdPciResources.fromJson(Map<String, dynamic> json) =>
      _$LxdPciResourcesFromJson(json);
}

@freezed
class LxdPciDevice with _$LxdPciDevice {
  const factory LxdPciDevice({
    required String driver,
    required String driverVersion,
    required String pciAddress,
    required String product,
    required String productId,
    required String vendor,
    required String vendorId,
  }) = _LxdPciDevice;

  factory LxdPciDevice.fromJson(Map<String, dynamic> json) =>
      _$LxdPciDeviceFromJson(json);
}

@freezed
class LxdFirmware with _$LxdFirmware {
  const factory LxdFirmware({
    required String date,
    required String vendor,
    required String version,
  }) = _LxdFirmware;

  factory LxdFirmware.fromJson(Map<String, dynamic> json) =>
      _$LxdFirmwareFromJson(json);
}

@freezed
class LxdChassis with _$LxdChassis {
  const factory LxdChassis({
    required String serial,
    required String type,
    required String vendor,
    required String version,
  }) = _LxdChassis;

  factory LxdChassis.fromJson(Map<String, dynamic> json) =>
      _$LxdChassisFromJson(json);
}

@freezed
class LxdMotherboard with _$LxdMotherboard {
  const factory LxdMotherboard({
    required String product,
    required String serial,
    required String vendor,
    required String version,
  }) = _LxdMotherboard;

  factory LxdMotherboard.fromJson(Map<String, dynamic> json) =>
      _$LxdMotherboardFromJson(json);
}

@freezed
class LxdSystemResources with _$LxdSystemResources {
  const factory LxdSystemResources({
    required String uuid,
    required String vendor,
    required String product,
    required String family,
    required String version,
    required String sku,
    required String serial,
    required String type,
    required LxdFirmware firmware,
    required LxdChassis chassis,
    required LxdMotherboard motherboard,
  }) = _LxdSystemResources;

  factory LxdSystemResources.fromJson(Map<String, dynamic> json) =>
      _$LxdSystemResourcesFromJson(json);
}

@freezed
class LxdResources with _$LxdResources {
  const factory LxdResources({
    required LxdCpuResources cpu,
    required LxdMemoryResources memory,
    required LxdGpuResources gpu,
    required LXdNetworkResources network,
    required LxdStorageResources storage,
    required LxdUsbResources usb,
    required LxdPciResources pci,
    required LxdSystemResources system,
  }) = _LxdResources;

  factory LxdResources.fromJson(Map<String, dynamic> json) =>
      _$LxdResourcesFromJson(json);
}
