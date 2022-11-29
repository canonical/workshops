// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'network.freezed.dart';
part 'network.g.dart';

@freezed
class LxdNetwork with _$LxdNetwork {
  const factory LxdNetwork({
    required Map<String, String> config,
    required String description,
    required bool managed,
    required String name,
    required String status,
    required String type,
  }) = _LxdNetwork;

  factory LxdNetwork.fromJson(Map<String, dynamic> json) =>
      _$LxdNetworkFromJson(json);
}

@freezed
class LxdNetworkLease with _$LxdNetworkLease {
  const factory LxdNetworkLease({
    required String address,
    required String hostname,
    required String hwaddr,
    required String location,
    required String type,
  }) = _LxdNetworkLease;

  factory LxdNetworkLease.fromJson(Map<String, dynamic> json) =>
      _$LxdNetworkLeaseFromJson(json);
}

@freezed
class LxdNetworkState with _$LxdNetworkState {
  const factory LxdNetworkState({
    required List<LxdNetworkAddress> addresses,
    required LxdNetworkCounters counters,
    required String hwaddr,
    required int mtu,
    required String state,
    required String type,
  }) = _LxdNetworkState;

  factory LxdNetworkState.fromJson(Map<String, dynamic> json) =>
      _$LxdNetworkStateFromJson(json);
}

@freezed
class LxdNetworkAddress with _$LxdNetworkAddress {
  const factory LxdNetworkAddress({
    required String address,
    required String family,
    required String netmask,
    required String scope,
  }) = _LxdNetworkAddress;

  factory LxdNetworkAddress.fromJson(Map<String, dynamic> json) =>
      _$LxdNetworkAddressFromJson(json);
}

@freezed
class LxdNetworkCounters with _$LxdNetworkCounters {
  const factory LxdNetworkCounters({
    required int bytesReceived,
    required int bytesSent,
    required int packetsReceived,
    required int packetsSent,
  }) = _LxdNetworkCounters;

  factory LxdNetworkCounters.fromJson(Map<String, dynamic> json) =>
      _$LxdNetworkCountersFromJson(json);
}
