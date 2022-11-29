// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LxdSyncResponse _$$LxdSyncResponseFromJson(Map<String, dynamic> json) =>
    _$LxdSyncResponse(
      status: json['status'] as String,
      statusCode: json['status_code'] as int,
      metadata: json['metadata'],
      $type: json['type'] as String?,
    );

Map<String, dynamic> _$$LxdSyncResponseToJson(_$LxdSyncResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'status_code': instance.statusCode,
      'metadata': instance.metadata,
      'type': instance.$type,
    };

_$LxdAsyncResponse _$$LxdAsyncResponseFromJson(Map<String, dynamic> json) =>
    _$LxdAsyncResponse(
      status: json['status'] as String,
      statusCode: json['status_code'] as int,
      operation: json['operation'] as String,
      metadata: json['metadata'] as Map<String, dynamic>,
      $type: json['type'] as String?,
    );

Map<String, dynamic> _$$LxdAsyncResponseToJson(_$LxdAsyncResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'status_code': instance.statusCode,
      'operation': instance.operation,
      'metadata': instance.metadata,
      'type': instance.$type,
    };

_$LxdErrorResponse _$$LxdErrorResponseFromJson(Map<String, dynamic> json) =>
    _$LxdErrorResponse(
      error: json['error'] as String,
      errorCode: json['error_code'] as int,
      metadata: json['metadata'] as Map<String, dynamic>?,
      $type: json['type'] as String?,
    );

Map<String, dynamic> _$$LxdErrorResponseToJson(_$LxdErrorResponse instance) =>
    <String, dynamic>{
      'error': instance.error,
      'error_code': instance.errorCode,
      'metadata': instance.metadata,
      'type': instance.$type,
    };
