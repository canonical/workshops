// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'certificate.freezed.dart';
part 'certificate.g.dart';

/// Represents an LXD certificate type
enum LxdCertificateType {
  /// Indicates a client certificate type.
  client,

  /// Indicates a server certificate type.
  server,

  /// Indicates a metrics certificate type.
  metrics,

  /// Indicates an unknown certificate type.
  unknown,
}

/// Represents an LXD certificate
@freezed
class LxdCertificate with _$LxdCertificate {
  const factory LxdCertificate({
    /// Name associated with the certificate
    ///
    /// Example: castiana
    required String name,

    /// Usage type for the certificate
    @JsonKey(unknownEnumValue: LxdCertificateType.unknown)
        required LxdCertificateType type,

    /// Whether to limit the certificate to listed projects
    ///
    /// API extension: certificate_project
    required bool restricted,

    /// List of allowed projects (applies when restricted)
    ///
    /// Example: ["default", "foo", "bar"]
    ///
    /// API extension: certificate_project
    required List<String> projects,

    /// The certificate itself, as PEM encoded X509
    ///
    /// Example: X509 PEM certificate
    ///
    /// API extension: certificate_self_renewal
    required String certificate,

    /// SHA256 fingerprint of the certificate
    ///
    /// Read only: true
    ///
    /// Example: fd200419b271f1dc2a5591b693cc5774b7f234e1ff8c6b78ad703b6888fe2b69
    required String fingerprint,
  }) = _LxdCertificate;

  factory LxdCertificate.fromJson(Map<String, dynamic> json) =>
      _$LxdCertificateFromJson(json);
}
