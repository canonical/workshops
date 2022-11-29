// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'operation.freezed.dart';
part 'operation.g.dart';

enum LxdOperationType { task, websocket, token }

@freezed
class LxdOperation with _$LxdOperation {
  const factory LxdOperation({
    /// UUID of the operation
    ///
    /// Example: 6916c8a6-9b7d-4abd-90b3-aedfec7ec7da
    required String id,

    /// Type of operation (task, token or websocket)
    @JsonKey(name: 'class') required LxdOperationType type,

    /// Description of the operation
    ///
    /// Example: Executing command
    required String description,

    /// Operation creation time
    required DateTime createdAt,

    /// Operation last change
    required DateTime updatedAt,

    /// Status name
    ///
    /// Example: Running
    required String status,

    /// Status code
    ///
    /// Example: 103
    required int statusCode,

    /// Affected resourcs
    ///
    /// Example: {"containers": ["/1.0/containers/foo"], "instances": ["/1.0/instances/foo"]}
    required Map<String, List<String>>? resources,

    /// Operation specific metadata
    ///
    /// Example:
    /// ```json
    /// {
    ///   "command": ["bash"],
    ///   "environment": {
    ///     "HOME": "/root",
    ///     "LANG": "C.UTF-8",
    ///     "PATH": "/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin",
    ///     "TERM": "xterm",
    ///     "USER": "root"
    ///   },
    ///   "fds": {
    ///     "0": "da3046cf02c0116febf4ef3fe4eaecdf308e720c05e5a9c730ce1a6f15417f66",
    ///     "1": "05896879d8692607bd6e4a09475667da3b5f6714418ab0ee0e5720b4c57f754b"
    ///   },
    ///   "interactive": true
    /// }
    /// ```
    required Map<String, dynamic>? metadata,

    /// Whether the operation can be canceled
    required bool mayCancel,

    /// Operation error mesage
    ///
    /// Example: Some error message
    @JsonKey(name: 'err') required String error,

    /// What cluster member this record was found on
    ///
    /// Example: lxd01
    required String location,
  }) = _LxdOperation;

  factory LxdOperation.fromJson(Map<String, dynamic> json) =>
      _$LxdOperationFromJson(json);
}
