/// Status codes
///
/// The LXD REST API often has to return status information, be that the reason
/// for an error, the current state of an operation or the state of the various
/// resources it exports.
///
/// To make it simple to debug, all of those are always doubled. There is a
/// numeric representation of the state which is guaranteed never to change and
/// can be relied on by API clients. Then there is a text version meant to make
/// it easier for people manually using the API to figure out what’s happening.
///
/// In most cases, those will be called `status` and `statusCode`, the former
/// being the user-friendly string representation and the latter the fixed
/// numeric value.
///
/// The codes are always 3 digits, with the following ranges:
///
/// - 100 to 199: resource state (started, stopped, ready, …)
/// - 200 to 399: positive action result
/// - 400 to 599: negative action result
/// - 600 to 999: future use
abstract class LxdStatusCode {
  LxdStatusCode._();

  /// Operation created
  static const operationCreated = 100;

  /// Started
  static const started = 101;

  /// Stopped
  static const stopped = 102;

  /// Running
  static const running = 103;

  /// Cancelling
  static const cancelling = 104;

  /// Pending
  static const pending = 105;

  /// Starting
  static const starting = 106;

  /// Stopping
  static const stopping = 107;

  /// Aborting
  static const aborting = 108;

  /// Freezing
  static const freezing = 109;

  /// Frozen
  static const frozen = 110;

  /// Thawed
  static const thawed = 111;

  /// Error
  static const error = 112;

  /// Success
  static const success = 200;

  /// Failure
  static const failure = 400;

  /// Cancelled
  static const cancelled = 401;
}
