// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'instance_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

LxdInstanceState _$LxdInstanceStateFromJson(Map<String, dynamic> json) {
  return _LxdInstanceState.fromJson(json);
}

/// @nodoc
mixin _$LxdInstanceState {
  /// Current status
  LxdInstanceStatus get status => throw _privateConstructorUsedError;

  /// Numeric status code (101, 102, 110, 112)
  int get statusCode => throw _privateConstructorUsedError;

  /// Disk usage
  Map<String, LxdInstanceDiskState>? get disk =>
      throw _privateConstructorUsedError;

  /// Memory usage information
  LxdInstanceMemoryState? get memory => throw _privateConstructorUsedError;

  /// Network usage
  Map<String, LxdInstanceNetworkState>? get network =>
      throw _privateConstructorUsedError;

  /// PID of the runtime
  int get pid => throw _privateConstructorUsedError;

  /// Number of processes in the instance
  int get processes => throw _privateConstructorUsedError;

  /// CPU usage information
  LxdInstanceCpuState? get cpu => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LxdInstanceStateCopyWith<LxdInstanceState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LxdInstanceStateCopyWith<$Res> {
  factory $LxdInstanceStateCopyWith(
          LxdInstanceState value, $Res Function(LxdInstanceState) then) =
      _$LxdInstanceStateCopyWithImpl<$Res, LxdInstanceState>;
  @useResult
  $Res call(
      {LxdInstanceStatus status,
      int statusCode,
      Map<String, LxdInstanceDiskState>? disk,
      LxdInstanceMemoryState? memory,
      Map<String, LxdInstanceNetworkState>? network,
      int pid,
      int processes,
      LxdInstanceCpuState? cpu});

  $LxdInstanceMemoryStateCopyWith<$Res>? get memory;
  $LxdInstanceCpuStateCopyWith<$Res>? get cpu;
}

/// @nodoc
class _$LxdInstanceStateCopyWithImpl<$Res, $Val extends LxdInstanceState>
    implements $LxdInstanceStateCopyWith<$Res> {
  _$LxdInstanceStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? statusCode = null,
    Object? disk = freezed,
    Object? memory = freezed,
    Object? network = freezed,
    Object? pid = null,
    Object? processes = null,
    Object? cpu = freezed,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as LxdInstanceStatus,
      statusCode: null == statusCode
          ? _value.statusCode
          : statusCode // ignore: cast_nullable_to_non_nullable
              as int,
      disk: freezed == disk
          ? _value.disk
          : disk // ignore: cast_nullable_to_non_nullable
              as Map<String, LxdInstanceDiskState>?,
      memory: freezed == memory
          ? _value.memory
          : memory // ignore: cast_nullable_to_non_nullable
              as LxdInstanceMemoryState?,
      network: freezed == network
          ? _value.network
          : network // ignore: cast_nullable_to_non_nullable
              as Map<String, LxdInstanceNetworkState>?,
      pid: null == pid
          ? _value.pid
          : pid // ignore: cast_nullable_to_non_nullable
              as int,
      processes: null == processes
          ? _value.processes
          : processes // ignore: cast_nullable_to_non_nullable
              as int,
      cpu: freezed == cpu
          ? _value.cpu
          : cpu // ignore: cast_nullable_to_non_nullable
              as LxdInstanceCpuState?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $LxdInstanceMemoryStateCopyWith<$Res>? get memory {
    if (_value.memory == null) {
      return null;
    }

    return $LxdInstanceMemoryStateCopyWith<$Res>(_value.memory!, (value) {
      return _then(_value.copyWith(memory: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $LxdInstanceCpuStateCopyWith<$Res>? get cpu {
    if (_value.cpu == null) {
      return null;
    }

    return $LxdInstanceCpuStateCopyWith<$Res>(_value.cpu!, (value) {
      return _then(_value.copyWith(cpu: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_LxdInstanceStateCopyWith<$Res>
    implements $LxdInstanceStateCopyWith<$Res> {
  factory _$$_LxdInstanceStateCopyWith(
          _$_LxdInstanceState value, $Res Function(_$_LxdInstanceState) then) =
      __$$_LxdInstanceStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {LxdInstanceStatus status,
      int statusCode,
      Map<String, LxdInstanceDiskState>? disk,
      LxdInstanceMemoryState? memory,
      Map<String, LxdInstanceNetworkState>? network,
      int pid,
      int processes,
      LxdInstanceCpuState? cpu});

  @override
  $LxdInstanceMemoryStateCopyWith<$Res>? get memory;
  @override
  $LxdInstanceCpuStateCopyWith<$Res>? get cpu;
}

/// @nodoc
class __$$_LxdInstanceStateCopyWithImpl<$Res>
    extends _$LxdInstanceStateCopyWithImpl<$Res, _$_LxdInstanceState>
    implements _$$_LxdInstanceStateCopyWith<$Res> {
  __$$_LxdInstanceStateCopyWithImpl(
      _$_LxdInstanceState _value, $Res Function(_$_LxdInstanceState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? statusCode = null,
    Object? disk = freezed,
    Object? memory = freezed,
    Object? network = freezed,
    Object? pid = null,
    Object? processes = null,
    Object? cpu = freezed,
  }) {
    return _then(_$_LxdInstanceState(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as LxdInstanceStatus,
      statusCode: null == statusCode
          ? _value.statusCode
          : statusCode // ignore: cast_nullable_to_non_nullable
              as int,
      disk: freezed == disk
          ? _value._disk
          : disk // ignore: cast_nullable_to_non_nullable
              as Map<String, LxdInstanceDiskState>?,
      memory: freezed == memory
          ? _value.memory
          : memory // ignore: cast_nullable_to_non_nullable
              as LxdInstanceMemoryState?,
      network: freezed == network
          ? _value._network
          : network // ignore: cast_nullable_to_non_nullable
              as Map<String, LxdInstanceNetworkState>?,
      pid: null == pid
          ? _value.pid
          : pid // ignore: cast_nullable_to_non_nullable
              as int,
      processes: null == processes
          ? _value.processes
          : processes // ignore: cast_nullable_to_non_nullable
              as int,
      cpu: freezed == cpu
          ? _value.cpu
          : cpu // ignore: cast_nullable_to_non_nullable
              as LxdInstanceCpuState?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_LxdInstanceState implements _LxdInstanceState {
  const _$_LxdInstanceState(
      {required this.status,
      required this.statusCode,
      final Map<String, LxdInstanceDiskState>? disk,
      this.memory,
      final Map<String, LxdInstanceNetworkState>? network,
      required this.pid,
      this.processes = -1,
      this.cpu})
      : _disk = disk,
        _network = network;

  factory _$_LxdInstanceState.fromJson(Map<String, dynamic> json) =>
      _$$_LxdInstanceStateFromJson(json);

  /// Current status
  @override
  final LxdInstanceStatus status;

  /// Numeric status code (101, 102, 110, 112)
  @override
  final int statusCode;

  /// Disk usage
  final Map<String, LxdInstanceDiskState>? _disk;

  /// Disk usage
  @override
  Map<String, LxdInstanceDiskState>? get disk {
    final value = _disk;
    if (value == null) return null;
    if (_disk is EqualUnmodifiableMapView) return _disk;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  /// Memory usage information
  @override
  final LxdInstanceMemoryState? memory;

  /// Network usage
  final Map<String, LxdInstanceNetworkState>? _network;

  /// Network usage
  @override
  Map<String, LxdInstanceNetworkState>? get network {
    final value = _network;
    if (value == null) return null;
    if (_network is EqualUnmodifiableMapView) return _network;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  /// PID of the runtime
  @override
  final int pid;

  /// Number of processes in the instance
  @override
  @JsonKey()
  final int processes;

  /// CPU usage information
  @override
  final LxdInstanceCpuState? cpu;

  @override
  String toString() {
    return 'LxdInstanceState(status: $status, statusCode: $statusCode, disk: $disk, memory: $memory, network: $network, pid: $pid, processes: $processes, cpu: $cpu)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LxdInstanceState &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.statusCode, statusCode) ||
                other.statusCode == statusCode) &&
            const DeepCollectionEquality().equals(other._disk, _disk) &&
            (identical(other.memory, memory) || other.memory == memory) &&
            const DeepCollectionEquality().equals(other._network, _network) &&
            (identical(other.pid, pid) || other.pid == pid) &&
            (identical(other.processes, processes) ||
                other.processes == processes) &&
            (identical(other.cpu, cpu) || other.cpu == cpu));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      status,
      statusCode,
      const DeepCollectionEquality().hash(_disk),
      memory,
      const DeepCollectionEquality().hash(_network),
      pid,
      processes,
      cpu);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LxdInstanceStateCopyWith<_$_LxdInstanceState> get copyWith =>
      __$$_LxdInstanceStateCopyWithImpl<_$_LxdInstanceState>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_LxdInstanceStateToJson(
      this,
    );
  }
}

abstract class _LxdInstanceState implements LxdInstanceState {
  const factory _LxdInstanceState(
      {required final LxdInstanceStatus status,
      required final int statusCode,
      final Map<String, LxdInstanceDiskState>? disk,
      final LxdInstanceMemoryState? memory,
      final Map<String, LxdInstanceNetworkState>? network,
      required final int pid,
      final int processes,
      final LxdInstanceCpuState? cpu}) = _$_LxdInstanceState;

  factory _LxdInstanceState.fromJson(Map<String, dynamic> json) =
      _$_LxdInstanceState.fromJson;

  @override

  /// Current status
  LxdInstanceStatus get status;
  @override

  /// Numeric status code (101, 102, 110, 112)
  int get statusCode;
  @override

  /// Disk usage
  Map<String, LxdInstanceDiskState>? get disk;
  @override

  /// Memory usage information
  LxdInstanceMemoryState? get memory;
  @override

  /// Network usage
  Map<String, LxdInstanceNetworkState>? get network;
  @override

  /// PID of the runtime
  int get pid;
  @override

  /// Number of processes in the instance
  int get processes;
  @override

  /// CPU usage information
  LxdInstanceCpuState? get cpu;
  @override
  @JsonKey(ignore: true)
  _$$_LxdInstanceStateCopyWith<_$_LxdInstanceState> get copyWith =>
      throw _privateConstructorUsedError;
}

LxdInstanceDiskState _$LxdInstanceDiskStateFromJson(Map<String, dynamic> json) {
  return _LxdInstanceDiskState.fromJson(json);
}

/// @nodoc
mixin _$LxdInstanceDiskState {
  /// Disk usage in bytes
  ///
  /// Example: 502239232
  int get usage => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LxdInstanceDiskStateCopyWith<LxdInstanceDiskState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LxdInstanceDiskStateCopyWith<$Res> {
  factory $LxdInstanceDiskStateCopyWith(LxdInstanceDiskState value,
          $Res Function(LxdInstanceDiskState) then) =
      _$LxdInstanceDiskStateCopyWithImpl<$Res, LxdInstanceDiskState>;
  @useResult
  $Res call({int usage});
}

/// @nodoc
class _$LxdInstanceDiskStateCopyWithImpl<$Res,
        $Val extends LxdInstanceDiskState>
    implements $LxdInstanceDiskStateCopyWith<$Res> {
  _$LxdInstanceDiskStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? usage = null,
  }) {
    return _then(_value.copyWith(
      usage: null == usage
          ? _value.usage
          : usage // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_LxdInstanceDiskStateCopyWith<$Res>
    implements $LxdInstanceDiskStateCopyWith<$Res> {
  factory _$$_LxdInstanceDiskStateCopyWith(_$_LxdInstanceDiskState value,
          $Res Function(_$_LxdInstanceDiskState) then) =
      __$$_LxdInstanceDiskStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int usage});
}

/// @nodoc
class __$$_LxdInstanceDiskStateCopyWithImpl<$Res>
    extends _$LxdInstanceDiskStateCopyWithImpl<$Res, _$_LxdInstanceDiskState>
    implements _$$_LxdInstanceDiskStateCopyWith<$Res> {
  __$$_LxdInstanceDiskStateCopyWithImpl(_$_LxdInstanceDiskState _value,
      $Res Function(_$_LxdInstanceDiskState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? usage = null,
  }) {
    return _then(_$_LxdInstanceDiskState(
      usage: null == usage
          ? _value.usage
          : usage // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_LxdInstanceDiskState implements _LxdInstanceDiskState {
  const _$_LxdInstanceDiskState({required this.usage});

  factory _$_LxdInstanceDiskState.fromJson(Map<String, dynamic> json) =>
      _$$_LxdInstanceDiskStateFromJson(json);

  /// Disk usage in bytes
  ///
  /// Example: 502239232
  @override
  final int usage;

  @override
  String toString() {
    return 'LxdInstanceDiskState(usage: $usage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LxdInstanceDiskState &&
            (identical(other.usage, usage) || other.usage == usage));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, usage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LxdInstanceDiskStateCopyWith<_$_LxdInstanceDiskState> get copyWith =>
      __$$_LxdInstanceDiskStateCopyWithImpl<_$_LxdInstanceDiskState>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_LxdInstanceDiskStateToJson(
      this,
    );
  }
}

abstract class _LxdInstanceDiskState implements LxdInstanceDiskState {
  const factory _LxdInstanceDiskState({required final int usage}) =
      _$_LxdInstanceDiskState;

  factory _LxdInstanceDiskState.fromJson(Map<String, dynamic> json) =
      _$_LxdInstanceDiskState.fromJson;

  @override

  /// Disk usage in bytes
  ///
  /// Example: 502239232
  int get usage;
  @override
  @JsonKey(ignore: true)
  _$$_LxdInstanceDiskStateCopyWith<_$_LxdInstanceDiskState> get copyWith =>
      throw _privateConstructorUsedError;
}

LxdInstanceCpuState _$LxdInstanceCpuStateFromJson(Map<String, dynamic> json) {
  return _LxdInstanceCpuState.fromJson(json);
}

/// @nodoc
mixin _$LxdInstanceCpuState {
  /// CPU usage in nanoseconds
  ///
  /// Example: 3637691016
  int get usage => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LxdInstanceCpuStateCopyWith<LxdInstanceCpuState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LxdInstanceCpuStateCopyWith<$Res> {
  factory $LxdInstanceCpuStateCopyWith(
          LxdInstanceCpuState value, $Res Function(LxdInstanceCpuState) then) =
      _$LxdInstanceCpuStateCopyWithImpl<$Res, LxdInstanceCpuState>;
  @useResult
  $Res call({int usage});
}

/// @nodoc
class _$LxdInstanceCpuStateCopyWithImpl<$Res, $Val extends LxdInstanceCpuState>
    implements $LxdInstanceCpuStateCopyWith<$Res> {
  _$LxdInstanceCpuStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? usage = null,
  }) {
    return _then(_value.copyWith(
      usage: null == usage
          ? _value.usage
          : usage // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_LxdInstanceCpuStateCopyWith<$Res>
    implements $LxdInstanceCpuStateCopyWith<$Res> {
  factory _$$_LxdInstanceCpuStateCopyWith(_$_LxdInstanceCpuState value,
          $Res Function(_$_LxdInstanceCpuState) then) =
      __$$_LxdInstanceCpuStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int usage});
}

/// @nodoc
class __$$_LxdInstanceCpuStateCopyWithImpl<$Res>
    extends _$LxdInstanceCpuStateCopyWithImpl<$Res, _$_LxdInstanceCpuState>
    implements _$$_LxdInstanceCpuStateCopyWith<$Res> {
  __$$_LxdInstanceCpuStateCopyWithImpl(_$_LxdInstanceCpuState _value,
      $Res Function(_$_LxdInstanceCpuState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? usage = null,
  }) {
    return _then(_$_LxdInstanceCpuState(
      usage: null == usage
          ? _value.usage
          : usage // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_LxdInstanceCpuState implements _LxdInstanceCpuState {
  const _$_LxdInstanceCpuState({required this.usage});

  factory _$_LxdInstanceCpuState.fromJson(Map<String, dynamic> json) =>
      _$$_LxdInstanceCpuStateFromJson(json);

  /// CPU usage in nanoseconds
  ///
  /// Example: 3637691016
  @override
  final int usage;

  @override
  String toString() {
    return 'LxdInstanceCpuState(usage: $usage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LxdInstanceCpuState &&
            (identical(other.usage, usage) || other.usage == usage));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, usage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LxdInstanceCpuStateCopyWith<_$_LxdInstanceCpuState> get copyWith =>
      __$$_LxdInstanceCpuStateCopyWithImpl<_$_LxdInstanceCpuState>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_LxdInstanceCpuStateToJson(
      this,
    );
  }
}

abstract class _LxdInstanceCpuState implements LxdInstanceCpuState {
  const factory _LxdInstanceCpuState({required final int usage}) =
      _$_LxdInstanceCpuState;

  factory _LxdInstanceCpuState.fromJson(Map<String, dynamic> json) =
      _$_LxdInstanceCpuState.fromJson;

  @override

  /// CPU usage in nanoseconds
  ///
  /// Example: 3637691016
  int get usage;
  @override
  @JsonKey(ignore: true)
  _$$_LxdInstanceCpuStateCopyWith<_$_LxdInstanceCpuState> get copyWith =>
      throw _privateConstructorUsedError;
}

LxdInstanceMemoryState _$LxdInstanceMemoryStateFromJson(
    Map<String, dynamic> json) {
  return _LxdInstanceMemoryState.fromJson(json);
}

/// @nodoc
mixin _$LxdInstanceMemoryState {
  /// Memory usage in bytes
  ///
  /// Example: 73248768
  int get usage => throw _privateConstructorUsedError;

  /// Peak memory usage in bytes
  ///
  /// Example: 73785344
  int get usagePeak => throw _privateConstructorUsedError;

  /// SWAP usage in bytes
  ///
  /// Example: 12297557
  int get swapUsage => throw _privateConstructorUsedError;

  /// Peak SWAP usage in bytes
  ///
  /// Example: 12297557
  int get swapUsagePeak => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LxdInstanceMemoryStateCopyWith<LxdInstanceMemoryState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LxdInstanceMemoryStateCopyWith<$Res> {
  factory $LxdInstanceMemoryStateCopyWith(LxdInstanceMemoryState value,
          $Res Function(LxdInstanceMemoryState) then) =
      _$LxdInstanceMemoryStateCopyWithImpl<$Res, LxdInstanceMemoryState>;
  @useResult
  $Res call({int usage, int usagePeak, int swapUsage, int swapUsagePeak});
}

/// @nodoc
class _$LxdInstanceMemoryStateCopyWithImpl<$Res,
        $Val extends LxdInstanceMemoryState>
    implements $LxdInstanceMemoryStateCopyWith<$Res> {
  _$LxdInstanceMemoryStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? usage = null,
    Object? usagePeak = null,
    Object? swapUsage = null,
    Object? swapUsagePeak = null,
  }) {
    return _then(_value.copyWith(
      usage: null == usage
          ? _value.usage
          : usage // ignore: cast_nullable_to_non_nullable
              as int,
      usagePeak: null == usagePeak
          ? _value.usagePeak
          : usagePeak // ignore: cast_nullable_to_non_nullable
              as int,
      swapUsage: null == swapUsage
          ? _value.swapUsage
          : swapUsage // ignore: cast_nullable_to_non_nullable
              as int,
      swapUsagePeak: null == swapUsagePeak
          ? _value.swapUsagePeak
          : swapUsagePeak // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_LxdInstanceMemoryStateCopyWith<$Res>
    implements $LxdInstanceMemoryStateCopyWith<$Res> {
  factory _$$_LxdInstanceMemoryStateCopyWith(_$_LxdInstanceMemoryState value,
          $Res Function(_$_LxdInstanceMemoryState) then) =
      __$$_LxdInstanceMemoryStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int usage, int usagePeak, int swapUsage, int swapUsagePeak});
}

/// @nodoc
class __$$_LxdInstanceMemoryStateCopyWithImpl<$Res>
    extends _$LxdInstanceMemoryStateCopyWithImpl<$Res,
        _$_LxdInstanceMemoryState>
    implements _$$_LxdInstanceMemoryStateCopyWith<$Res> {
  __$$_LxdInstanceMemoryStateCopyWithImpl(_$_LxdInstanceMemoryState _value,
      $Res Function(_$_LxdInstanceMemoryState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? usage = null,
    Object? usagePeak = null,
    Object? swapUsage = null,
    Object? swapUsagePeak = null,
  }) {
    return _then(_$_LxdInstanceMemoryState(
      usage: null == usage
          ? _value.usage
          : usage // ignore: cast_nullable_to_non_nullable
              as int,
      usagePeak: null == usagePeak
          ? _value.usagePeak
          : usagePeak // ignore: cast_nullable_to_non_nullable
              as int,
      swapUsage: null == swapUsage
          ? _value.swapUsage
          : swapUsage // ignore: cast_nullable_to_non_nullable
              as int,
      swapUsagePeak: null == swapUsagePeak
          ? _value.swapUsagePeak
          : swapUsagePeak // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_LxdInstanceMemoryState implements _LxdInstanceMemoryState {
  const _$_LxdInstanceMemoryState(
      {required this.usage,
      required this.usagePeak,
      required this.swapUsage,
      required this.swapUsagePeak});

  factory _$_LxdInstanceMemoryState.fromJson(Map<String, dynamic> json) =>
      _$$_LxdInstanceMemoryStateFromJson(json);

  /// Memory usage in bytes
  ///
  /// Example: 73248768
  @override
  final int usage;

  /// Peak memory usage in bytes
  ///
  /// Example: 73785344
  @override
  final int usagePeak;

  /// SWAP usage in bytes
  ///
  /// Example: 12297557
  @override
  final int swapUsage;

  /// Peak SWAP usage in bytes
  ///
  /// Example: 12297557
  @override
  final int swapUsagePeak;

  @override
  String toString() {
    return 'LxdInstanceMemoryState(usage: $usage, usagePeak: $usagePeak, swapUsage: $swapUsage, swapUsagePeak: $swapUsagePeak)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LxdInstanceMemoryState &&
            (identical(other.usage, usage) || other.usage == usage) &&
            (identical(other.usagePeak, usagePeak) ||
                other.usagePeak == usagePeak) &&
            (identical(other.swapUsage, swapUsage) ||
                other.swapUsage == swapUsage) &&
            (identical(other.swapUsagePeak, swapUsagePeak) ||
                other.swapUsagePeak == swapUsagePeak));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, usage, usagePeak, swapUsage, swapUsagePeak);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LxdInstanceMemoryStateCopyWith<_$_LxdInstanceMemoryState> get copyWith =>
      __$$_LxdInstanceMemoryStateCopyWithImpl<_$_LxdInstanceMemoryState>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_LxdInstanceMemoryStateToJson(
      this,
    );
  }
}

abstract class _LxdInstanceMemoryState implements LxdInstanceMemoryState {
  const factory _LxdInstanceMemoryState(
      {required final int usage,
      required final int usagePeak,
      required final int swapUsage,
      required final int swapUsagePeak}) = _$_LxdInstanceMemoryState;

  factory _LxdInstanceMemoryState.fromJson(Map<String, dynamic> json) =
      _$_LxdInstanceMemoryState.fromJson;

  @override

  /// Memory usage in bytes
  ///
  /// Example: 73248768
  int get usage;
  @override

  /// Peak memory usage in bytes
  ///
  /// Example: 73785344
  int get usagePeak;
  @override

  /// SWAP usage in bytes
  ///
  /// Example: 12297557
  int get swapUsage;
  @override

  /// Peak SWAP usage in bytes
  ///
  /// Example: 12297557
  int get swapUsagePeak;
  @override
  @JsonKey(ignore: true)
  _$$_LxdInstanceMemoryStateCopyWith<_$_LxdInstanceMemoryState> get copyWith =>
      throw _privateConstructorUsedError;
}

LxdInstanceNetworkState _$LxdInstanceNetworkStateFromJson(
    Map<String, dynamic> json) {
  return _LxdInstanceNetworkState.fromJson(json);
}

/// @nodoc
mixin _$LxdInstanceNetworkState {
  /// List of IP addresses
  List<LxdInstanceNetworkAddress> get addresses =>
      throw _privateConstructorUsedError;

  /// Traffic counters
  LxdInstanceNetworkCounters get counters => throw _privateConstructorUsedError;

  /// MAC address
  ///
  /// Example: 00:16:3e:0c:ee:dd
  String get hwaddr => throw _privateConstructorUsedError;

  /// Name of the interface on the host
  ///
  /// Example: vethbbcd39c7
  String get hostName => throw _privateConstructorUsedError;

  /// MTU (maximum transmit unit) for the interface
  ///
  /// Example: 1500
  int get mtu => throw _privateConstructorUsedError;

  /// Administrative state of the interface (up/down)
  ///
  /// Example: up
  String get state => throw _privateConstructorUsedError;

  /// Type of interface (broadcast, loopback, point-to-point, ...)
  ///
  /// Example: broadcast
  String get type => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LxdInstanceNetworkStateCopyWith<LxdInstanceNetworkState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LxdInstanceNetworkStateCopyWith<$Res> {
  factory $LxdInstanceNetworkStateCopyWith(LxdInstanceNetworkState value,
          $Res Function(LxdInstanceNetworkState) then) =
      _$LxdInstanceNetworkStateCopyWithImpl<$Res, LxdInstanceNetworkState>;
  @useResult
  $Res call(
      {List<LxdInstanceNetworkAddress> addresses,
      LxdInstanceNetworkCounters counters,
      String hwaddr,
      String hostName,
      int mtu,
      String state,
      String type});

  $LxdInstanceNetworkCountersCopyWith<$Res> get counters;
}

/// @nodoc
class _$LxdInstanceNetworkStateCopyWithImpl<$Res,
        $Val extends LxdInstanceNetworkState>
    implements $LxdInstanceNetworkStateCopyWith<$Res> {
  _$LxdInstanceNetworkStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? addresses = null,
    Object? counters = null,
    Object? hwaddr = null,
    Object? hostName = null,
    Object? mtu = null,
    Object? state = null,
    Object? type = null,
  }) {
    return _then(_value.copyWith(
      addresses: null == addresses
          ? _value.addresses
          : addresses // ignore: cast_nullable_to_non_nullable
              as List<LxdInstanceNetworkAddress>,
      counters: null == counters
          ? _value.counters
          : counters // ignore: cast_nullable_to_non_nullable
              as LxdInstanceNetworkCounters,
      hwaddr: null == hwaddr
          ? _value.hwaddr
          : hwaddr // ignore: cast_nullable_to_non_nullable
              as String,
      hostName: null == hostName
          ? _value.hostName
          : hostName // ignore: cast_nullable_to_non_nullable
              as String,
      mtu: null == mtu
          ? _value.mtu
          : mtu // ignore: cast_nullable_to_non_nullable
              as int,
      state: null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $LxdInstanceNetworkCountersCopyWith<$Res> get counters {
    return $LxdInstanceNetworkCountersCopyWith<$Res>(_value.counters, (value) {
      return _then(_value.copyWith(counters: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_LxdInstanceNetworkStateCopyWith<$Res>
    implements $LxdInstanceNetworkStateCopyWith<$Res> {
  factory _$$_LxdInstanceNetworkStateCopyWith(_$_LxdInstanceNetworkState value,
          $Res Function(_$_LxdInstanceNetworkState) then) =
      __$$_LxdInstanceNetworkStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<LxdInstanceNetworkAddress> addresses,
      LxdInstanceNetworkCounters counters,
      String hwaddr,
      String hostName,
      int mtu,
      String state,
      String type});

  @override
  $LxdInstanceNetworkCountersCopyWith<$Res> get counters;
}

/// @nodoc
class __$$_LxdInstanceNetworkStateCopyWithImpl<$Res>
    extends _$LxdInstanceNetworkStateCopyWithImpl<$Res,
        _$_LxdInstanceNetworkState>
    implements _$$_LxdInstanceNetworkStateCopyWith<$Res> {
  __$$_LxdInstanceNetworkStateCopyWithImpl(_$_LxdInstanceNetworkState _value,
      $Res Function(_$_LxdInstanceNetworkState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? addresses = null,
    Object? counters = null,
    Object? hwaddr = null,
    Object? hostName = null,
    Object? mtu = null,
    Object? state = null,
    Object? type = null,
  }) {
    return _then(_$_LxdInstanceNetworkState(
      addresses: null == addresses
          ? _value._addresses
          : addresses // ignore: cast_nullable_to_non_nullable
              as List<LxdInstanceNetworkAddress>,
      counters: null == counters
          ? _value.counters
          : counters // ignore: cast_nullable_to_non_nullable
              as LxdInstanceNetworkCounters,
      hwaddr: null == hwaddr
          ? _value.hwaddr
          : hwaddr // ignore: cast_nullable_to_non_nullable
              as String,
      hostName: null == hostName
          ? _value.hostName
          : hostName // ignore: cast_nullable_to_non_nullable
              as String,
      mtu: null == mtu
          ? _value.mtu
          : mtu // ignore: cast_nullable_to_non_nullable
              as int,
      state: null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_LxdInstanceNetworkState implements _LxdInstanceNetworkState {
  const _$_LxdInstanceNetworkState(
      {required final List<LxdInstanceNetworkAddress> addresses,
      required this.counters,
      required this.hwaddr,
      required this.hostName,
      required this.mtu,
      required this.state,
      required this.type})
      : _addresses = addresses;

  factory _$_LxdInstanceNetworkState.fromJson(Map<String, dynamic> json) =>
      _$$_LxdInstanceNetworkStateFromJson(json);

  /// List of IP addresses
  final List<LxdInstanceNetworkAddress> _addresses;

  /// List of IP addresses
  @override
  List<LxdInstanceNetworkAddress> get addresses {
    if (_addresses is EqualUnmodifiableListView) return _addresses;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_addresses);
  }

  /// Traffic counters
  @override
  final LxdInstanceNetworkCounters counters;

  /// MAC address
  ///
  /// Example: 00:16:3e:0c:ee:dd
  @override
  final String hwaddr;

  /// Name of the interface on the host
  ///
  /// Example: vethbbcd39c7
  @override
  final String hostName;

  /// MTU (maximum transmit unit) for the interface
  ///
  /// Example: 1500
  @override
  final int mtu;

  /// Administrative state of the interface (up/down)
  ///
  /// Example: up
  @override
  final String state;

  /// Type of interface (broadcast, loopback, point-to-point, ...)
  ///
  /// Example: broadcast
  @override
  final String type;

  @override
  String toString() {
    return 'LxdInstanceNetworkState(addresses: $addresses, counters: $counters, hwaddr: $hwaddr, hostName: $hostName, mtu: $mtu, state: $state, type: $type)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LxdInstanceNetworkState &&
            const DeepCollectionEquality()
                .equals(other._addresses, _addresses) &&
            (identical(other.counters, counters) ||
                other.counters == counters) &&
            (identical(other.hwaddr, hwaddr) || other.hwaddr == hwaddr) &&
            (identical(other.hostName, hostName) ||
                other.hostName == hostName) &&
            (identical(other.mtu, mtu) || other.mtu == mtu) &&
            (identical(other.state, state) || other.state == state) &&
            (identical(other.type, type) || other.type == type));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_addresses),
      counters,
      hwaddr,
      hostName,
      mtu,
      state,
      type);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LxdInstanceNetworkStateCopyWith<_$_LxdInstanceNetworkState>
      get copyWith =>
          __$$_LxdInstanceNetworkStateCopyWithImpl<_$_LxdInstanceNetworkState>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_LxdInstanceNetworkStateToJson(
      this,
    );
  }
}

abstract class _LxdInstanceNetworkState implements LxdInstanceNetworkState {
  const factory _LxdInstanceNetworkState(
      {required final List<LxdInstanceNetworkAddress> addresses,
      required final LxdInstanceNetworkCounters counters,
      required final String hwaddr,
      required final String hostName,
      required final int mtu,
      required final String state,
      required final String type}) = _$_LxdInstanceNetworkState;

  factory _LxdInstanceNetworkState.fromJson(Map<String, dynamic> json) =
      _$_LxdInstanceNetworkState.fromJson;

  @override

  /// List of IP addresses
  List<LxdInstanceNetworkAddress> get addresses;
  @override

  /// Traffic counters
  LxdInstanceNetworkCounters get counters;
  @override

  /// MAC address
  ///
  /// Example: 00:16:3e:0c:ee:dd
  String get hwaddr;
  @override

  /// Name of the interface on the host
  ///
  /// Example: vethbbcd39c7
  String get hostName;
  @override

  /// MTU (maximum transmit unit) for the interface
  ///
  /// Example: 1500
  int get mtu;
  @override

  /// Administrative state of the interface (up/down)
  ///
  /// Example: up
  String get state;
  @override

  /// Type of interface (broadcast, loopback, point-to-point, ...)
  ///
  /// Example: broadcast
  String get type;
  @override
  @JsonKey(ignore: true)
  _$$_LxdInstanceNetworkStateCopyWith<_$_LxdInstanceNetworkState>
      get copyWith => throw _privateConstructorUsedError;
}

LxdInstanceNetworkAddress _$LxdInstanceNetworkAddressFromJson(
    Map<String, dynamic> json) {
  return _LxdInstanceNetworkAddress.fromJson(json);
}

/// @nodoc
mixin _$LxdInstanceNetworkAddress {
  /// Network family
  LxdNetworkFamily get family => throw _privateConstructorUsedError;

  /// IP address
  ///
  /// Example: fd42:4c81:5770:1eaf:216:3eff:fe0c:eedd
  String get address => throw _privateConstructorUsedError;

  /// Network mask
  ///
  /// Example: 64
  String get netmask => throw _privateConstructorUsedError;

  /// Address scope
  LxdNetworkScope get scope => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LxdInstanceNetworkAddressCopyWith<LxdInstanceNetworkAddress> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LxdInstanceNetworkAddressCopyWith<$Res> {
  factory $LxdInstanceNetworkAddressCopyWith(LxdInstanceNetworkAddress value,
          $Res Function(LxdInstanceNetworkAddress) then) =
      _$LxdInstanceNetworkAddressCopyWithImpl<$Res, LxdInstanceNetworkAddress>;
  @useResult
  $Res call(
      {LxdNetworkFamily family,
      String address,
      String netmask,
      LxdNetworkScope scope});
}

/// @nodoc
class _$LxdInstanceNetworkAddressCopyWithImpl<$Res,
        $Val extends LxdInstanceNetworkAddress>
    implements $LxdInstanceNetworkAddressCopyWith<$Res> {
  _$LxdInstanceNetworkAddressCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? family = null,
    Object? address = null,
    Object? netmask = null,
    Object? scope = null,
  }) {
    return _then(_value.copyWith(
      family: null == family
          ? _value.family
          : family // ignore: cast_nullable_to_non_nullable
              as LxdNetworkFamily,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      netmask: null == netmask
          ? _value.netmask
          : netmask // ignore: cast_nullable_to_non_nullable
              as String,
      scope: null == scope
          ? _value.scope
          : scope // ignore: cast_nullable_to_non_nullable
              as LxdNetworkScope,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_LxdInstanceNetworkAddressCopyWith<$Res>
    implements $LxdInstanceNetworkAddressCopyWith<$Res> {
  factory _$$_LxdInstanceNetworkAddressCopyWith(
          _$_LxdInstanceNetworkAddress value,
          $Res Function(_$_LxdInstanceNetworkAddress) then) =
      __$$_LxdInstanceNetworkAddressCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {LxdNetworkFamily family,
      String address,
      String netmask,
      LxdNetworkScope scope});
}

/// @nodoc
class __$$_LxdInstanceNetworkAddressCopyWithImpl<$Res>
    extends _$LxdInstanceNetworkAddressCopyWithImpl<$Res,
        _$_LxdInstanceNetworkAddress>
    implements _$$_LxdInstanceNetworkAddressCopyWith<$Res> {
  __$$_LxdInstanceNetworkAddressCopyWithImpl(
      _$_LxdInstanceNetworkAddress _value,
      $Res Function(_$_LxdInstanceNetworkAddress) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? family = null,
    Object? address = null,
    Object? netmask = null,
    Object? scope = null,
  }) {
    return _then(_$_LxdInstanceNetworkAddress(
      family: null == family
          ? _value.family
          : family // ignore: cast_nullable_to_non_nullable
              as LxdNetworkFamily,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      netmask: null == netmask
          ? _value.netmask
          : netmask // ignore: cast_nullable_to_non_nullable
              as String,
      scope: null == scope
          ? _value.scope
          : scope // ignore: cast_nullable_to_non_nullable
              as LxdNetworkScope,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_LxdInstanceNetworkAddress implements _LxdInstanceNetworkAddress {
  const _$_LxdInstanceNetworkAddress(
      {required this.family,
      required this.address,
      required this.netmask,
      required this.scope});

  factory _$_LxdInstanceNetworkAddress.fromJson(Map<String, dynamic> json) =>
      _$$_LxdInstanceNetworkAddressFromJson(json);

  /// Network family
  @override
  final LxdNetworkFamily family;

  /// IP address
  ///
  /// Example: fd42:4c81:5770:1eaf:216:3eff:fe0c:eedd
  @override
  final String address;

  /// Network mask
  ///
  /// Example: 64
  @override
  final String netmask;

  /// Address scope
  @override
  final LxdNetworkScope scope;

  @override
  String toString() {
    return 'LxdInstanceNetworkAddress(family: $family, address: $address, netmask: $netmask, scope: $scope)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LxdInstanceNetworkAddress &&
            (identical(other.family, family) || other.family == family) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.netmask, netmask) || other.netmask == netmask) &&
            (identical(other.scope, scope) || other.scope == scope));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, family, address, netmask, scope);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LxdInstanceNetworkAddressCopyWith<_$_LxdInstanceNetworkAddress>
      get copyWith => __$$_LxdInstanceNetworkAddressCopyWithImpl<
          _$_LxdInstanceNetworkAddress>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_LxdInstanceNetworkAddressToJson(
      this,
    );
  }
}

abstract class _LxdInstanceNetworkAddress implements LxdInstanceNetworkAddress {
  const factory _LxdInstanceNetworkAddress(
      {required final LxdNetworkFamily family,
      required final String address,
      required final String netmask,
      required final LxdNetworkScope scope}) = _$_LxdInstanceNetworkAddress;

  factory _LxdInstanceNetworkAddress.fromJson(Map<String, dynamic> json) =
      _$_LxdInstanceNetworkAddress.fromJson;

  @override

  /// Network family
  LxdNetworkFamily get family;
  @override

  /// IP address
  ///
  /// Example: fd42:4c81:5770:1eaf:216:3eff:fe0c:eedd
  String get address;
  @override

  /// Network mask
  ///
  /// Example: 64
  String get netmask;
  @override

  /// Address scope
  LxdNetworkScope get scope;
  @override
  @JsonKey(ignore: true)
  _$$_LxdInstanceNetworkAddressCopyWith<_$_LxdInstanceNetworkAddress>
      get copyWith => throw _privateConstructorUsedError;
}

LxdInstanceNetworkCounters _$LxdInstanceNetworkCountersFromJson(
    Map<String, dynamic> json) {
  return _LxdInstanceNetworkCounters.fromJson(json);
}

/// @nodoc
mixin _$LxdInstanceNetworkCounters {
  /// Number of bytes received
  ///
  /// Example: 192021
  int get bytesReceived => throw _privateConstructorUsedError;

  /// Number of bytes sent
  ///
  /// Example: 10888579
  int get bytesSent => throw _privateConstructorUsedError;

  /// Number of packets received
  ///
  /// Example: 1748
  int get packetsReceived => throw _privateConstructorUsedError;

  /// Number of packets sent
  ///
  /// Example: 964
  int get packetsSent => throw _privateConstructorUsedError;

  /// Number of errors received
  ///
  /// Example: 14
  int get errorsReceived => throw _privateConstructorUsedError;

  /// Number of errors sent
  ///
  /// Example: 41
  int get errorsSent => throw _privateConstructorUsedError;

  /// Number of outbound packets dropped
  ///
  /// Example: 541
  int get packetsDroppedOutbound => throw _privateConstructorUsedError;

  /// Number of inbound packets dropped
  ///
  /// Example: 179
  int get packetsDroppedInbound => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LxdInstanceNetworkCountersCopyWith<LxdInstanceNetworkCounters>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LxdInstanceNetworkCountersCopyWith<$Res> {
  factory $LxdInstanceNetworkCountersCopyWith(LxdInstanceNetworkCounters value,
          $Res Function(LxdInstanceNetworkCounters) then) =
      _$LxdInstanceNetworkCountersCopyWithImpl<$Res,
          LxdInstanceNetworkCounters>;
  @useResult
  $Res call(
      {int bytesReceived,
      int bytesSent,
      int packetsReceived,
      int packetsSent,
      int errorsReceived,
      int errorsSent,
      int packetsDroppedOutbound,
      int packetsDroppedInbound});
}

/// @nodoc
class _$LxdInstanceNetworkCountersCopyWithImpl<$Res,
        $Val extends LxdInstanceNetworkCounters>
    implements $LxdInstanceNetworkCountersCopyWith<$Res> {
  _$LxdInstanceNetworkCountersCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bytesReceived = null,
    Object? bytesSent = null,
    Object? packetsReceived = null,
    Object? packetsSent = null,
    Object? errorsReceived = null,
    Object? errorsSent = null,
    Object? packetsDroppedOutbound = null,
    Object? packetsDroppedInbound = null,
  }) {
    return _then(_value.copyWith(
      bytesReceived: null == bytesReceived
          ? _value.bytesReceived
          : bytesReceived // ignore: cast_nullable_to_non_nullable
              as int,
      bytesSent: null == bytesSent
          ? _value.bytesSent
          : bytesSent // ignore: cast_nullable_to_non_nullable
              as int,
      packetsReceived: null == packetsReceived
          ? _value.packetsReceived
          : packetsReceived // ignore: cast_nullable_to_non_nullable
              as int,
      packetsSent: null == packetsSent
          ? _value.packetsSent
          : packetsSent // ignore: cast_nullable_to_non_nullable
              as int,
      errorsReceived: null == errorsReceived
          ? _value.errorsReceived
          : errorsReceived // ignore: cast_nullable_to_non_nullable
              as int,
      errorsSent: null == errorsSent
          ? _value.errorsSent
          : errorsSent // ignore: cast_nullable_to_non_nullable
              as int,
      packetsDroppedOutbound: null == packetsDroppedOutbound
          ? _value.packetsDroppedOutbound
          : packetsDroppedOutbound // ignore: cast_nullable_to_non_nullable
              as int,
      packetsDroppedInbound: null == packetsDroppedInbound
          ? _value.packetsDroppedInbound
          : packetsDroppedInbound // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_LxdInstanceNetworkCountersCopyWith<$Res>
    implements $LxdInstanceNetworkCountersCopyWith<$Res> {
  factory _$$_LxdInstanceNetworkCountersCopyWith(
          _$_LxdInstanceNetworkCounters value,
          $Res Function(_$_LxdInstanceNetworkCounters) then) =
      __$$_LxdInstanceNetworkCountersCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int bytesReceived,
      int bytesSent,
      int packetsReceived,
      int packetsSent,
      int errorsReceived,
      int errorsSent,
      int packetsDroppedOutbound,
      int packetsDroppedInbound});
}

/// @nodoc
class __$$_LxdInstanceNetworkCountersCopyWithImpl<$Res>
    extends _$LxdInstanceNetworkCountersCopyWithImpl<$Res,
        _$_LxdInstanceNetworkCounters>
    implements _$$_LxdInstanceNetworkCountersCopyWith<$Res> {
  __$$_LxdInstanceNetworkCountersCopyWithImpl(
      _$_LxdInstanceNetworkCounters _value,
      $Res Function(_$_LxdInstanceNetworkCounters) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bytesReceived = null,
    Object? bytesSent = null,
    Object? packetsReceived = null,
    Object? packetsSent = null,
    Object? errorsReceived = null,
    Object? errorsSent = null,
    Object? packetsDroppedOutbound = null,
    Object? packetsDroppedInbound = null,
  }) {
    return _then(_$_LxdInstanceNetworkCounters(
      bytesReceived: null == bytesReceived
          ? _value.bytesReceived
          : bytesReceived // ignore: cast_nullable_to_non_nullable
              as int,
      bytesSent: null == bytesSent
          ? _value.bytesSent
          : bytesSent // ignore: cast_nullable_to_non_nullable
              as int,
      packetsReceived: null == packetsReceived
          ? _value.packetsReceived
          : packetsReceived // ignore: cast_nullable_to_non_nullable
              as int,
      packetsSent: null == packetsSent
          ? _value.packetsSent
          : packetsSent // ignore: cast_nullable_to_non_nullable
              as int,
      errorsReceived: null == errorsReceived
          ? _value.errorsReceived
          : errorsReceived // ignore: cast_nullable_to_non_nullable
              as int,
      errorsSent: null == errorsSent
          ? _value.errorsSent
          : errorsSent // ignore: cast_nullable_to_non_nullable
              as int,
      packetsDroppedOutbound: null == packetsDroppedOutbound
          ? _value.packetsDroppedOutbound
          : packetsDroppedOutbound // ignore: cast_nullable_to_non_nullable
              as int,
      packetsDroppedInbound: null == packetsDroppedInbound
          ? _value.packetsDroppedInbound
          : packetsDroppedInbound // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_LxdInstanceNetworkCounters implements _LxdInstanceNetworkCounters {
  const _$_LxdInstanceNetworkCounters(
      {required this.bytesReceived,
      required this.bytesSent,
      required this.packetsReceived,
      required this.packetsSent,
      required this.errorsReceived,
      required this.errorsSent,
      required this.packetsDroppedOutbound,
      required this.packetsDroppedInbound});

  factory _$_LxdInstanceNetworkCounters.fromJson(Map<String, dynamic> json) =>
      _$$_LxdInstanceNetworkCountersFromJson(json);

  /// Number of bytes received
  ///
  /// Example: 192021
  @override
  final int bytesReceived;

  /// Number of bytes sent
  ///
  /// Example: 10888579
  @override
  final int bytesSent;

  /// Number of packets received
  ///
  /// Example: 1748
  @override
  final int packetsReceived;

  /// Number of packets sent
  ///
  /// Example: 964
  @override
  final int packetsSent;

  /// Number of errors received
  ///
  /// Example: 14
  @override
  final int errorsReceived;

  /// Number of errors sent
  ///
  /// Example: 41
  @override
  final int errorsSent;

  /// Number of outbound packets dropped
  ///
  /// Example: 541
  @override
  final int packetsDroppedOutbound;

  /// Number of inbound packets dropped
  ///
  /// Example: 179
  @override
  final int packetsDroppedInbound;

  @override
  String toString() {
    return 'LxdInstanceNetworkCounters(bytesReceived: $bytesReceived, bytesSent: $bytesSent, packetsReceived: $packetsReceived, packetsSent: $packetsSent, errorsReceived: $errorsReceived, errorsSent: $errorsSent, packetsDroppedOutbound: $packetsDroppedOutbound, packetsDroppedInbound: $packetsDroppedInbound)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LxdInstanceNetworkCounters &&
            (identical(other.bytesReceived, bytesReceived) ||
                other.bytesReceived == bytesReceived) &&
            (identical(other.bytesSent, bytesSent) ||
                other.bytesSent == bytesSent) &&
            (identical(other.packetsReceived, packetsReceived) ||
                other.packetsReceived == packetsReceived) &&
            (identical(other.packetsSent, packetsSent) ||
                other.packetsSent == packetsSent) &&
            (identical(other.errorsReceived, errorsReceived) ||
                other.errorsReceived == errorsReceived) &&
            (identical(other.errorsSent, errorsSent) ||
                other.errorsSent == errorsSent) &&
            (identical(other.packetsDroppedOutbound, packetsDroppedOutbound) ||
                other.packetsDroppedOutbound == packetsDroppedOutbound) &&
            (identical(other.packetsDroppedInbound, packetsDroppedInbound) ||
                other.packetsDroppedInbound == packetsDroppedInbound));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      bytesReceived,
      bytesSent,
      packetsReceived,
      packetsSent,
      errorsReceived,
      errorsSent,
      packetsDroppedOutbound,
      packetsDroppedInbound);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LxdInstanceNetworkCountersCopyWith<_$_LxdInstanceNetworkCounters>
      get copyWith => __$$_LxdInstanceNetworkCountersCopyWithImpl<
          _$_LxdInstanceNetworkCounters>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_LxdInstanceNetworkCountersToJson(
      this,
    );
  }
}

abstract class _LxdInstanceNetworkCounters
    implements LxdInstanceNetworkCounters {
  const factory _LxdInstanceNetworkCounters(
          {required final int bytesReceived,
          required final int bytesSent,
          required final int packetsReceived,
          required final int packetsSent,
          required final int errorsReceived,
          required final int errorsSent,
          required final int packetsDroppedOutbound,
          required final int packetsDroppedInbound}) =
      _$_LxdInstanceNetworkCounters;

  factory _LxdInstanceNetworkCounters.fromJson(Map<String, dynamic> json) =
      _$_LxdInstanceNetworkCounters.fromJson;

  @override

  /// Number of bytes received
  ///
  /// Example: 192021
  int get bytesReceived;
  @override

  /// Number of bytes sent
  ///
  /// Example: 10888579
  int get bytesSent;
  @override

  /// Number of packets received
  ///
  /// Example: 1748
  int get packetsReceived;
  @override

  /// Number of packets sent
  ///
  /// Example: 964
  int get packetsSent;
  @override

  /// Number of errors received
  ///
  /// Example: 14
  int get errorsReceived;
  @override

  /// Number of errors sent
  ///
  /// Example: 41
  int get errorsSent;
  @override

  /// Number of outbound packets dropped
  ///
  /// Example: 541
  int get packetsDroppedOutbound;
  @override

  /// Number of inbound packets dropped
  ///
  /// Example: 179
  int get packetsDroppedInbound;
  @override
  @JsonKey(ignore: true)
  _$$_LxdInstanceNetworkCountersCopyWith<_$_LxdInstanceNetworkCounters>
      get copyWith => throw _privateConstructorUsedError;
}
