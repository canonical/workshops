// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'instance_state.freezed.dart';
part 'instance_state.g.dart';

enum LxdInstanceStatus {
  @JsonValue('Running')
  running,

  @JsonValue('Stopped')
  stopped,

  @JsonValue('Frozen')
  frozen,

  @JsonValue('Error')
  error,
}

/// Represents a LXD instance's state.
///
/// API extension: instances
@freezed
class LxdInstanceState with _$LxdInstanceState {
  const factory LxdInstanceState({
    /// Current status
    required LxdInstanceStatus status,

    /// Numeric status code (101, 102, 110, 112)
    required int statusCode,

    /// Disk usage
    Map<String, LxdInstanceDiskState>? disk,

    /// Memory usage information
    LxdInstanceMemoryState? memory,

    /// Network usage
    Map<String, LxdInstanceNetworkState>? network,

    /// PID of the runtime
    required int pid,

    /// Number of processes in the instance
    @Default(-1) int processes,

    /// CPU usage information
    LxdInstanceCpuState? cpu,
  }) = _LxdInstanceState;

  factory LxdInstanceState.fromJson(Map<String, dynamic> json) =>
      _$LxdInstanceStateFromJson(json);
}

/// Represents the disk information section of a LXD instance's state.
///
/// API extension: instances
@freezed
class LxdInstanceDiskState with _$LxdInstanceDiskState {
  const factory LxdInstanceDiskState({
    /// Disk usage in bytes
    ///
    /// Example: 502239232
    required int usage,
  }) = _LxdInstanceDiskState;

  factory LxdInstanceDiskState.fromJson(Map<String, dynamic> json) =>
      _$LxdInstanceDiskStateFromJson(json);
}

/// Represents the cpu information section of a LXD instance's state.
///
/// API extension: instances
@freezed
class LxdInstanceCpuState with _$LxdInstanceCpuState {
  const factory LxdInstanceCpuState({
    /// CPU usage in nanoseconds
    ///
    /// Example: 3637691016
    required int usage,
  }) = _LxdInstanceCpuState;

  factory LxdInstanceCpuState.fromJson(Map<String, dynamic> json) =>
      _$LxdInstanceCpuStateFromJson(json);
}

/// Represents the memory information section of a LXD instance's state.
///
/// API extension: instances
@freezed
class LxdInstanceMemoryState with _$LxdInstanceMemoryState {
  const factory LxdInstanceMemoryState({
    /// Memory usage in bytes
    ///
    /// Example: 73248768
    required int usage,

    /// Peak memory usage in bytes
    ///
    /// Example: 73785344
    required int usagePeak,

    /// SWAP usage in bytes
    ///
    /// Example: 12297557
    required int swapUsage,

    /// Peak SWAP usage in bytes
    ///
    /// Example: 12297557
    required int swapUsagePeak,
  }) = _LxdInstanceMemoryState;

  factory LxdInstanceMemoryState.fromJson(Map<String, dynamic> json) =>
      _$LxdInstanceMemoryStateFromJson(json);
}

/// Represents the network information section of a LXD instance's state.
///
/// API extension: instances
@freezed
class LxdInstanceNetworkState with _$LxdInstanceNetworkState {
  const factory LxdInstanceNetworkState({
    /// List of IP addresses
    required List<LxdInstanceNetworkAddress> addresses,

    /// Traffic counters
    required LxdInstanceNetworkCounters counters,

    /// MAC address
    ///
    /// Example: 00:16:3e:0c:ee:dd
    required String hwaddr,

    /// Name of the interface on the host
    ///
    /// Example: vethbbcd39c7
    required String hostName,

    /// MTU (maximum transmit unit) for the interface
    ///
    /// Example: 1500
    required int mtu,

    /// Administrative state of the interface (up/down)
    ///
    /// Example: up
    required String state,

    /// Type of interface (broadcast, loopback, point-to-point, ...)
    ///
    /// Example: broadcast
    required String type,
  }) = _LxdInstanceNetworkState;

  factory LxdInstanceNetworkState.fromJson(Map<String, dynamic> json) =>
      _$LxdInstanceNetworkStateFromJson(json);
}

enum LxdNetworkFamily { inet, inet6 }

enum LxdNetworkScope { local, link, global }

/// Represents a network address as part of the network section of a LXD
/// instance's state.
///
/// API extension: instances
@freezed
class LxdInstanceNetworkAddress with _$LxdInstanceNetworkAddress {
  const factory LxdInstanceNetworkAddress({
    /// Network family
    required LxdNetworkFamily family,

    /// IP address
    ///
    /// Example: fd42:4c81:5770:1eaf:216:3eff:fe0c:eedd
    required String address,

    /// Network mask
    ///
    /// Example: 64
    required String netmask,

    /// Address scope
    required LxdNetworkScope scope,
  }) = _LxdInstanceNetworkAddress;

  factory LxdInstanceNetworkAddress.fromJson(Map<String, dynamic> json) =>
      _$LxdInstanceNetworkAddressFromJson(json);
}

/// Represents packet counters as part of the network section of a LXD
/// instance's state.
///
/// API extension: instances
@freezed
class LxdInstanceNetworkCounters with _$LxdInstanceNetworkCounters {
  const factory LxdInstanceNetworkCounters({
    /// Number of bytes received
    ///
    /// Example: 192021
    required int bytesReceived,

    /// Number of bytes sent
    ///
    /// Example: 10888579
    required int bytesSent,

    /// Number of packets received
    ///
    /// Example: 1748
    required int packetsReceived,

    /// Number of packets sent
    ///
    /// Example: 964
    required int packetsSent,

    /// Number of errors received
    ///
    /// Example: 14
    required int errorsReceived,

    /// Number of errors sent
    ///
    /// Example: 41
    required int errorsSent,

    /// Number of outbound packets dropped
    ///
    /// Example: 541
    required int packetsDroppedOutbound,

    /// Number of inbound packets dropped
    ///
    /// Example: 179
    required int packetsDroppedInbound,
  }) = _LxdInstanceNetworkCounters;

  factory LxdInstanceNetworkCounters.fromJson(Map<String, dynamic> json) =>
      _$LxdInstanceNetworkCountersFromJson(json);
}
