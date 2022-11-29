// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'instance.freezed.dart';
part 'instance.g.dart';

/// Represents an LXD instance type
@JsonEnum(fieldRename: FieldRename.kebab)
enum LxdInstanceType { container, virtualMachine }

/// Represents an LXD instance
@freezed
class LxdInstance with _$LxdInstance {
  const factory LxdInstance({
    /// Architecture name
    ///
    /// Example: x86_64
    required String architecture,

    /// Instance configuration
    ///
    /// Example:
    /// ```json
    /// {"security.nesting": "true"}
    /// ```
    ///
    /// See: https://linuxcontainers.org/lxd/docs/master/instances/
    required Map<String, String> config,

    /// Instance devices
    ///
    /// Example:
    /// ```json
    /// {"root": {"type": "disk", "pool": "default", "path": "/"}}
    /// ```
    ///
    /// See: https://linuxcontainers.org/lxd/docs/master/instances/
    required Map<String, Map<String, String>> devices,

    /// Whether the instance is ephemeral (deleted on shutdown)
    required bool ephemeral,

    /// List of profiles applied to the instance
    ///
    /// Example: ["default"]
    required List<String> profiles,

    /// If set, instance will be restored to the provided snapshot name
    ///
    /// Example: snap0
    @JsonKey(includeIfNull: false) required String? restore,

    /// Whether the instance currently has saved state on disk
    required bool stateful,

    /// Instance description
    ///
    /// Example: My test instance
    required String description,

    /// Instance creation timestamp
    required DateTime createdAt,

    /// Expanded configuration (all profiles and local config merged)
    ///
    /// Example: {"security.nesting": "true"}
    @JsonKey(includeIfNull: false) required Map<String, String>? expandedConfig,

    /// Expanded devices (all profiles and local devices merged)
    ///
    /// Example: {"root": {"type": "disk", "pool": "default", "path": "/"}}
    @JsonKey(includeIfNull: false)
        required Map<String, Map<String, String>>? expandedDevices,

    /// Instance name
    ///
    /// Example: foo
    required String name,

    /// Instance status
    ///
    /// Example: Running
    required String status,

    /// Instance status code
    ///
    /// Example: 101
    required int statusCode,

    /// Last start timestamp
    required DateTime lastUsedAt,

    /// What cluster member this instance is located on
    ///
    /// Example: lxd01
    required String location,

    /// The type of instance
    required LxdInstanceType type,

    /// Instance project name
    ///
    /// Example: foo
    required String project,
  }) = _LxdInstance;

  factory LxdInstance.fromJson(Map<String, dynamic> json) =>
      _$LxdInstanceFromJson(json);
}
