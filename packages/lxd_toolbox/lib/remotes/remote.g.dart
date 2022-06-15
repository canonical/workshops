// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Remote _$$_RemoteFromJson(Map<String, dynamic> json) => _$_Remote(
      name: json['name'] as String,
      address: json['address'] as String,
      isStatic: json['isStatic'] ?? false,
      isPublic: json['isPublic'] ?? true,
      protocol: json['protocol'] as String?,
    );

Map<String, dynamic> _$$_RemoteToJson(_$_Remote instance) => <String, dynamic>{
      'name': instance.name,
      'address': instance.address,
      'isStatic': instance.isStatic,
      'isPublic': instance.isPublic,
      'protocol': instance.protocol,
    };
