// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'instance.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_LxdInstance _$$_LxdInstanceFromJson(Map<String, dynamic> json) =>
    _$_LxdInstance(
      architecture: json['architecture'] as String,
      config: Map<String, String>.from(json['config'] as Map),
      devices: (json['devices'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(k, Map<String, String>.from(e as Map)),
      ),
      ephemeral: json['ephemeral'] as bool,
      profiles:
          (json['profiles'] as List<dynamic>).map((e) => e as String).toList(),
      restore: json['restore'] as String?,
      stateful: json['stateful'] as bool,
      description: json['description'] as String,
      createdAt: DateTime.parse(json['created_at'] as String),
      expandedConfig: (json['expanded_config'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as String),
      ),
      expandedDevices: (json['expanded_devices'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, Map<String, String>.from(e as Map)),
      ),
      name: json['name'] as String,
      status: json['status'] as String,
      statusCode: json['status_code'] as int,
      lastUsedAt: DateTime.parse(json['last_used_at'] as String),
      location: json['location'] as String,
      type: $enumDecode(_$LxdInstanceTypeEnumMap, json['type']),
      project: json['project'] as String,
    );

Map<String, dynamic> _$$_LxdInstanceToJson(_$_LxdInstance instance) {
  final val = <String, dynamic>{
    'architecture': instance.architecture,
    'config': instance.config,
    'devices': instance.devices,
    'ephemeral': instance.ephemeral,
    'profiles': instance.profiles,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('restore', instance.restore);
  val['stateful'] = instance.stateful;
  val['description'] = instance.description;
  val['created_at'] = instance.createdAt.toIso8601String();
  writeNotNull('expanded_config', instance.expandedConfig);
  writeNotNull('expanded_devices', instance.expandedDevices);
  val['name'] = instance.name;
  val['status'] = instance.status;
  val['status_code'] = instance.statusCode;
  val['last_used_at'] = instance.lastUsedAt.toIso8601String();
  val['location'] = instance.location;
  val['type'] = _$LxdInstanceTypeEnumMap[instance.type]!;
  val['project'] = instance.project;
  return val;
}

const _$LxdInstanceTypeEnumMap = {
  LxdInstanceType.container: 'container',
  LxdInstanceType.virtualMachine: 'virtual-machine',
};
