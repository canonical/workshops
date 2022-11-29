// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'resource.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_LxdCpuResources _$$_LxdCpuResourcesFromJson(Map<String, dynamic> json) =>
    _$_LxdCpuResources(
      architecture: json['architecture'] as String,
      sockets:
          (json['sockets'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$$_LxdCpuResourcesToJson(_$_LxdCpuResources instance) =>
    <String, dynamic>{
      'architecture': instance.architecture,
      'sockets': instance.sockets,
    };

_$_LxdMemoryResources _$$_LxdMemoryResourcesFromJson(
        Map<String, dynamic> json) =>
    _$_LxdMemoryResources(
      used: json['used'] as int,
      total: json['total'] as int,
    );

Map<String, dynamic> _$$_LxdMemoryResourcesToJson(
        _$_LxdMemoryResources instance) =>
    <String, dynamic>{
      'used': instance.used,
      'total': instance.total,
    };

_$_LxdGpuResources _$$_LxdGpuResourcesFromJson(Map<String, dynamic> json) =>
    _$_LxdGpuResources(
      cards: (json['cards'] as List<dynamic>)
          .map((e) => LxdGpuCard.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_LxdGpuResourcesToJson(_$_LxdGpuResources instance) =>
    <String, dynamic>{
      'cards': instance.cards.map((e) => e.toJson()).toList(),
    };

_$_LxdGpuCard _$$_LxdGpuCardFromJson(Map<String, dynamic> json) =>
    _$_LxdGpuCard(
      driver: json['driver'] as String,
      driverVersion: json['driver_version'] as String,
      vendor: json['vendor'] as String,
      vendorId: json['vendor_id'] as String,
    );

Map<String, dynamic> _$$_LxdGpuCardToJson(_$_LxdGpuCard instance) =>
    <String, dynamic>{
      'driver': instance.driver,
      'driver_version': instance.driverVersion,
      'vendor': instance.vendor,
      'vendor_id': instance.vendorId,
    };

_$_LXdNetworkResources _$$_LXdNetworkResourcesFromJson(
        Map<String, dynamic> json) =>
    _$_LXdNetworkResources(
      cards: (json['cards'] as List<dynamic>)
          .map((e) => LxdNetworkCard.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_LXdNetworkResourcesToJson(
        _$_LXdNetworkResources instance) =>
    <String, dynamic>{
      'cards': instance.cards.map((e) => e.toJson()).toList(),
    };

_$_LxdNetworkCard _$$_LxdNetworkCardFromJson(Map<String, dynamic> json) =>
    _$_LxdNetworkCard(
      driver: json['driver'] as String,
      driverVersion: json['driver_version'] as String,
      vendor: json['vendor'] as String,
      vendorId: json['vendor_id'] as String,
    );

Map<String, dynamic> _$$_LxdNetworkCardToJson(_$_LxdNetworkCard instance) =>
    <String, dynamic>{
      'driver': instance.driver,
      'driver_version': instance.driverVersion,
      'vendor': instance.vendor,
      'vendor_id': instance.vendorId,
    };

_$_LxdStorageResources _$$_LxdStorageResourcesFromJson(
        Map<String, dynamic> json) =>
    _$_LxdStorageResources(
      disks: (json['disks'] as List<dynamic>)
          .map((e) => LxdStorageDisk.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_LxdStorageResourcesToJson(
        _$_LxdStorageResources instance) =>
    <String, dynamic>{
      'disks': instance.disks.map((e) => e.toJson()).toList(),
    };

_$_LxdStorageDisk _$$_LxdStorageDiskFromJson(Map<String, dynamic> json) =>
    _$_LxdStorageDisk(
      id: json['id'] as String,
      model: json['model'] as String,
      serial: json['serial'] as String,
      size: json['size'] as int,
      type: json['type'] as String,
    );

Map<String, dynamic> _$$_LxdStorageDiskToJson(_$_LxdStorageDisk instance) =>
    <String, dynamic>{
      'id': instance.id,
      'model': instance.model,
      'serial': instance.serial,
      'size': instance.size,
      'type': instance.type,
    };

_$_LxdUsbResources _$$_LxdUsbResourcesFromJson(Map<String, dynamic> json) =>
    _$_LxdUsbResources(
      devices: (json['devices'] as List<dynamic>)
          .map((e) => LxdUsbDevice.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_LxdUsbResourcesToJson(_$_LxdUsbResources instance) =>
    <String, dynamic>{
      'devices': instance.devices.map((e) => e.toJson()).toList(),
    };

_$_LxdUsbDevice _$$_LxdUsbDeviceFromJson(Map<String, dynamic> json) =>
    _$_LxdUsbDevice(
      busAddress: json['bus_address'] as int,
      deviceAddress: json['device_address'] as int,
      product: json['product'] as String,
      productId: json['product_id'] as String,
      speed: (json['speed'] as num).toDouble(),
      vendor: json['vendor'] as String,
      vendorId: json['vendor_id'] as String,
    );

Map<String, dynamic> _$$_LxdUsbDeviceToJson(_$_LxdUsbDevice instance) =>
    <String, dynamic>{
      'bus_address': instance.busAddress,
      'device_address': instance.deviceAddress,
      'product': instance.product,
      'product_id': instance.productId,
      'speed': instance.speed,
      'vendor': instance.vendor,
      'vendor_id': instance.vendorId,
    };

_$_LxdPciResources _$$_LxdPciResourcesFromJson(Map<String, dynamic> json) =>
    _$_LxdPciResources(
      devices: (json['devices'] as List<dynamic>)
          .map((e) => LxdPciDevice.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_LxdPciResourcesToJson(_$_LxdPciResources instance) =>
    <String, dynamic>{
      'devices': instance.devices.map((e) => e.toJson()).toList(),
    };

_$_LxdPciDevice _$$_LxdPciDeviceFromJson(Map<String, dynamic> json) =>
    _$_LxdPciDevice(
      driver: json['driver'] as String,
      driverVersion: json['driver_version'] as String,
      pciAddress: json['pci_address'] as String,
      product: json['product'] as String,
      productId: json['product_id'] as String,
      vendor: json['vendor'] as String,
      vendorId: json['vendor_id'] as String,
    );

Map<String, dynamic> _$$_LxdPciDeviceToJson(_$_LxdPciDevice instance) =>
    <String, dynamic>{
      'driver': instance.driver,
      'driver_version': instance.driverVersion,
      'pci_address': instance.pciAddress,
      'product': instance.product,
      'product_id': instance.productId,
      'vendor': instance.vendor,
      'vendor_id': instance.vendorId,
    };

_$_LxdFirmware _$$_LxdFirmwareFromJson(Map<String, dynamic> json) =>
    _$_LxdFirmware(
      date: json['date'] as String,
      vendor: json['vendor'] as String,
      version: json['version'] as String,
    );

Map<String, dynamic> _$$_LxdFirmwareToJson(_$_LxdFirmware instance) =>
    <String, dynamic>{
      'date': instance.date,
      'vendor': instance.vendor,
      'version': instance.version,
    };

_$_LxdChassis _$$_LxdChassisFromJson(Map<String, dynamic> json) =>
    _$_LxdChassis(
      serial: json['serial'] as String,
      type: json['type'] as String,
      vendor: json['vendor'] as String,
      version: json['version'] as String,
    );

Map<String, dynamic> _$$_LxdChassisToJson(_$_LxdChassis instance) =>
    <String, dynamic>{
      'serial': instance.serial,
      'type': instance.type,
      'vendor': instance.vendor,
      'version': instance.version,
    };

_$_LxdMotherboard _$$_LxdMotherboardFromJson(Map<String, dynamic> json) =>
    _$_LxdMotherboard(
      product: json['product'] as String,
      serial: json['serial'] as String,
      vendor: json['vendor'] as String,
      version: json['version'] as String,
    );

Map<String, dynamic> _$$_LxdMotherboardToJson(_$_LxdMotherboard instance) =>
    <String, dynamic>{
      'product': instance.product,
      'serial': instance.serial,
      'vendor': instance.vendor,
      'version': instance.version,
    };

_$_LxdSystemResources _$$_LxdSystemResourcesFromJson(
        Map<String, dynamic> json) =>
    _$_LxdSystemResources(
      uuid: json['uuid'] as String,
      vendor: json['vendor'] as String,
      product: json['product'] as String,
      family: json['family'] as String,
      version: json['version'] as String,
      sku: json['sku'] as String,
      serial: json['serial'] as String,
      type: json['type'] as String,
      firmware: LxdFirmware.fromJson(json['firmware'] as Map<String, dynamic>),
      chassis: LxdChassis.fromJson(json['chassis'] as Map<String, dynamic>),
      motherboard:
          LxdMotherboard.fromJson(json['motherboard'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_LxdSystemResourcesToJson(
        _$_LxdSystemResources instance) =>
    <String, dynamic>{
      'uuid': instance.uuid,
      'vendor': instance.vendor,
      'product': instance.product,
      'family': instance.family,
      'version': instance.version,
      'sku': instance.sku,
      'serial': instance.serial,
      'type': instance.type,
      'firmware': instance.firmware.toJson(),
      'chassis': instance.chassis.toJson(),
      'motherboard': instance.motherboard.toJson(),
    };

_$_LxdResources _$$_LxdResourcesFromJson(Map<String, dynamic> json) =>
    _$_LxdResources(
      cpu: LxdCpuResources.fromJson(json['cpu'] as Map<String, dynamic>),
      memory:
          LxdMemoryResources.fromJson(json['memory'] as Map<String, dynamic>),
      gpu: LxdGpuResources.fromJson(json['gpu'] as Map<String, dynamic>),
      network:
          LXdNetworkResources.fromJson(json['network'] as Map<String, dynamic>),
      storage:
          LxdStorageResources.fromJson(json['storage'] as Map<String, dynamic>),
      usb: LxdUsbResources.fromJson(json['usb'] as Map<String, dynamic>),
      pci: LxdPciResources.fromJson(json['pci'] as Map<String, dynamic>),
      system:
          LxdSystemResources.fromJson(json['system'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_LxdResourcesToJson(_$_LxdResources instance) =>
    <String, dynamic>{
      'cpu': instance.cpu.toJson(),
      'memory': instance.memory.toJson(),
      'gpu': instance.gpu.toJson(),
      'network': instance.network.toJson(),
      'storage': instance.storage.toJson(),
      'usb': instance.usb.toJson(),
      'pci': instance.pci.toJson(),
      'system': instance.system.toJson(),
    };
