// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'operation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_LxdOperation _$$_LxdOperationFromJson(Map<String, dynamic> json) =>
    _$_LxdOperation(
      id: json['id'] as String,
      type: $enumDecode(_$LxdOperationTypeEnumMap, json['class']),
      description: json['description'] as String,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
      status: json['status'] as String,
      statusCode: json['status_code'] as int,
      resources: (json['resources'] as Map<String, dynamic>?)?.map(
        (k, e) =>
            MapEntry(k, (e as List<dynamic>).map((e) => e as String).toList()),
      ),
      metadata: json['metadata'] as Map<String, dynamic>?,
      mayCancel: json['may_cancel'] as bool,
      error: json['err'] as String,
      location: json['location'] as String,
    );

Map<String, dynamic> _$$_LxdOperationToJson(_$_LxdOperation instance) =>
    <String, dynamic>{
      'id': instance.id,
      'class': _$LxdOperationTypeEnumMap[instance.type],
      'description': instance.description,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
      'status': instance.status,
      'status_code': instance.statusCode,
      'resources': instance.resources,
      'metadata': instance.metadata,
      'may_cancel': instance.mayCancel,
      'err': instance.error,
      'location': instance.location,
    };

const _$LxdOperationTypeEnumMap = {
  LxdOperationType.task: 'task',
  LxdOperationType.websocket: 'websocket',
  LxdOperationType.token: 'token',
};
