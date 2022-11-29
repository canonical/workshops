// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

LxdEvent _$LxdEventFromJson(Map<String, dynamic> json) {
  return _LxdEvent.fromJson(json);
}

/// @nodoc
mixin _$LxdEvent {
  /// Event type
  LxdEventType get type => throw _privateConstructorUsedError;

  /// Time at which the event was sent
  DateTime get timestamp => throw _privateConstructorUsedError;

  /// JSON encoded metadata
  ///
  /// See [LxdEventLogging], [LxdEventLifecycle] or [LxdOperation]
  ///
  /// Example: {"action": "instance-started", "source": "/1.0/instances/c1", "context": {}}
  Map<String, dynamic>? get metadata => throw _privateConstructorUsedError;

  /// Originating cluster member
  ///
  /// Example: lxd01
  String? get location => throw _privateConstructorUsedError;

  /// Project the event belongs to.
  ///
  /// Example: default
  String? get project => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LxdEventCopyWith<LxdEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LxdEventCopyWith<$Res> {
  factory $LxdEventCopyWith(LxdEvent value, $Res Function(LxdEvent) then) =
      _$LxdEventCopyWithImpl<$Res>;
  $Res call(
      {LxdEventType type,
      DateTime timestamp,
      Map<String, dynamic>? metadata,
      String? location,
      String? project});
}

/// @nodoc
class _$LxdEventCopyWithImpl<$Res> implements $LxdEventCopyWith<$Res> {
  _$LxdEventCopyWithImpl(this._value, this._then);

  final LxdEvent _value;
  // ignore: unused_field
  final $Res Function(LxdEvent) _then;

  @override
  $Res call({
    Object? type = freezed,
    Object? timestamp = freezed,
    Object? metadata = freezed,
    Object? location = freezed,
    Object? project = freezed,
  }) {
    return _then(_value.copyWith(
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as LxdEventType,
      timestamp: timestamp == freezed
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
      metadata: metadata == freezed
          ? _value.metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      location: location == freezed
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String?,
      project: project == freezed
          ? _value.project
          : project // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$$_LxdEventCopyWith<$Res> implements $LxdEventCopyWith<$Res> {
  factory _$$_LxdEventCopyWith(
          _$_LxdEvent value, $Res Function(_$_LxdEvent) then) =
      __$$_LxdEventCopyWithImpl<$Res>;
  @override
  $Res call(
      {LxdEventType type,
      DateTime timestamp,
      Map<String, dynamic>? metadata,
      String? location,
      String? project});
}

/// @nodoc
class __$$_LxdEventCopyWithImpl<$Res> extends _$LxdEventCopyWithImpl<$Res>
    implements _$$_LxdEventCopyWith<$Res> {
  __$$_LxdEventCopyWithImpl(
      _$_LxdEvent _value, $Res Function(_$_LxdEvent) _then)
      : super(_value, (v) => _then(v as _$_LxdEvent));

  @override
  _$_LxdEvent get _value => super._value as _$_LxdEvent;

  @override
  $Res call({
    Object? type = freezed,
    Object? timestamp = freezed,
    Object? metadata = freezed,
    Object? location = freezed,
    Object? project = freezed,
  }) {
    return _then(_$_LxdEvent(
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as LxdEventType,
      timestamp: timestamp == freezed
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
      metadata: metadata == freezed
          ? _value._metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      location: location == freezed
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String?,
      project: project == freezed
          ? _value.project
          : project // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_LxdEvent implements _LxdEvent {
  const _$_LxdEvent(
      {required this.type,
      required this.timestamp,
      required final Map<String, dynamic>? metadata,
      this.location,
      this.project})
      : _metadata = metadata;

  factory _$_LxdEvent.fromJson(Map<String, dynamic> json) =>
      _$$_LxdEventFromJson(json);

  /// Event type
  @override
  final LxdEventType type;

  /// Time at which the event was sent
  @override
  final DateTime timestamp;

  /// JSON encoded metadata
  ///
  /// See [LxdEventLogging], [LxdEventLifecycle] or [LxdOperation]
  ///
  /// Example: {"action": "instance-started", "source": "/1.0/instances/c1", "context": {}}
  final Map<String, dynamic>? _metadata;

  /// JSON encoded metadata
  ///
  /// See [LxdEventLogging], [LxdEventLifecycle] or [LxdOperation]
  ///
  /// Example: {"action": "instance-started", "source": "/1.0/instances/c1", "context": {}}
  @override
  Map<String, dynamic>? get metadata {
    final value = _metadata;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  /// Originating cluster member
  ///
  /// Example: lxd01
  @override
  final String? location;

  /// Project the event belongs to.
  ///
  /// Example: default
  @override
  final String? project;

  @override
  String toString() {
    return 'LxdEvent(type: $type, timestamp: $timestamp, metadata: $metadata, location: $location, project: $project)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LxdEvent &&
            const DeepCollectionEquality().equals(other.type, type) &&
            const DeepCollectionEquality().equals(other.timestamp, timestamp) &&
            const DeepCollectionEquality().equals(other._metadata, _metadata) &&
            const DeepCollectionEquality().equals(other.location, location) &&
            const DeepCollectionEquality().equals(other.project, project));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(type),
      const DeepCollectionEquality().hash(timestamp),
      const DeepCollectionEquality().hash(_metadata),
      const DeepCollectionEquality().hash(location),
      const DeepCollectionEquality().hash(project));

  @JsonKey(ignore: true)
  @override
  _$$_LxdEventCopyWith<_$_LxdEvent> get copyWith =>
      __$$_LxdEventCopyWithImpl<_$_LxdEvent>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_LxdEventToJson(this);
  }
}

abstract class _LxdEvent implements LxdEvent {
  const factory _LxdEvent(
      {required final LxdEventType type,
      required final DateTime timestamp,
      required final Map<String, dynamic>? metadata,
      final String? location,
      final String? project}) = _$_LxdEvent;

  factory _LxdEvent.fromJson(Map<String, dynamic> json) = _$_LxdEvent.fromJson;

  @override

  /// Event type
  LxdEventType get type => throw _privateConstructorUsedError;
  @override

  /// Time at which the event was sent
  DateTime get timestamp => throw _privateConstructorUsedError;
  @override

  /// JSON encoded metadata
  ///
  /// See [LxdEventLogging], [LxdEventLifecycle] or [LxdOperation]
  ///
  /// Example: {"action": "instance-started", "source": "/1.0/instances/c1", "context": {}}
  Map<String, dynamic>? get metadata => throw _privateConstructorUsedError;
  @override

  /// Originating cluster member
  ///
  /// Example: lxd01
  String? get location => throw _privateConstructorUsedError;
  @override

  /// Project the event belongs to.
  ///
  /// Example: default
  String? get project => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_LxdEventCopyWith<_$_LxdEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

LxdEventLogging _$LxdEventLoggingFromJson(Map<String, dynamic> json) {
  return _LxdEventLogging.fromJson(json);
}

/// @nodoc
mixin _$LxdEventLogging {
  String get message => throw _privateConstructorUsedError;
  String get level => throw _privateConstructorUsedError;
  Map<String, String> get context => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LxdEventLoggingCopyWith<LxdEventLogging> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LxdEventLoggingCopyWith<$Res> {
  factory $LxdEventLoggingCopyWith(
          LxdEventLogging value, $Res Function(LxdEventLogging) then) =
      _$LxdEventLoggingCopyWithImpl<$Res>;
  $Res call({String message, String level, Map<String, String> context});
}

/// @nodoc
class _$LxdEventLoggingCopyWithImpl<$Res>
    implements $LxdEventLoggingCopyWith<$Res> {
  _$LxdEventLoggingCopyWithImpl(this._value, this._then);

  final LxdEventLogging _value;
  // ignore: unused_field
  final $Res Function(LxdEventLogging) _then;

  @override
  $Res call({
    Object? message = freezed,
    Object? level = freezed,
    Object? context = freezed,
  }) {
    return _then(_value.copyWith(
      message: message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      level: level == freezed
          ? _value.level
          : level // ignore: cast_nullable_to_non_nullable
              as String,
      context: context == freezed
          ? _value.context
          : context // ignore: cast_nullable_to_non_nullable
              as Map<String, String>,
    ));
  }
}

/// @nodoc
abstract class _$$_LxdEventLoggingCopyWith<$Res>
    implements $LxdEventLoggingCopyWith<$Res> {
  factory _$$_LxdEventLoggingCopyWith(
          _$_LxdEventLogging value, $Res Function(_$_LxdEventLogging) then) =
      __$$_LxdEventLoggingCopyWithImpl<$Res>;
  @override
  $Res call({String message, String level, Map<String, String> context});
}

/// @nodoc
class __$$_LxdEventLoggingCopyWithImpl<$Res>
    extends _$LxdEventLoggingCopyWithImpl<$Res>
    implements _$$_LxdEventLoggingCopyWith<$Res> {
  __$$_LxdEventLoggingCopyWithImpl(
      _$_LxdEventLogging _value, $Res Function(_$_LxdEventLogging) _then)
      : super(_value, (v) => _then(v as _$_LxdEventLogging));

  @override
  _$_LxdEventLogging get _value => super._value as _$_LxdEventLogging;

  @override
  $Res call({
    Object? message = freezed,
    Object? level = freezed,
    Object? context = freezed,
  }) {
    return _then(_$_LxdEventLogging(
      message: message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      level: level == freezed
          ? _value.level
          : level // ignore: cast_nullable_to_non_nullable
              as String,
      context: context == freezed
          ? _value._context
          : context // ignore: cast_nullable_to_non_nullable
              as Map<String, String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_LxdEventLogging implements _LxdEventLogging {
  const _$_LxdEventLogging(
      {required this.message,
      required this.level,
      required final Map<String, String> context})
      : _context = context;

  factory _$_LxdEventLogging.fromJson(Map<String, dynamic> json) =>
      _$$_LxdEventLoggingFromJson(json);

  @override
  final String message;
  @override
  final String level;
  final Map<String, String> _context;
  @override
  Map<String, String> get context {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_context);
  }

  @override
  String toString() {
    return 'LxdEventLogging(message: $message, level: $level, context: $context)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LxdEventLogging &&
            const DeepCollectionEquality().equals(other.message, message) &&
            const DeepCollectionEquality().equals(other.level, level) &&
            const DeepCollectionEquality().equals(other._context, _context));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(message),
      const DeepCollectionEquality().hash(level),
      const DeepCollectionEquality().hash(_context));

  @JsonKey(ignore: true)
  @override
  _$$_LxdEventLoggingCopyWith<_$_LxdEventLogging> get copyWith =>
      __$$_LxdEventLoggingCopyWithImpl<_$_LxdEventLogging>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_LxdEventLoggingToJson(this);
  }
}

abstract class _LxdEventLogging implements LxdEventLogging {
  const factory _LxdEventLogging(
      {required final String message,
      required final String level,
      required final Map<String, String> context}) = _$_LxdEventLogging;

  factory _LxdEventLogging.fromJson(Map<String, dynamic> json) =
      _$_LxdEventLogging.fromJson;

  @override
  String get message => throw _privateConstructorUsedError;
  @override
  String get level => throw _privateConstructorUsedError;
  @override
  Map<String, String> get context => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_LxdEventLoggingCopyWith<_$_LxdEventLogging> get copyWith =>
      throw _privateConstructorUsedError;
}

LxdEventLifecycle _$LxdEventLifecycleFromJson(Map<String, dynamic> json) {
  return _LxdEventLifecycle.fromJson(json);
}

/// @nodoc
mixin _$LxdEventLifecycle {
  String get action => throw _privateConstructorUsedError;
  String get source => throw _privateConstructorUsedError;
  Map<String, dynamic>? get context => throw _privateConstructorUsedError;

  /// API extension: event_lifecycle_requestor
  LxdEventLifecycleRequestor? get requestor =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LxdEventLifecycleCopyWith<LxdEventLifecycle> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LxdEventLifecycleCopyWith<$Res> {
  factory $LxdEventLifecycleCopyWith(
          LxdEventLifecycle value, $Res Function(LxdEventLifecycle) then) =
      _$LxdEventLifecycleCopyWithImpl<$Res>;
  $Res call(
      {String action,
      String source,
      Map<String, dynamic>? context,
      LxdEventLifecycleRequestor? requestor});

  $LxdEventLifecycleRequestorCopyWith<$Res>? get requestor;
}

/// @nodoc
class _$LxdEventLifecycleCopyWithImpl<$Res>
    implements $LxdEventLifecycleCopyWith<$Res> {
  _$LxdEventLifecycleCopyWithImpl(this._value, this._then);

  final LxdEventLifecycle _value;
  // ignore: unused_field
  final $Res Function(LxdEventLifecycle) _then;

  @override
  $Res call({
    Object? action = freezed,
    Object? source = freezed,
    Object? context = freezed,
    Object? requestor = freezed,
  }) {
    return _then(_value.copyWith(
      action: action == freezed
          ? _value.action
          : action // ignore: cast_nullable_to_non_nullable
              as String,
      source: source == freezed
          ? _value.source
          : source // ignore: cast_nullable_to_non_nullable
              as String,
      context: context == freezed
          ? _value.context
          : context // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      requestor: requestor == freezed
          ? _value.requestor
          : requestor // ignore: cast_nullable_to_non_nullable
              as LxdEventLifecycleRequestor?,
    ));
  }

  @override
  $LxdEventLifecycleRequestorCopyWith<$Res>? get requestor {
    if (_value.requestor == null) {
      return null;
    }

    return $LxdEventLifecycleRequestorCopyWith<$Res>(_value.requestor!,
        (value) {
      return _then(_value.copyWith(requestor: value));
    });
  }
}

/// @nodoc
abstract class _$$_LxdEventLifecycleCopyWith<$Res>
    implements $LxdEventLifecycleCopyWith<$Res> {
  factory _$$_LxdEventLifecycleCopyWith(_$_LxdEventLifecycle value,
          $Res Function(_$_LxdEventLifecycle) then) =
      __$$_LxdEventLifecycleCopyWithImpl<$Res>;
  @override
  $Res call(
      {String action,
      String source,
      Map<String, dynamic>? context,
      LxdEventLifecycleRequestor? requestor});

  @override
  $LxdEventLifecycleRequestorCopyWith<$Res>? get requestor;
}

/// @nodoc
class __$$_LxdEventLifecycleCopyWithImpl<$Res>
    extends _$LxdEventLifecycleCopyWithImpl<$Res>
    implements _$$_LxdEventLifecycleCopyWith<$Res> {
  __$$_LxdEventLifecycleCopyWithImpl(
      _$_LxdEventLifecycle _value, $Res Function(_$_LxdEventLifecycle) _then)
      : super(_value, (v) => _then(v as _$_LxdEventLifecycle));

  @override
  _$_LxdEventLifecycle get _value => super._value as _$_LxdEventLifecycle;

  @override
  $Res call({
    Object? action = freezed,
    Object? source = freezed,
    Object? context = freezed,
    Object? requestor = freezed,
  }) {
    return _then(_$_LxdEventLifecycle(
      action: action == freezed
          ? _value.action
          : action // ignore: cast_nullable_to_non_nullable
              as String,
      source: source == freezed
          ? _value.source
          : source // ignore: cast_nullable_to_non_nullable
              as String,
      context: context == freezed
          ? _value._context
          : context // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      requestor: requestor == freezed
          ? _value.requestor
          : requestor // ignore: cast_nullable_to_non_nullable
              as LxdEventLifecycleRequestor?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_LxdEventLifecycle implements _LxdEventLifecycle {
  const _$_LxdEventLifecycle(
      {required this.action,
      required this.source,
      final Map<String, dynamic>? context,
      this.requestor})
      : _context = context;

  factory _$_LxdEventLifecycle.fromJson(Map<String, dynamic> json) =>
      _$$_LxdEventLifecycleFromJson(json);

  @override
  final String action;
  @override
  final String source;
  final Map<String, dynamic>? _context;
  @override
  Map<String, dynamic>? get context {
    final value = _context;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  /// API extension: event_lifecycle_requestor
  @override
  final LxdEventLifecycleRequestor? requestor;

  @override
  String toString() {
    return 'LxdEventLifecycle(action: $action, source: $source, context: $context, requestor: $requestor)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LxdEventLifecycle &&
            const DeepCollectionEquality().equals(other.action, action) &&
            const DeepCollectionEquality().equals(other.source, source) &&
            const DeepCollectionEquality().equals(other._context, _context) &&
            const DeepCollectionEquality().equals(other.requestor, requestor));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(action),
      const DeepCollectionEquality().hash(source),
      const DeepCollectionEquality().hash(_context),
      const DeepCollectionEquality().hash(requestor));

  @JsonKey(ignore: true)
  @override
  _$$_LxdEventLifecycleCopyWith<_$_LxdEventLifecycle> get copyWith =>
      __$$_LxdEventLifecycleCopyWithImpl<_$_LxdEventLifecycle>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_LxdEventLifecycleToJson(this);
  }
}

abstract class _LxdEventLifecycle implements LxdEventLifecycle {
  const factory _LxdEventLifecycle(
      {required final String action,
      required final String source,
      final Map<String, dynamic>? context,
      final LxdEventLifecycleRequestor? requestor}) = _$_LxdEventLifecycle;

  factory _LxdEventLifecycle.fromJson(Map<String, dynamic> json) =
      _$_LxdEventLifecycle.fromJson;

  @override
  String get action => throw _privateConstructorUsedError;
  @override
  String get source => throw _privateConstructorUsedError;
  @override
  Map<String, dynamic>? get context => throw _privateConstructorUsedError;
  @override

  /// API extension: event_lifecycle_requestor
  LxdEventLifecycleRequestor? get requestor =>
      throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_LxdEventLifecycleCopyWith<_$_LxdEventLifecycle> get copyWith =>
      throw _privateConstructorUsedError;
}

LxdEventLifecycleRequestor _$LxdEventLifecycleRequestorFromJson(
    Map<String, dynamic> json) {
  return _LxdEventLifecycleRequestor.fromJson(json);
}

/// @nodoc
mixin _$LxdEventLifecycleRequestor {
  String get username => throw _privateConstructorUsedError;
  String get protocol => throw _privateConstructorUsedError;

  /// Requestor address
  ///
  /// Example: 10.0.2.15
  ///
  /// API extension: event_lifecycle_requestor_address
  String get address => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LxdEventLifecycleRequestorCopyWith<LxdEventLifecycleRequestor>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LxdEventLifecycleRequestorCopyWith<$Res> {
  factory $LxdEventLifecycleRequestorCopyWith(LxdEventLifecycleRequestor value,
          $Res Function(LxdEventLifecycleRequestor) then) =
      _$LxdEventLifecycleRequestorCopyWithImpl<$Res>;
  $Res call({String username, String protocol, String address});
}

/// @nodoc
class _$LxdEventLifecycleRequestorCopyWithImpl<$Res>
    implements $LxdEventLifecycleRequestorCopyWith<$Res> {
  _$LxdEventLifecycleRequestorCopyWithImpl(this._value, this._then);

  final LxdEventLifecycleRequestor _value;
  // ignore: unused_field
  final $Res Function(LxdEventLifecycleRequestor) _then;

  @override
  $Res call({
    Object? username = freezed,
    Object? protocol = freezed,
    Object? address = freezed,
  }) {
    return _then(_value.copyWith(
      username: username == freezed
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      protocol: protocol == freezed
          ? _value.protocol
          : protocol // ignore: cast_nullable_to_non_nullable
              as String,
      address: address == freezed
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_LxdEventLifecycleRequestorCopyWith<$Res>
    implements $LxdEventLifecycleRequestorCopyWith<$Res> {
  factory _$$_LxdEventLifecycleRequestorCopyWith(
          _$_LxdEventLifecycleRequestor value,
          $Res Function(_$_LxdEventLifecycleRequestor) then) =
      __$$_LxdEventLifecycleRequestorCopyWithImpl<$Res>;
  @override
  $Res call({String username, String protocol, String address});
}

/// @nodoc
class __$$_LxdEventLifecycleRequestorCopyWithImpl<$Res>
    extends _$LxdEventLifecycleRequestorCopyWithImpl<$Res>
    implements _$$_LxdEventLifecycleRequestorCopyWith<$Res> {
  __$$_LxdEventLifecycleRequestorCopyWithImpl(
      _$_LxdEventLifecycleRequestor _value,
      $Res Function(_$_LxdEventLifecycleRequestor) _then)
      : super(_value, (v) => _then(v as _$_LxdEventLifecycleRequestor));

  @override
  _$_LxdEventLifecycleRequestor get _value =>
      super._value as _$_LxdEventLifecycleRequestor;

  @override
  $Res call({
    Object? username = freezed,
    Object? protocol = freezed,
    Object? address = freezed,
  }) {
    return _then(_$_LxdEventLifecycleRequestor(
      username: username == freezed
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      protocol: protocol == freezed
          ? _value.protocol
          : protocol // ignore: cast_nullable_to_non_nullable
              as String,
      address: address == freezed
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_LxdEventLifecycleRequestor implements _LxdEventLifecycleRequestor {
  const _$_LxdEventLifecycleRequestor(
      {required this.username, required this.protocol, required this.address});

  factory _$_LxdEventLifecycleRequestor.fromJson(Map<String, dynamic> json) =>
      _$$_LxdEventLifecycleRequestorFromJson(json);

  @override
  final String username;
  @override
  final String protocol;

  /// Requestor address
  ///
  /// Example: 10.0.2.15
  ///
  /// API extension: event_lifecycle_requestor_address
  @override
  final String address;

  @override
  String toString() {
    return 'LxdEventLifecycleRequestor(username: $username, protocol: $protocol, address: $address)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LxdEventLifecycleRequestor &&
            const DeepCollectionEquality().equals(other.username, username) &&
            const DeepCollectionEquality().equals(other.protocol, protocol) &&
            const DeepCollectionEquality().equals(other.address, address));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(username),
      const DeepCollectionEquality().hash(protocol),
      const DeepCollectionEquality().hash(address));

  @JsonKey(ignore: true)
  @override
  _$$_LxdEventLifecycleRequestorCopyWith<_$_LxdEventLifecycleRequestor>
      get copyWith => __$$_LxdEventLifecycleRequestorCopyWithImpl<
          _$_LxdEventLifecycleRequestor>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_LxdEventLifecycleRequestorToJson(this);
  }
}

abstract class _LxdEventLifecycleRequestor
    implements LxdEventLifecycleRequestor {
  const factory _LxdEventLifecycleRequestor(
      {required final String username,
      required final String protocol,
      required final String address}) = _$_LxdEventLifecycleRequestor;

  factory _LxdEventLifecycleRequestor.fromJson(Map<String, dynamic> json) =
      _$_LxdEventLifecycleRequestor.fromJson;

  @override
  String get username => throw _privateConstructorUsedError;
  @override
  String get protocol => throw _privateConstructorUsedError;
  @override

  /// Requestor address
  ///
  /// Example: 10.0.2.15
  ///
  /// API extension: event_lifecycle_requestor_address
  String get address => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_LxdEventLifecycleRequestorCopyWith<_$_LxdEventLifecycleRequestor>
      get copyWith => throw _privateConstructorUsedError;
}
