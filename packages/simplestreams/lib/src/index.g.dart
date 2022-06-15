// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'index.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SimpleStream _$$_SimpleStreamFromJson(Map<String, dynamic> json) =>
    _$_SimpleStream(
      format: json['format'] as String,
      index: (json['index'] as Map<String, dynamic>).map(
        (k, e) =>
            MapEntry(k, SimpleStreamIndex.fromJson(e as Map<String, dynamic>)),
      ),
      updated: const DateTimeConverter().fromJson(json['updated'] as String?),
    );

Map<String, dynamic> _$$_SimpleStreamToJson(_$_SimpleStream instance) =>
    <String, dynamic>{
      'format': instance.format,
      'index': instance.index.map((k, e) => MapEntry(k, e.toJson())),
      'updated': const DateTimeConverter().toJson(instance.updated),
    };

_$_SimpleStreamIndex _$$_SimpleStreamIndexFromJson(Map<String, dynamic> json) =>
    _$_SimpleStreamIndex(
      datatype: json['datatype'] as String,
      format: json['format'] as String?,
      path: json['path'] as String,
      products:
          (json['products'] as List<dynamic>).map((e) => e as String).toList(),
      updated: const DateTimeConverter().fromJson(json['updated'] as String?),
    );

Map<String, dynamic> _$$_SimpleStreamIndexToJson(
        _$_SimpleStreamIndex instance) =>
    <String, dynamic>{
      'datatype': instance.datatype,
      'format': instance.format,
      'path': instance.path,
      'products': instance.products,
      'updated': const DateTimeConverter().toJson(instance.updated),
    };
