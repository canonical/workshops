// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'resource.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_LxdCpuResources _$$_LxdCpuResourcesFromJson(Map json) => _$_LxdCpuResources(
      architecture: json['architecture'] as String,
      sockets:
          (json['sockets'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$$_LxdCpuResourcesToJson(_$_LxdCpuResources instance) =>
    <String, dynamic>{
      'architecture': instance.architecture,
      'sockets': instance.sockets,
    };

_$_LxdMemoryResources _$$_LxdMemoryResourcesFromJson(Map json) =>
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

_$_LxdGpuResources _$$_LxdGpuResourcesFromJson(Map json) => _$_LxdGpuResources(
      cards: (json['cards'] as List<dynamic>)
          .map((e) => LxdGpuCard.fromJson(Map<String, dynamic>.from(e as Map)))
          .toList(),
    );

Map<String, dynamic> _$$_LxdGpuResourcesToJson(_$_LxdGpuResources instance) =>
    <String, dynamic>{
      'cards': instance.cards.map((e) => e.toJson()).toList(),
    };

_$_LxdGpuCard _$$_LxdGpuCardFromJson(Map json) => _$_LxdGpuCard(
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

_$_LXdNetworkResources _$$_LXdNetworkResourcesFromJson(Map json) =>
    _$_LXdNetworkResources(
      cards: (json['cards'] as List<dynamic>)
          .map((e) =>
              LxdNetworkCard.fromJson(Map<String, dynamic>.from(e as Map)))
          .toList(),
    );

Map<String, dynamic> _$$_LXdNetworkResourcesToJson(
        _$_LXdNetworkResources instance) =>
    <String, dynamic>{
      'cards': instance.cards.map((e) => e.toJson()).toList(),
    };

_$_LxdNetworkCard _$$_LxdNetworkCardFromJson(Map json) => _$_LxdNetworkCard(
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

_$_LxdStorageResources _$$_LxdStorageResourcesFromJson(Map json) =>
    _$_LxdStorageResources(
      disks: (json['disks'] as List<dynamic>)
          .map((e) =>
              LxdStorageDisk.fromJson(Map<String, dynamic>.from(e as Map)))
          .toList(),
    );

Map<String, dynamic> _$$_LxdStorageResourcesToJson(
        _$_LxdStorageResources instance) =>
    <String, dynamic>{
      'disks': instance.disks.map((e) => e.toJson()).toList(),
    };

_$_LxdStorageDisk _$$_LxdStorageDiskFromJson(Map json) => _$_LxdStorageDisk(
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

_$_LxdUsbResources _$$_LxdUsbResourcesFromJson(Map json) => _$_LxdUsbResources(
      devices: (json['devices'] as List<dynamic>)
          .map(
              (e) => LxdUsbDevice.fromJson(Map<String, dynamic>.from(e as Map)))
          .toList(),
    );

Map<String, dynamic> _$$_LxdUsbResourcesToJson(_$_LxdUsbResources instance) =>
    <String, dynamic>{
      'devices': instance.devices.map((e) => e.toJson()).toList(),
    };

_$_LxdUsbDevice _$$_LxdUsbDeviceFromJson(Map json) => _$_LxdUsbDevice(
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

_$_LxdPciResources _$$_LxdPciResourcesFromJson(Map json) => _$_LxdPciResources(
      devices: (json['devices'] as List<dynamic>)
          .map(
              (e) => LxdPciDevice.fromJson(Map<String, dynamic>.from(e as Map)))
          .toList(),
    );

Map<String, dynamic> _$$_LxdPciResourcesToJson(_$_LxdPciResources instance) =>
    <String, dynamic>{
      'devices': instance.devices.map((e) => e.toJson()).toList(),
    };

_$_LxdPciDevice _$$_LxdPciDeviceFromJson(Map json) => _$_LxdPciDevice(
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

_$_LxdFirmware _$$_LxdFirmwareFromJson(Map json) => _$_LxdFirmware(
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

_$_LxdChassis _$$_LxdChassisFromJson(Map json) => _$_LxdChassis(
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

_$_LxdMotherboard _$$_LxdMotherboardFromJson(Map json) => _$_LxdMotherboard(
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

_$_LxdSystemResources _$$_LxdSystemResourcesFromJson(Map json) =>
    _$_LxdSystemResources(
      uuid: json['uuid'] as String,
      vendor: json['vendor'] as String,
      product: json['product'] as String,
      family: json['family'] as String,
      version: json['version'] as String,
      sku: json['sku'] as String,
      serial: json['serial'] as String,
      type: json['type'] as String,
      firmware: LxdFirmware.fromJson(
          Map<String, dynamic>.from(json['firmware'] as Map)),
      chassis: LxdChassis.fromJson(
          Map<String, dynamic>.from(json['chassis'] as Map)),
      motherboard: LxdMotherboard.fromJson(
          Map<String, dynamic>.from(json['motherboard'] as Map)),
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

_$_LxdResources _$$_LxdResourcesFromJson(Map json) => _$_LxdResources(
      cpu: LxdCpuResources.fromJson(
          Map<String, dynamic>.from(json['cpu'] as Map)),
      memory: LxdMemoryResources.fromJson(
          Map<String, dynamic>.from(json['memory'] as Map)),
      gpu: LxdGpuResources.fromJson(
          Map<String, dynamic>.from(json['gpu'] as Map)),
      network: LXdNetworkResources.fromJson(
          Map<String, dynamic>.from(json['network'] as Map)),
      storage: LxdStorageResources.fromJson(
          Map<String, dynamic>.from(json['storage'] as Map)),
      usb: LxdUsbResources.fromJson(
          Map<String, dynamic>.from(json['usb'] as Map)),
      pci: LxdPciResources.fromJson(
          Map<String, dynamic>.from(json['pci'] as Map)),
      system: LxdSystemResources.fromJson(
          Map<String, dynamic>.from(json['system'] as Map)),
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
