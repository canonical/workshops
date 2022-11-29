// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'image.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_LxdImage _$$_LxdImageFromJson(Map<String, dynamic> json) => _$_LxdImage(
      autoUpdate: json['auto_update'] as bool? ?? false,
      properties: (json['properties'] as Map<String, dynamic>?)?.map(
            (k, e) => MapEntry(k, e as String),
          ) ??
          const {},
      public: json['public'] as bool? ?? true,
      expiresAt: DateTime.parse(json['expires_at'] as String),
      profiles: (json['profiles'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      aliases: (json['aliases'] as List<dynamic>?)
              ?.map((e) => LxdImageAlias.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      architecture: json['architecture'] as String,
      cached: json['cached'] as bool? ?? false,
      filename: json['filename'] as String,
      fingerprint: json['fingerprint'] as String,
      size: json['size'] as int,
      updateSource: json['update_source'] == null
          ? null
          : LxdImageSource.fromJson(
              json['update_source'] as Map<String, dynamic>),
      type: $enumDecode(_$LxdImageTypeEnumMap, json['type']),
      createdAt: DateTime.parse(json['created_at'] as String),
      lastUsedAt: json['last_used_at'] == null
          ? null
          : DateTime.parse(json['last_used_at'] as String),
      uploadedAt: DateTime.parse(json['uploaded_at'] as String),
    );

Map<String, dynamic> _$$_LxdImageToJson(_$_LxdImage instance) =>
    <String, dynamic>{
      'auto_update': instance.autoUpdate,
      'properties': instance.properties,
      'public': instance.public,
      'expires_at': instance.expiresAt.toIso8601String(),
      'profiles': instance.profiles,
      'aliases': instance.aliases.map((e) => e.toJson()).toList(),
      'architecture': instance.architecture,
      'cached': instance.cached,
      'filename': instance.filename,
      'fingerprint': instance.fingerprint,
      'size': instance.size,
      'update_source': instance.updateSource?.toJson(),
      'type': _$LxdImageTypeEnumMap[instance.type]!,
      'created_at': instance.createdAt.toIso8601String(),
      'last_used_at': instance.lastUsedAt?.toIso8601String(),
      'uploaded_at': instance.uploadedAt.toIso8601String(),
    };

const _$LxdImageTypeEnumMap = {
  LxdImageType.container: 'container',
  LxdImageType.virtualMachine: 'virtual-machine',
};

_$_LxdImageAlias _$$_LxdImageAliasFromJson(Map<String, dynamic> json) =>
    _$_LxdImageAlias(
      name: json['name'] as String,
      description: json['description'] as String?,
    );

Map<String, dynamic> _$$_LxdImageAliasToJson(_$_LxdImageAlias instance) =>
    <String, dynamic>{
      'name': instance.name,
      'description': instance.description,
    };

_$_LxdImageSource _$$_LxdImageSourceFromJson(Map<String, dynamic> json) =>
    _$_LxdImageSource(
      alias: json['alias'] as String,
      certificate: json['certificate'] as String?,
      protocol: json['protocol'] as String,
      server: json['server'] as String,
      imageType: $enumDecodeNullable(_$LxdImageTypeEnumMap, json['image_type'],
          unknownValue: JsonKey.nullForUndefinedEnumValue),
    );

Map<String, dynamic> _$$_LxdImageSourceToJson(_$_LxdImageSource instance) =>
    <String, dynamic>{
      'alias': instance.alias,
      'certificate': instance.certificate,
      'protocol': instance.protocol,
      'server': instance.server,
      'image_type': _$LxdImageTypeEnumMap[instance.imageType],
    };

_$_LxdImageMetadata _$$_LxdImageMetadataFromJson(Map<String, dynamic> json) =>
    _$_LxdImageMetadata(
      architecture: json['architecture'] as String,
      creationDate: json['creation_date'] as int,
      expiryDate: json['expiry_date'] as int,
      properties: Map<String, String>.from(json['properties'] as Map),
      templates: (json['templates'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(
            k, LxdImageMetadataTemplate.fromJson(e as Map<String, dynamic>)),
      ),
    );

Map<String, dynamic> _$$_LxdImageMetadataToJson(_$_LxdImageMetadata instance) =>
    <String, dynamic>{
      'architecture': instance.architecture,
      'creation_date': instance.creationDate,
      'expiry_date': instance.expiryDate,
      'properties': instance.properties,
      'templates': instance.templates.map((k, e) => MapEntry(k, e.toJson())),
    };

_$_LxdImageMetadataTemplate _$$_LxdImageMetadataTemplateFromJson(
        Map<String, dynamic> json) =>
    _$_LxdImageMetadataTemplate(
      when: (json['when'] as List<dynamic>).map((e) => e as String).toList(),
      createOnly: json['create_only'] as bool,
      template: json['template'] as String,
      properties: Map<String, String>.from(json['properties'] as Map),
    );

Map<String, dynamic> _$$_LxdImageMetadataTemplateToJson(
        _$_LxdImageMetadataTemplate instance) =>
    <String, dynamic>{
      'when': instance.when,
      'create_only': instance.createOnly,
      'template': instance.template,
      'properties': instance.properties,
    };
