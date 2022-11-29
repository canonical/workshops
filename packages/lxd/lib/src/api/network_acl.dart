// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'network_acl.freezed.dart';
part 'network_acl.g.dart';

/// Represents a single rule in an ACL ruleset.
///
/// API extension: network_acl
@freezed
class LxdNetworkAclRule with _$LxdNetworkAclRule {
  const factory LxdNetworkAclRule({
    /// Action to perform on rule match
    ///
    /// Example: allow
    required final String action,

    /// Source address
    ///
    /// Example: @internal
    @JsonKey(includeIfNull: false) final String? source,

    /// Destination address
    ///
    /// Example: 8.8.8.8/32,8.8.4.4/32
    @JsonKey(includeIfNull: false) final String? destination,

    /// Protocol
    ///
    /// Example: udp
    @JsonKey(includeIfNull: false) final String? protocol,

    /// Source port
    ///
    /// Example: 1234
    @JsonKey(includeIfNull: false) final String? sourcePort,

    /// Destination port
    ///
    /// Example: 53
    @JsonKey(includeIfNull: false) final String? destinationPort,

    /// Type of ICMP message (for ICMP protocol)
    ///
    /// Example: 8
    @JsonKey(includeIfNull: false) final String? icmpType,

    /// ICMP message code (for ICMP protocol)
    ///
    /// Example: 0
    @JsonKey(includeIfNull: false) final String? icmpCode,

    /// Description of the rule
    ///
    /// Example: Allow DNS queries to Google DNS
    @JsonKey(includeIfNull: false) final String? description,

    /// State of the rule
    ///
    /// Example: enabled
    required final String state,
  }) = _LxdNetworkAclRule;

  factory LxdNetworkAclRule.fromJson(Map<String, dynamic> json) =>
      _$LxdNetworkAclRuleFromJson(json);
}

// Represents an LXD network ACL.
@freezed
class LxdNetworkAcl with _$LxdNetworkAcl {
  const factory LxdNetworkAcl({
    /// Name of the ACL
    ///
    /// Example: bar
    required String name,

    /// Description of the ACL
    ///
    /// Example: Web servers
    required String description,

    /// List of egress rules (order independent)
    required List<LxdNetworkAclRule> egress,

    /// List of ingress rules (order independent)
    required List<LxdNetworkAclRule> ingress,

    /// ACL configuration map
    ///
    /// Example:
    /// ```json
    /// {"user.mykey": "foo"}
    /// ```
    required Map<String, String> config,

    /// Resources that use the ACL
    required List<String> usedBy,
  }) = _LxdNetworkAcl;

  factory LxdNetworkAcl.fromJson(Map<String, dynamic> json) =>
      _$LxdNetworkAclFromJson(json);
}
