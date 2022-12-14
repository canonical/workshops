// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'network_acl.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_LxdNetworkAclRule _$$_LxdNetworkAclRuleFromJson(Map json) =>
    _$_LxdNetworkAclRule(
      action: json['action'] as String,
      source: json['source'] as String?,
      destination: json['destination'] as String?,
      protocol: json['protocol'] as String?,
      sourcePort: json['source_port'] as String?,
      destinationPort: json['destination_port'] as String?,
      icmpType: json['icmp_type'] as String?,
      icmpCode: json['icmp_code'] as String?,
      description: json['description'] as String?,
      state: json['state'] as String,
    );

Map<String, dynamic> _$$_LxdNetworkAclRuleToJson(
    _$_LxdNetworkAclRule instance) {
  final val = <String, dynamic>{
    'action': instance.action,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('source', instance.source);
  writeNotNull('destination', instance.destination);
  writeNotNull('protocol', instance.protocol);
  writeNotNull('source_port', instance.sourcePort);
  writeNotNull('destination_port', instance.destinationPort);
  writeNotNull('icmp_type', instance.icmpType);
  writeNotNull('icmp_code', instance.icmpCode);
  writeNotNull('description', instance.description);
  val['state'] = instance.state;
  return val;
}

_$_LxdNetworkAcl _$$_LxdNetworkAclFromJson(Map json) => _$_LxdNetworkAcl(
      name: json['name'] as String,
      description: json['description'] as String,
      egress: (json['egress'] as List<dynamic>)
          .map((e) =>
              LxdNetworkAclRule.fromJson(Map<String, dynamic>.from(e as Map)))
          .toList(),
      ingress: (json['ingress'] as List<dynamic>)
          .map((e) =>
              LxdNetworkAclRule.fromJson(Map<String, dynamic>.from(e as Map)))
          .toList(),
      config: Map<String, String>.from(json['config'] as Map),
      usedBy:
          (json['used_by'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$$_LxdNetworkAclToJson(_$_LxdNetworkAcl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'description': instance.description,
      'egress': instance.egress.map((e) => e.toJson()).toList(),
      'ingress': instance.ingress.map((e) => e.toJson()).toList(),
      'config': instance.config,
      'used_by': instance.usedBy,
    };
