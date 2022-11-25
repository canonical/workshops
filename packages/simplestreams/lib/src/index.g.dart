// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'index.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SimpleStream _$SimpleStreamFromJson(Map<String, dynamic> json) => SimpleStream(
      format: json['format'] as String,
      index: (json['index'] as Map<String, dynamic>).map(
        (k, e) =>
            MapEntry(k, SimpleStreamIndex.fromJson(e as Map<String, dynamic>)),
      ),
      updated: const DateTimeConverter().fromJson(json['updated'] as String?),
    );

Map<String, dynamic> _$SimpleStreamToJson(SimpleStream instance) =>
    <String, dynamic>{
      'format': instance.format,
      'index': instance.index.map((k, e) => MapEntry(k, e.toJson())),
      'updated': const DateTimeConverter().toJson(instance.updated),
    };

SimpleStreamIndex _$SimpleStreamIndexFromJson(Map<String, dynamic> json) =>
    SimpleStreamIndex(
      datatype: json['datatype'] as String,
      format: json['format'] as String?,
      path: json['path'] as String,
      products:
          (json['products'] as List<dynamic>).map((e) => e as String).toList(),
      updated: const DateTimeConverter().fromJson(json['updated'] as String?),
    );

Map<String, dynamic> _$SimpleStreamIndexToJson(SimpleStreamIndex instance) =>
    <String, dynamic>{
      'datatype': instance.datatype,
      'format': instance.format,
      'path': instance.path,
      'products': instance.products,
      'updated': const DateTimeConverter().toJson(instance.updated),
    };
