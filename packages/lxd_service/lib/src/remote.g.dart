// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_LxdRemote _$$_LxdRemoteFromJson(Map<String, dynamic> json) => _$_LxdRemote(
      name: json['name'] as String,
      address: json['address'] as String,
      isStatic: json['isStatic'] ?? false,
      isPublic: json['isPublic'] ?? true,
      protocol: json['protocol'] as String?,
    );

Map<String, dynamic> _$$_LxdRemoteToJson(_$_LxdRemote instance) =>
    <String, dynamic>{
      'name': instance.name,
      'address': instance.address,
      'isStatic': instance.isStatic,
      'isPublic': instance.isPublic,
      'protocol': instance.protocol,
    };
