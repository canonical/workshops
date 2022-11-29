// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'instance.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

LxdInstance _$LxdInstanceFromJson(Map<String, dynamic> json) {
  return _LxdInstance.fromJson(json);
}

/// @nodoc
mixin _$LxdInstance {
  /// Architecture name
  ///
  /// Example: x86_64
  String get architecture => throw _privateConstructorUsedError;

  /// Instance configuration
  ///
  /// Example:
  /// ```json
  /// {"security.nesting": "true"}
  /// ```
  ///
  /// See: https://linuxcontainers.org/lxd/docs/master/instances/
  Map<String, String> get config => throw _privateConstructorUsedError;

  /// Instance devices
  ///
  /// Example:
  /// ```json
  /// {"root": {"type": "disk", "pool": "default", "path": "/"}}
  /// ```
  ///
  /// See: https://linuxcontainers.org/lxd/docs/master/instances/
  Map<String, Map<String, String>> get devices =>
      throw _privateConstructorUsedError;

  /// Whether the instance is ephemeral (deleted on shutdown)
  bool get ephemeral => throw _privateConstructorUsedError;

  /// List of profiles applied to the instance
  ///
  /// Example: ["default"]
  List<String> get profiles => throw _privateConstructorUsedError;

  /// If set, instance will be restored to the provided snapshot name
  ///
  /// Example: snap0
  @JsonKey(includeIfNull: false)
  String? get restore => throw _privateConstructorUsedError;

  /// Whether the instance currently has saved state on disk
  bool get stateful => throw _privateConstructorUsedError;

  /// Instance description
  ///
  /// Example: My test instance
  String get description => throw _privateConstructorUsedError;

  /// Instance creation timestamp
  DateTime get createdAt => throw _privateConstructorUsedError;

  /// Expanded configuration (all profiles and local config merged)
  ///
  /// Example: {"security.nesting": "true"}
  @JsonKey(includeIfNull: false)
  Map<String, String>? get expandedConfig => throw _privateConstructorUsedError;

  /// Expanded devices (all profiles and local devices merged)
  ///
  /// Example: {"root": {"type": "disk", "pool": "default", "path": "/"}}
  @JsonKey(includeIfNull: false)
  Map<String, Map<String, String>>? get expandedDevices =>
      throw _privateConstructorUsedError;

  /// Instance name
  ///
  /// Example: foo
  String get name => throw _privateConstructorUsedError;

  /// Instance status
  ///
  /// Example: Running
  String get status => throw _privateConstructorUsedError;

  /// Instance status code
  ///
  /// Example: 101
  int get statusCode => throw _privateConstructorUsedError;

  /// Last start timestamp
  DateTime get lastUsedAt => throw _privateConstructorUsedError;

  /// What cluster member this instance is located on
  ///
  /// Example: lxd01
  String get location => throw _privateConstructorUsedError;

  /// The type of instance
  LxdInstanceType get type => throw _privateConstructorUsedError;

  /// Instance project name
  ///
  /// Example: foo
  String get project => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LxdInstanceCopyWith<LxdInstance> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LxdInstanceCopyWith<$Res> {
  factory $LxdInstanceCopyWith(
          LxdInstance value, $Res Function(LxdInstance) then) =
      _$LxdInstanceCopyWithImpl<$Res>;
  $Res call(
      {String architecture,
      Map<String, String> config,
      Map<String, Map<String, String>> devices,
      bool ephemeral,
      List<String> profiles,
      @JsonKey(includeIfNull: false)
          String? restore,
      bool stateful,
      String description,
      DateTime createdAt,
      @JsonKey(includeIfNull: false)
          Map<String, String>? expandedConfig,
      @JsonKey(includeIfNull: false)
          Map<String, Map<String, String>>? expandedDevices,
      String name,
      String status,
      int statusCode,
      DateTime lastUsedAt,
      String location,
      LxdInstanceType type,
      String project});
}

/// @nodoc
class _$LxdInstanceCopyWithImpl<$Res> implements $LxdInstanceCopyWith<$Res> {
  _$LxdInstanceCopyWithImpl(this._value, this._then);

  final LxdInstance _value;
  // ignore: unused_field
  final $Res Function(LxdInstance) _then;

  @override
  $Res call({
    Object? architecture = freezed,
    Object? config = freezed,
    Object? devices = freezed,
    Object? ephemeral = freezed,
    Object? profiles = freezed,
    Object? restore = freezed,
    Object? stateful = freezed,
    Object? description = freezed,
    Object? createdAt = freezed,
    Object? expandedConfig = freezed,
    Object? expandedDevices = freezed,
    Object? name = freezed,
    Object? status = freezed,
    Object? statusCode = freezed,
    Object? lastUsedAt = freezed,
    Object? location = freezed,
    Object? type = freezed,
    Object? project = freezed,
  }) {
    return _then(_value.copyWith(
      architecture: architecture == freezed
          ? _value.architecture
          : architecture // ignore: cast_nullable_to_non_nullable
              as String,
      config: config == freezed
          ? _value.config
          : config // ignore: cast_nullable_to_non_nullable
              as Map<String, String>,
      devices: devices == freezed
          ? _value.devices
          : devices // ignore: cast_nullable_to_non_nullable
              as Map<String, Map<String, String>>,
      ephemeral: ephemeral == freezed
          ? _value.ephemeral
          : ephemeral // ignore: cast_nullable_to_non_nullable
              as bool,
      profiles: profiles == freezed
          ? _value.profiles
          : profiles // ignore: cast_nullable_to_non_nullable
              as List<String>,
      restore: restore == freezed
          ? _value.restore
          : restore // ignore: cast_nullable_to_non_nullable
              as String?,
      stateful: stateful == freezed
          ? _value.stateful
          : stateful // ignore: cast_nullable_to_non_nullable
              as bool,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      expandedConfig: expandedConfig == freezed
          ? _value.expandedConfig
          : expandedConfig // ignore: cast_nullable_to_non_nullable
              as Map<String, String>?,
      expandedDevices: expandedDevices == freezed
          ? _value.expandedDevices
          : expandedDevices // ignore: cast_nullable_to_non_nullable
              as Map<String, Map<String, String>>?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      statusCode: statusCode == freezed
          ? _value.statusCode
          : statusCode // ignore: cast_nullable_to_non_nullable
              as int,
      lastUsedAt: lastUsedAt == freezed
          ? _value.lastUsedAt
          : lastUsedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      location: location == freezed
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as LxdInstanceType,
      project: project == freezed
          ? _value.project
          : project // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_LxdInstanceCopyWith<$Res>
    implements $LxdInstanceCopyWith<$Res> {
  factory _$$_LxdInstanceCopyWith(
          _$_LxdInstance value, $Res Function(_$_LxdInstance) then) =
      __$$_LxdInstanceCopyWithImpl<$Res>;
  @override
  $Res call(
      {String architecture,
      Map<String, String> config,
      Map<String, Map<String, String>> devices,
      bool ephemeral,
      List<String> profiles,
      @JsonKey(includeIfNull: false)
          String? restore,
      bool stateful,
      String description,
      DateTime createdAt,
      @JsonKey(includeIfNull: false)
          Map<String, String>? expandedConfig,
      @JsonKey(includeIfNull: false)
          Map<String, Map<String, String>>? expandedDevices,
      String name,
      String status,
      int statusCode,
      DateTime lastUsedAt,
      String location,
      LxdInstanceType type,
      String project});
}

/// @nodoc
class __$$_LxdInstanceCopyWithImpl<$Res> extends _$LxdInstanceCopyWithImpl<$Res>
    implements _$$_LxdInstanceCopyWith<$Res> {
  __$$_LxdInstanceCopyWithImpl(
      _$_LxdInstance _value, $Res Function(_$_LxdInstance) _then)
      : super(_value, (v) => _then(v as _$_LxdInstance));

  @override
  _$_LxdInstance get _value => super._value as _$_LxdInstance;

  @override
  $Res call({
    Object? architecture = freezed,
    Object? config = freezed,
    Object? devices = freezed,
    Object? ephemeral = freezed,
    Object? profiles = freezed,
    Object? restore = freezed,
    Object? stateful = freezed,
    Object? description = freezed,
    Object? createdAt = freezed,
    Object? expandedConfig = freezed,
    Object? expandedDevices = freezed,
    Object? name = freezed,
    Object? status = freezed,
    Object? statusCode = freezed,
    Object? lastUsedAt = freezed,
    Object? location = freezed,
    Object? type = freezed,
    Object? project = freezed,
  }) {
    return _then(_$_LxdInstance(
      architecture: architecture == freezed
          ? _value.architecture
          : architecture // ignore: cast_nullable_to_non_nullable
              as String,
      config: config == freezed
          ? _value._config
          : config // ignore: cast_nullable_to_non_nullable
              as Map<String, String>,
      devices: devices == freezed
          ? _value._devices
          : devices // ignore: cast_nullable_to_non_nullable
              as Map<String, Map<String, String>>,
      ephemeral: ephemeral == freezed
          ? _value.ephemeral
          : ephemeral // ignore: cast_nullable_to_non_nullable
              as bool,
      profiles: profiles == freezed
          ? _value._profiles
          : profiles // ignore: cast_nullable_to_non_nullable
              as List<String>,
      restore: restore == freezed
          ? _value.restore
          : restore // ignore: cast_nullable_to_non_nullable
              as String?,
      stateful: stateful == freezed
          ? _value.stateful
          : stateful // ignore: cast_nullable_to_non_nullable
              as bool,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      expandedConfig: expandedConfig == freezed
          ? _value._expandedConfig
          : expandedConfig // ignore: cast_nullable_to_non_nullable
              as Map<String, String>?,
      expandedDevices: expandedDevices == freezed
          ? _value._expandedDevices
          : expandedDevices // ignore: cast_nullable_to_non_nullable
              as Map<String, Map<String, String>>?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      statusCode: statusCode == freezed
          ? _value.statusCode
          : statusCode // ignore: cast_nullable_to_non_nullable
              as int,
      lastUsedAt: lastUsedAt == freezed
          ? _value.lastUsedAt
          : lastUsedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      location: location == freezed
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as LxdInstanceType,
      project: project == freezed
          ? _value.project
          : project // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_LxdInstance implements _LxdInstance {
  const _$_LxdInstance(
      {required this.architecture,
      required final Map<String, String> config,
      required final Map<String, Map<String, String>> devices,
      required this.ephemeral,
      required final List<String> profiles,
      @JsonKey(includeIfNull: false)
          required this.restore,
      required this.stateful,
      required this.description,
      required this.createdAt,
      @JsonKey(includeIfNull: false)
          required final Map<String, String>? expandedConfig,
      @JsonKey(includeIfNull: false)
          required final Map<String, Map<String, String>>? expandedDevices,
      required this.name,
      required this.status,
      required this.statusCode,
      required this.lastUsedAt,
      required this.location,
      required this.type,
      required this.project})
      : _config = config,
        _devices = devices,
        _profiles = profiles,
        _expandedConfig = expandedConfig,
        _expandedDevices = expandedDevices;

  factory _$_LxdInstance.fromJson(Map<String, dynamic> json) =>
      _$$_LxdInstanceFromJson(json);

  /// Architecture name
  ///
  /// Example: x86_64
  @override
  final String architecture;

  /// Instance configuration
  ///
  /// Example:
  /// ```json
  /// {"security.nesting": "true"}
  /// ```
  ///
  /// See: https://linuxcontainers.org/lxd/docs/master/instances/
  final Map<String, String> _config;

  /// Instance configuration
  ///
  /// Example:
  /// ```json
  /// {"security.nesting": "true"}
  /// ```
  ///
  /// See: https://linuxcontainers.org/lxd/docs/master/instances/
  @override
  Map<String, String> get config {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_config);
  }

  /// Instance devices
  ///
  /// Example:
  /// ```json
  /// {"root": {"type": "disk", "pool": "default", "path": "/"}}
  /// ```
  ///
  /// See: https://linuxcontainers.org/lxd/docs/master/instances/
  final Map<String, Map<String, String>> _devices;

  /// Instance devices
  ///
  /// Example:
  /// ```json
  /// {"root": {"type": "disk", "pool": "default", "path": "/"}}
  /// ```
  ///
  /// See: https://linuxcontainers.org/lxd/docs/master/instances/
  @override
  Map<String, Map<String, String>> get devices {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_devices);
  }

  /// Whether the instance is ephemeral (deleted on shutdown)
  @override
  final bool ephemeral;

  /// List of profiles applied to the instance
  ///
  /// Example: ["default"]
  final List<String> _profiles;

  /// List of profiles applied to the instance
  ///
  /// Example: ["default"]
  @override
  List<String> get profiles {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_profiles);
  }

  /// If set, instance will be restored to the provided snapshot name
  ///
  /// Example: snap0
  @override
  @JsonKey(includeIfNull: false)
  final String? restore;

  /// Whether the instance currently has saved state on disk
  @override
  final bool stateful;

  /// Instance description
  ///
  /// Example: My test instance
  @override
  final String description;

  /// Instance creation timestamp
  @override
  final DateTime createdAt;

  /// Expanded configuration (all profiles and local config merged)
  ///
  /// Example: {"security.nesting": "true"}
  final Map<String, String>? _expandedConfig;

  /// Expanded configuration (all profiles and local config merged)
  ///
  /// Example: {"security.nesting": "true"}
  @override
  @JsonKey(includeIfNull: false)
  Map<String, String>? get expandedConfig {
    final value = _expandedConfig;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  /// Expanded devices (all profiles and local devices merged)
  ///
  /// Example: {"root": {"type": "disk", "pool": "default", "path": "/"}}
  final Map<String, Map<String, String>>? _expandedDevices;

  /// Expanded devices (all profiles and local devices merged)
  ///
  /// Example: {"root": {"type": "disk", "pool": "default", "path": "/"}}
  @override
  @JsonKey(includeIfNull: false)
  Map<String, Map<String, String>>? get expandedDevices {
    final value = _expandedDevices;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  /// Instance name
  ///
  /// Example: foo
  @override
  final String name;

  /// Instance status
  ///
  /// Example: Running
  @override
  final String status;

  /// Instance status code
  ///
  /// Example: 101
  @override
  final int statusCode;

  /// Last start timestamp
  @override
  final DateTime lastUsedAt;

  /// What cluster member this instance is located on
  ///
  /// Example: lxd01
  @override
  final String location;

  /// The type of instance
  @override
  final LxdInstanceType type;

  /// Instance project name
  ///
  /// Example: foo
  @override
  final String project;

  @override
  String toString() {
    return 'LxdInstance(architecture: $architecture, config: $config, devices: $devices, ephemeral: $ephemeral, profiles: $profiles, restore: $restore, stateful: $stateful, description: $description, createdAt: $createdAt, expandedConfig: $expandedConfig, expandedDevices: $expandedDevices, name: $name, status: $status, statusCode: $statusCode, lastUsedAt: $lastUsedAt, location: $location, type: $type, project: $project)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LxdInstance &&
            const DeepCollectionEquality()
                .equals(other.architecture, architecture) &&
            const DeepCollectionEquality().equals(other._config, _config) &&
            const DeepCollectionEquality().equals(other._devices, _devices) &&
            const DeepCollectionEquality().equals(other.ephemeral, ephemeral) &&
            const DeepCollectionEquality().equals(other._profiles, _profiles) &&
            const DeepCollectionEquality().equals(other.restore, restore) &&
            const DeepCollectionEquality().equals(other.stateful, stateful) &&
            const DeepCollectionEquality()
                .equals(other.description, description) &&
            const DeepCollectionEquality().equals(other.createdAt, createdAt) &&
            const DeepCollectionEquality()
                .equals(other._expandedConfig, _expandedConfig) &&
            const DeepCollectionEquality()
                .equals(other._expandedDevices, _expandedDevices) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.status, status) &&
            const DeepCollectionEquality()
                .equals(other.statusCode, statusCode) &&
            const DeepCollectionEquality()
                .equals(other.lastUsedAt, lastUsedAt) &&
            const DeepCollectionEquality().equals(other.location, location) &&
            const DeepCollectionEquality().equals(other.type, type) &&
            const DeepCollectionEquality().equals(other.project, project));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(architecture),
      const DeepCollectionEquality().hash(_config),
      const DeepCollectionEquality().hash(_devices),
      const DeepCollectionEquality().hash(ephemeral),
      const DeepCollectionEquality().hash(_profiles),
      const DeepCollectionEquality().hash(restore),
      const DeepCollectionEquality().hash(stateful),
      const DeepCollectionEquality().hash(description),
      const DeepCollectionEquality().hash(createdAt),
      const DeepCollectionEquality().hash(_expandedConfig),
      const DeepCollectionEquality().hash(_expandedDevices),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(status),
      const DeepCollectionEquality().hash(statusCode),
      const DeepCollectionEquality().hash(lastUsedAt),
      const DeepCollectionEquality().hash(location),
      const DeepCollectionEquality().hash(type),
      const DeepCollectionEquality().hash(project));

  @JsonKey(ignore: true)
  @override
  _$$_LxdInstanceCopyWith<_$_LxdInstance> get copyWith =>
      __$$_LxdInstanceCopyWithImpl<_$_LxdInstance>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_LxdInstanceToJson(this);
  }
}

abstract class _LxdInstance implements LxdInstance {
  const factory _LxdInstance(
      {required final String architecture,
      required final Map<String, String> config,
      required final Map<String, Map<String, String>> devices,
      required final bool ephemeral,
      required final List<String> profiles,
      @JsonKey(includeIfNull: false)
          required final String? restore,
      required final bool stateful,
      required final String description,
      required final DateTime createdAt,
      @JsonKey(includeIfNull: false)
          required final Map<String, String>? expandedConfig,
      @JsonKey(includeIfNull: false)
          required final Map<String, Map<String, String>>? expandedDevices,
      required final String name,
      required final String status,
      required final int statusCode,
      required final DateTime lastUsedAt,
      required final String location,
      required final LxdInstanceType type,
      required final String project}) = _$_LxdInstance;

  factory _LxdInstance.fromJson(Map<String, dynamic> json) =
      _$_LxdInstance.fromJson;

  @override

  /// Architecture name
  ///
  /// Example: x86_64
  String get architecture => throw _privateConstructorUsedError;
  @override

  /// Instance configuration
  ///
  /// Example:
  /// ```json
  /// {"security.nesting": "true"}
  /// ```
  ///
  /// See: https://linuxcontainers.org/lxd/docs/master/instances/
  Map<String, String> get config => throw _privateConstructorUsedError;
  @override

  /// Instance devices
  ///
  /// Example:
  /// ```json
  /// {"root": {"type": "disk", "pool": "default", "path": "/"}}
  /// ```
  ///
  /// See: https://linuxcontainers.org/lxd/docs/master/instances/
  Map<String, Map<String, String>> get devices =>
      throw _privateConstructorUsedError;
  @override

  /// Whether the instance is ephemeral (deleted on shutdown)
  bool get ephemeral => throw _privateConstructorUsedError;
  @override

  /// List of profiles applied to the instance
  ///
  /// Example: ["default"]
  List<String> get profiles => throw _privateConstructorUsedError;
  @override

  /// If set, instance will be restored to the provided snapshot name
  ///
  /// Example: snap0
  @JsonKey(includeIfNull: false)
  String? get restore => throw _privateConstructorUsedError;
  @override

  /// Whether the instance currently has saved state on disk
  bool get stateful => throw _privateConstructorUsedError;
  @override

  /// Instance description
  ///
  /// Example: My test instance
  String get description => throw _privateConstructorUsedError;
  @override

  /// Instance creation timestamp
  DateTime get createdAt => throw _privateConstructorUsedError;
  @override

  /// Expanded configuration (all profiles and local config merged)
  ///
  /// Example: {"security.nesting": "true"}
  @JsonKey(includeIfNull: false)
  Map<String, String>? get expandedConfig => throw _privateConstructorUsedError;
  @override

  /// Expanded devices (all profiles and local devices merged)
  ///
  /// Example: {"root": {"type": "disk", "pool": "default", "path": "/"}}
  @JsonKey(includeIfNull: false)
  Map<String, Map<String, String>>? get expandedDevices =>
      throw _privateConstructorUsedError;
  @override

  /// Instance name
  ///
  /// Example: foo
  String get name => throw _privateConstructorUsedError;
  @override

  /// Instance status
  ///
  /// Example: Running
  String get status => throw _privateConstructorUsedError;
  @override

  /// Instance status code
  ///
  /// Example: 101
  int get statusCode => throw _privateConstructorUsedError;
  @override

  /// Last start timestamp
  DateTime get lastUsedAt => throw _privateConstructorUsedError;
  @override

  /// What cluster member this instance is located on
  ///
  /// Example: lxd01
  String get location => throw _privateConstructorUsedError;
  @override

  /// The type of instance
  LxdInstanceType get type => throw _privateConstructorUsedError;
  @override

  /// Instance project name
  ///
  /// Example: foo
  String get project => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_LxdInstanceCopyWith<_$_LxdInstance> get copyWith =>
      throw _privateConstructorUsedError;
}
