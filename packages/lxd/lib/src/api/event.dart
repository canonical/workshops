// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'event.freezed.dart';
part 'event.g.dart';

enum LxdEventType { operation, logging, lifecycle }

/// Represents an event entry (over websocket)
@freezed
class LxdEvent with _$LxdEvent {
  const factory LxdEvent({
    /// Event type
    required LxdEventType type,

    /// Time at which the event was sent
    required DateTime timestamp,

    /// JSON encoded metadata
    ///
    /// See [LxdEventLogging], [LxdEventLifecycle] or [LxdOperation]
    ///
    /// Example: {"action": "instance-started", "source": "/1.0/instances/c1", "context": {}}
    required Map<String, dynamic>? metadata,

    /// Originating cluster member
    ///
    /// Example: lxd01
    String? location,

    /// Project the event belongs to.
    ///
    /// Example: default
    String? project,
  }) = _LxdEvent;

  factory LxdEvent.fromJson(Map<String, dynamic> json) =>
      _$LxdEventFromJson(json);
}

/// Represents a logging type event entry (admin only)
@freezed
class LxdEventLogging with _$LxdEventLogging {
  const factory LxdEventLogging({
    required String message,
    required String level,
    required Map<String, String> context,
  }) = _LxdEventLogging;

  factory LxdEventLogging.fromJson(Map<String, dynamic> json) =>
      _$LxdEventLoggingFromJson(json);
}

/// Represets a lifecycle type event entry
///
/// API extension: event_lifecycle
@freezed
class LxdEventLifecycle with _$LxdEventLifecycle {
  const factory LxdEventLifecycle({
    required String action,
    required String source,
    Map<String, dynamic>? context,

    /// API extension: event_lifecycle_requestor
    LxdEventLifecycleRequestor? requestor,
  }) = _LxdEventLifecycle;

  factory LxdEventLifecycle.fromJson(Map<String, dynamic> json) =>
      _$LxdEventLifecycleFromJson(json);
}

/// Represents the initial requestor for an event
///
/// API extension: event_lifecycle_requestor
@freezed
class LxdEventLifecycleRequestor with _$LxdEventLifecycleRequestor {
  const factory LxdEventLifecycleRequestor({
    required String username,
    required String protocol,

    /// Requestor address
    ///
    /// Example: 10.0.2.15
    ///
    /// API extension: event_lifecycle_requestor_address
    required String address,
  }) = _LxdEventLifecycleRequestor;

  factory LxdEventLifecycleRequestor.fromJson(Map<String, dynamic> json) =>
      _$LxdEventLifecycleRequestorFromJson(json);
}
