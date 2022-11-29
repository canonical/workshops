// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_LxdEvent _$$_LxdEventFromJson(Map<String, dynamic> json) => _$_LxdEvent(
      type: $enumDecode(_$LxdEventTypeEnumMap, json['type']),
      timestamp: DateTime.parse(json['timestamp'] as String),
      metadata: json['metadata'] as Map<String, dynamic>?,
      location: json['location'] as String?,
      project: json['project'] as String?,
    );

Map<String, dynamic> _$$_LxdEventToJson(_$_LxdEvent instance) =>
    <String, dynamic>{
      'type': _$LxdEventTypeEnumMap[instance.type],
      'timestamp': instance.timestamp.toIso8601String(),
      'metadata': instance.metadata,
      'location': instance.location,
      'project': instance.project,
    };

const _$LxdEventTypeEnumMap = {
  LxdEventType.operation: 'operation',
  LxdEventType.logging: 'logging',
  LxdEventType.lifecycle: 'lifecycle',
};

_$_LxdEventLogging _$$_LxdEventLoggingFromJson(Map<String, dynamic> json) =>
    _$_LxdEventLogging(
      message: json['message'] as String,
      level: json['level'] as String,
      context: Map<String, String>.from(json['context'] as Map),
    );

Map<String, dynamic> _$$_LxdEventLoggingToJson(_$_LxdEventLogging instance) =>
    <String, dynamic>{
      'message': instance.message,
      'level': instance.level,
      'context': instance.context,
    };

_$_LxdEventLifecycle _$$_LxdEventLifecycleFromJson(Map<String, dynamic> json) =>
    _$_LxdEventLifecycle(
      action: json['action'] as String,
      source: json['source'] as String,
      context: json['context'] as Map<String, dynamic>?,
      requestor: json['requestor'] == null
          ? null
          : LxdEventLifecycleRequestor.fromJson(
              json['requestor'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_LxdEventLifecycleToJson(
        _$_LxdEventLifecycle instance) =>
    <String, dynamic>{
      'action': instance.action,
      'source': instance.source,
      'context': instance.context,
      'requestor': instance.requestor?.toJson(),
    };

_$_LxdEventLifecycleRequestor _$$_LxdEventLifecycleRequestorFromJson(
        Map<String, dynamic> json) =>
    _$_LxdEventLifecycleRequestor(
      username: json['username'] as String,
      protocol: json['protocol'] as String,
      address: json['address'] as String,
    );

Map<String, dynamic> _$$_LxdEventLifecycleRequestorToJson(
        _$_LxdEventLifecycleRequestor instance) =>
    <String, dynamic>{
      'username': instance.username,
      'protocol': instance.protocol,
      'address': instance.address,
    };
