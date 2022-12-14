// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'server.freezed.dart';
part 'server.g.dart';

// Represents the read-only environment fields of a LXD server.
@freezed
class LxdServerEnvironment with _$LxdServerEnvironment {
  const factory LxdServerEnvironment({
    /// List of addresses the server is listening on
    /// Example: [":8443"]
    @Default([]) List<String> addresses,

    /// List of architectures supported by the server
    /// Example: ["x86_64", "i686"]
    @Default([]) List<String> architectures,

    /// Server certificate as PEM encoded X509
    /// Example: X509 PEM certificate
    required String certificate,

    /// Server certificate fingerprint as SHA256
    /// Example: fd200419b271f1dc2a5591b693cc5774b7f234e1ff8c6b78ad703b6888fe2b69
    String? certificateFingerprint,

    /// List of supported instance drivers (separate by " | ")
    /// Example: lxc | qemu
    required String driver,

    /// List of supported instance driver versions (separate by " | ")
    /// Example: 4.0.7 | 5.2.0
    required String driverVersion,

    /// Current firewall driver
    /// Example: nftables
    //
    /// API extension: firewall_driver
    String? firewall,

    /// OS kernel name
    /// Example: Linux
    required String kernel,

    /// OS kernel architecture
    /// Example: x86_64
    required String kernelArchitecture,

    /// Map of kernel features that were tested on startup
    /// Example: {"netnsid_getifaddrs": "true", "seccomp_listener": "true"}
    //
    /// API extension: kernel_features
    Map<String, String>? kernelFeatures,

    /// Kernel version
    /// Example: 5.4.0-36-generic
    required String kernelVersion,

    /// Map of LXC features that were tested on startup
    /// Example: {"cgroup2": "true", "devpts_fd": "true", "pidfd": "true"}
    //
    /// API extension: lxc_features
    Map<String, String>? lxdFeatures,

    /// Name of the operating system (Linux distribution)
    /// Example: Ubuntu
    //
    /// API extension: api_os
    String? osName,

    /// Version of the operating system (Linux distribution)
    /// Example: 22.04
    //
    /// API extension: api_os
    String? osVersion,

    /// Current project name
    /// Example: default
    //
    /// API extension: projects
    String? project,

    /// Server implementation name
    /// Example: lxd
    required String server,

    /// Whether the server is part of a cluster
    /// Example: false
    //
    /// API extension: clustering
    bool? serverClustered,

    /// Mode that the event distribution subsystem is operating in on this server.
    /// Either "full-mesh", "hub-server" or "hub-client".
    /// Example: full-mesh
    //
    /// API extension: event_hub
    String? serverEventMode,

    /// Server hostname
    /// Example: castiana
    //
    /// API extension: clustering
    String? serverName,

    /// PID of the LXD process
    /// Example: 1453969
    required int serverPid,

    /// Server version
    /// Example: 4.11
    required String serverVersion,

    /// List of active storage drivers (separate by " | ")
    /// Example: dir | zfs
    required String storage,

    /// List of active storage driver versions (separate by " | ")
    /// Example: 1 | 0.8.4-1ubuntu11
    required String storageVersion,

    /// List of supported storage drivers
    @Default([]) List<LxdServerStorageDriverInfo> storageSupportedDrivers,
  }) = _LxdServerEnvironment;

  factory LxdServerEnvironment.fromJson(Map<String, dynamic> json) =>
      _$LxdServerEnvironmentFromJson(json);
}

// ServerStorageDriverInfo represents the read-only info about a storage driver
//
// API extension: server_supported_storage_drivers.
@freezed
class LxdServerStorageDriverInfo with _$LxdServerStorageDriverInfo {
  const factory LxdServerStorageDriverInfo({
    /// Name of the driver
    /// Example: zfs
    ///
    /// API extension: server_supported_storage_drivers
    @JsonKey(name: 'Name') required String name,

    /// Version of the driver
    /// Example: 0.8.4-1ubuntu11
    ///
    /// API extension: server_supported_storage_drivers
    @JsonKey(name: 'Version') required String version,

    /// Whether the driver has remote volumes
    /// Example: false
    ///
    /// API extension: server_supported_storage_drivers
    @JsonKey(name: 'Remote') required bool remote,
  }) = _LxdServerStorageDriverInfo;

  factory LxdServerStorageDriverInfo.fromJson(Map<String, dynamic> json) =>
      _$LxdServerStorageDriverInfoFromJson(json);
}

@freezed
class LxdServer with _$LxdServer {
  const factory LxdServer({
    /// Server configuration map (refer to doc/server.md)
    /// Example: {"core.https_address": ":8443", "core.trust_password": true}
    required Map<String, dynamic> config,

    // List of supported API extensions
    /// Read only: true
    /// Example: ["etag", "patch", "network", "storage"]
    @Default([]) List<String> apiExtensions,

    /// Support status of the current API (one of "devel", "stable" or "deprecated")
    /// Read only: true
    /// Example: stable
    required String apiStatus,

    /// API version number
    /// Read only: true
    /// Example: 1.0
    required String apiVersion,

    /// Whether the client is trusted (one of "trusted" or "untrusted")
    /// Read only: true
    /// Example: untrusted
    required String auth,

    /// Whether the server is public-only (only public endpoints are implemented)
    /// Read only: true
    /// Example: false
    required bool public,

    /// List of supported authentication methods
    /// Read only: true
    /// Example: ["tls", "candid"]
    ///
    /// API extension: macaroon_authentication
    required List<String>? authMethods,
    required LxdServerEnvironment environment,
  }) = _LxdServer;

  factory LxdServer.fromJson(Map<String, dynamic> json) =>
      _$LxdServerFromJson(json);
}
