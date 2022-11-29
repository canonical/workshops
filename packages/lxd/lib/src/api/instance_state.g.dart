// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'instance_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_LxdInstanceState _$$_LxdInstanceStateFromJson(Map<String, dynamic> json) =>
    _$_LxdInstanceState(
      status: $enumDecode(_$LxdInstanceStatusEnumMap, json['status']),
      statusCode: json['status_code'] as int,
      disk: (json['disk'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(
            k, LxdInstanceDiskState.fromJson(e as Map<String, dynamic>)),
      ),
      memory: json['memory'] == null
          ? null
          : LxdInstanceMemoryState.fromJson(
              json['memory'] as Map<String, dynamic>),
      network: (json['network'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(
            k, LxdInstanceNetworkState.fromJson(e as Map<String, dynamic>)),
      ),
      pid: json['pid'] as int,
      processes: json['processes'] as int? ?? -1,
      cpu: json['cpu'] == null
          ? null
          : LxdInstanceCpuState.fromJson(json['cpu'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_LxdInstanceStateToJson(_$_LxdInstanceState instance) =>
    <String, dynamic>{
      'status': _$LxdInstanceStatusEnumMap[instance.status],
      'status_code': instance.statusCode,
      'disk': instance.disk?.map((k, e) => MapEntry(k, e.toJson())),
      'memory': instance.memory?.toJson(),
      'network': instance.network?.map((k, e) => MapEntry(k, e.toJson())),
      'pid': instance.pid,
      'processes': instance.processes,
      'cpu': instance.cpu?.toJson(),
    };

const _$LxdInstanceStatusEnumMap = {
  LxdInstanceStatus.running: 'Running',
  LxdInstanceStatus.stopped: 'Stopped',
  LxdInstanceStatus.frozen: 'Frozen',
  LxdInstanceStatus.error: 'Error',
};

_$_LxdInstanceDiskState _$$_LxdInstanceDiskStateFromJson(
        Map<String, dynamic> json) =>
    _$_LxdInstanceDiskState(
      usage: json['usage'] as int,
    );

Map<String, dynamic> _$$_LxdInstanceDiskStateToJson(
        _$_LxdInstanceDiskState instance) =>
    <String, dynamic>{
      'usage': instance.usage,
    };

_$_LxdInstanceCpuState _$$_LxdInstanceCpuStateFromJson(
        Map<String, dynamic> json) =>
    _$_LxdInstanceCpuState(
      usage: json['usage'] as int,
    );

Map<String, dynamic> _$$_LxdInstanceCpuStateToJson(
        _$_LxdInstanceCpuState instance) =>
    <String, dynamic>{
      'usage': instance.usage,
    };

_$_LxdInstanceMemoryState _$$_LxdInstanceMemoryStateFromJson(
        Map<String, dynamic> json) =>
    _$_LxdInstanceMemoryState(
      usage: json['usage'] as int,
      usagePeak: json['usage_peak'] as int,
      swapUsage: json['swap_usage'] as int,
      swapUsagePeak: json['swap_usage_peak'] as int,
    );

Map<String, dynamic> _$$_LxdInstanceMemoryStateToJson(
        _$_LxdInstanceMemoryState instance) =>
    <String, dynamic>{
      'usage': instance.usage,
      'usage_peak': instance.usagePeak,
      'swap_usage': instance.swapUsage,
      'swap_usage_peak': instance.swapUsagePeak,
    };

_$_LxdInstanceNetworkState _$$_LxdInstanceNetworkStateFromJson(
        Map<String, dynamic> json) =>
    _$_LxdInstanceNetworkState(
      addresses: (json['addresses'] as List<dynamic>)
          .map((e) =>
              LxdInstanceNetworkAddress.fromJson(e as Map<String, dynamic>))
          .toList(),
      counters: LxdInstanceNetworkCounters.fromJson(
          json['counters'] as Map<String, dynamic>),
      hwaddr: json['hwaddr'] as String,
      hostName: json['host_name'] as String,
      mtu: json['mtu'] as int,
      state: json['state'] as String,
      type: json['type'] as String,
    );

Map<String, dynamic> _$$_LxdInstanceNetworkStateToJson(
        _$_LxdInstanceNetworkState instance) =>
    <String, dynamic>{
      'addresses': instance.addresses.map((e) => e.toJson()).toList(),
      'counters': instance.counters.toJson(),
      'hwaddr': instance.hwaddr,
      'host_name': instance.hostName,
      'mtu': instance.mtu,
      'state': instance.state,
      'type': instance.type,
    };

_$_LxdInstanceNetworkAddress _$$_LxdInstanceNetworkAddressFromJson(
        Map<String, dynamic> json) =>
    _$_LxdInstanceNetworkAddress(
      family: $enumDecode(_$LxdNetworkFamilyEnumMap, json['family']),
      address: json['address'] as String,
      netmask: json['netmask'] as String,
      scope: $enumDecode(_$LxdNetworkScopeEnumMap, json['scope']),
    );

Map<String, dynamic> _$$_LxdInstanceNetworkAddressToJson(
        _$_LxdInstanceNetworkAddress instance) =>
    <String, dynamic>{
      'family': _$LxdNetworkFamilyEnumMap[instance.family],
      'address': instance.address,
      'netmask': instance.netmask,
      'scope': _$LxdNetworkScopeEnumMap[instance.scope],
    };

const _$LxdNetworkFamilyEnumMap = {
  LxdNetworkFamily.inet: 'inet',
  LxdNetworkFamily.inet6: 'inet6',
};

const _$LxdNetworkScopeEnumMap = {
  LxdNetworkScope.local: 'local',
  LxdNetworkScope.link: 'link',
  LxdNetworkScope.global: 'global',
};

_$_LxdInstanceNetworkCounters _$$_LxdInstanceNetworkCountersFromJson(
        Map<String, dynamic> json) =>
    _$_LxdInstanceNetworkCounters(
      bytesReceived: json['bytes_received'] as int,
      bytesSent: json['bytes_sent'] as int,
      packetsReceived: json['packets_received'] as int,
      packetsSent: json['packets_sent'] as int,
      errorsReceived: json['errors_received'] as int,
      errorsSent: json['errors_sent'] as int,
      packetsDroppedOutbound: json['packets_dropped_outbound'] as int,
      packetsDroppedInbound: json['packets_dropped_inbound'] as int,
    );

Map<String, dynamic> _$$_LxdInstanceNetworkCountersToJson(
        _$_LxdInstanceNetworkCounters instance) =>
    <String, dynamic>{
      'bytes_received': instance.bytesReceived,
      'bytes_sent': instance.bytesSent,
      'packets_received': instance.packetsReceived,
      'packets_sent': instance.packetsSent,
      'errors_received': instance.errorsReceived,
      'errors_sent': instance.errorsSent,
      'packets_dropped_outbound': instance.packetsDroppedOutbound,
      'packets_dropped_inbound': instance.packetsDroppedInbound,
    };
