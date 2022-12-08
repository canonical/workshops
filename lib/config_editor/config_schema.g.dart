// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'config_schema.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ConfigSchemaEntry _$$_ConfigSchemaEntryFromJson(Map<String, dynamic> json) =>
    _$_ConfigSchemaEntry(
      defaultValue: json['Default'] as String? ?? '',
      description: json['Description'] as String? ?? '',
      type: json['Type'] as String,
    );

Map<String, dynamic> _$$_ConfigSchemaEntryToJson(
        _$_ConfigSchemaEntry instance) =>
    <String, dynamic>{
      'Default': instance.defaultValue,
      'Description': instance.description,
      'Type': instance.type,
    };
