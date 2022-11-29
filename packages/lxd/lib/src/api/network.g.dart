// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'network.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_LxdNetwork _$$_LxdNetworkFromJson(Map<String, dynamic> json) =>
    _$_LxdNetwork(
      config: Map<String, String>.from(json['config'] as Map),
      description: json['description'] as String,
      managed: json['managed'] as bool,
      name: json['name'] as String,
      status: json['status'] as String,
      type: json['type'] as String,
    );

Map<String, dynamic> _$$_LxdNetworkToJson(_$_LxdNetwork instance) =>
    <String, dynamic>{
      'config': instance.config,
      'description': instance.description,
      'managed': instance.managed,
      'name': instance.name,
      'status': instance.status,
      'type': instance.type,
    };

_$_LxdNetworkLease _$$_LxdNetworkLeaseFromJson(Map<String, dynamic> json) =>
    _$_LxdNetworkLease(
      address: json['address'] as String,
      hostname: json['hostname'] as String,
      hwaddr: json['hwaddr'] as String,
      location: json['location'] as String,
      type: json['type'] as String,
    );

Map<String, dynamic> _$$_LxdNetworkLeaseToJson(_$_LxdNetworkLease instance) =>
    <String, dynamic>{
      'address': instance.address,
      'hostname': instance.hostname,
      'hwaddr': instance.hwaddr,
      'location': instance.location,
      'type': instance.type,
    };

_$_LxdNetworkState _$$_LxdNetworkStateFromJson(Map<String, dynamic> json) =>
    _$_LxdNetworkState(
      addresses: (json['addresses'] as List<dynamic>)
          .map((e) => LxdNetworkAddress.fromJson(e as Map<String, dynamic>))
          .toList(),
      counters:
          LxdNetworkCounters.fromJson(json['counters'] as Map<String, dynamic>),
      hwaddr: json['hwaddr'] as String,
      mtu: json['mtu'] as int,
      state: json['state'] as String,
      type: json['type'] as String,
    );

Map<String, dynamic> _$$_LxdNetworkStateToJson(_$_LxdNetworkState instance) =>
    <String, dynamic>{
      'addresses': instance.addresses.map((e) => e.toJson()).toList(),
      'counters': instance.counters.toJson(),
      'hwaddr': instance.hwaddr,
      'mtu': instance.mtu,
      'state': instance.state,
      'type': instance.type,
    };

_$_LxdNetworkAddress _$$_LxdNetworkAddressFromJson(Map<String, dynamic> json) =>
    _$_LxdNetworkAddress(
      address: json['address'] as String,
      family: json['family'] as String,
      netmask: json['netmask'] as String,
      scope: json['scope'] as String,
    );

Map<String, dynamic> _$$_LxdNetworkAddressToJson(
        _$_LxdNetworkAddress instance) =>
    <String, dynamic>{
      'address': instance.address,
      'family': instance.family,
      'netmask': instance.netmask,
      'scope': instance.scope,
    };

_$_LxdNetworkCounters _$$_LxdNetworkCountersFromJson(
        Map<String, dynamic> json) =>
    _$_LxdNetworkCounters(
      bytesReceived: json['bytes_received'] as int,
      bytesSent: json['bytes_sent'] as int,
      packetsReceived: json['packets_received'] as int,
      packetsSent: json['packets_sent'] as int,
    );

Map<String, dynamic> _$$_LxdNetworkCountersToJson(
        _$_LxdNetworkCounters instance) =>
    <String, dynamic>{
      'bytes_received': instance.bytesReceived,
      'bytes_sent': instance.bytesSent,
      'packets_received': instance.packetsReceived,
      'packets_sent': instance.packetsSent,
    };
