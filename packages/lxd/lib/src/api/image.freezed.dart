// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'image.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

LxdImage _$LxdImageFromJson(Map<String, dynamic> json) {
  return _LxdImage.fromJson(json);
}

/// @nodoc
mixin _$LxdImage {
  /// Whether the image should auto-update when a new build is available
  bool get autoUpdate => throw _privateConstructorUsedError;

  /// Descriptive properties
  ///
  /// Example:
  /// ```json
  /// {"os": "Ubuntu", "release": "jammy", "variant": "cloud"}
  Map<String, String> get properties => throw _privateConstructorUsedError;

  /// Whether the image is available to unauthenticated users
  bool get public => throw _privateConstructorUsedError;

  /// When the image becomes obsolete
  ///
  /// API extension: images_expiry
  DateTime get expiresAt => throw _privateConstructorUsedError;

  /// List of profiles to use when creating from this image (if none provided by user)
  ///
  /// Example: ["default"]
  ///
  /// API extension: image_profiles
  List<String> get profiles => throw _privateConstructorUsedError;

  /// List of aliases
  List<LxdImageAlias> get aliases => throw _privateConstructorUsedError;

  /// Architecture
  /// Example: x86_64
  String get architecture => throw _privateConstructorUsedError;

  /// Whether the image is an automatically cached remote image
  bool get cached => throw _privateConstructorUsedError;

  /// Original filename
  ///
  /// Example: 06b86454720d36b20f94e31c6812e05ec51c1b568cf3a8abd273769d213394bb.rootfs
  String get filename => throw _privateConstructorUsedError;

  /// Full SHA-256 fingerprint
  ///
  /// Example: 06b86454720d36b20f94e31c6812e05ec51c1b568cf3a8abd273769d213394bb
  String get fingerprint => throw _privateConstructorUsedError;

  /// Size of the image in bytes
  ///
  /// Example: 272237676
  int get size => throw _privateConstructorUsedError;

  /// Where the image came from
  LxdImageSource? get updateSource => throw _privateConstructorUsedError;

  /// Type of image
  ///
  /// API extension: image_types
  LxdImageType get type => throw _privateConstructorUsedError;

  /// When the image was originally created
  DateTime get createdAt => throw _privateConstructorUsedError;

  /// Last time the image was used
  DateTime? get lastUsedAt => throw _privateConstructorUsedError;

  /// When the image was added to this LXD server
  DateTime get uploadedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LxdImageCopyWith<LxdImage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LxdImageCopyWith<$Res> {
  factory $LxdImageCopyWith(LxdImage value, $Res Function(LxdImage) then) =
      _$LxdImageCopyWithImpl<$Res, LxdImage>;
  @useResult
  $Res call(
      {bool autoUpdate,
      Map<String, String> properties,
      bool public,
      DateTime expiresAt,
      List<String> profiles,
      List<LxdImageAlias> aliases,
      String architecture,
      bool cached,
      String filename,
      String fingerprint,
      int size,
      LxdImageSource? updateSource,
      LxdImageType type,
      DateTime createdAt,
      DateTime? lastUsedAt,
      DateTime uploadedAt});

  $LxdImageSourceCopyWith<$Res>? get updateSource;
}

/// @nodoc
class _$LxdImageCopyWithImpl<$Res, $Val extends LxdImage>
    implements $LxdImageCopyWith<$Res> {
  _$LxdImageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? autoUpdate = null,
    Object? properties = null,
    Object? public = null,
    Object? expiresAt = null,
    Object? profiles = null,
    Object? aliases = null,
    Object? architecture = null,
    Object? cached = null,
    Object? filename = null,
    Object? fingerprint = null,
    Object? size = null,
    Object? updateSource = freezed,
    Object? type = null,
    Object? createdAt = null,
    Object? lastUsedAt = freezed,
    Object? uploadedAt = null,
  }) {
    return _then(_value.copyWith(
      autoUpdate: null == autoUpdate
          ? _value.autoUpdate
          : autoUpdate // ignore: cast_nullable_to_non_nullable
              as bool,
      properties: null == properties
          ? _value.properties
          : properties // ignore: cast_nullable_to_non_nullable
              as Map<String, String>,
      public: null == public
          ? _value.public
          : public // ignore: cast_nullable_to_non_nullable
              as bool,
      expiresAt: null == expiresAt
          ? _value.expiresAt
          : expiresAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      profiles: null == profiles
          ? _value.profiles
          : profiles // ignore: cast_nullable_to_non_nullable
              as List<String>,
      aliases: null == aliases
          ? _value.aliases
          : aliases // ignore: cast_nullable_to_non_nullable
              as List<LxdImageAlias>,
      architecture: null == architecture
          ? _value.architecture
          : architecture // ignore: cast_nullable_to_non_nullable
              as String,
      cached: null == cached
          ? _value.cached
          : cached // ignore: cast_nullable_to_non_nullable
              as bool,
      filename: null == filename
          ? _value.filename
          : filename // ignore: cast_nullable_to_non_nullable
              as String,
      fingerprint: null == fingerprint
          ? _value.fingerprint
          : fingerprint // ignore: cast_nullable_to_non_nullable
              as String,
      size: null == size
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as int,
      updateSource: freezed == updateSource
          ? _value.updateSource
          : updateSource // ignore: cast_nullable_to_non_nullable
              as LxdImageSource?,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as LxdImageType,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      lastUsedAt: freezed == lastUsedAt
          ? _value.lastUsedAt
          : lastUsedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      uploadedAt: null == uploadedAt
          ? _value.uploadedAt
          : uploadedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $LxdImageSourceCopyWith<$Res>? get updateSource {
    if (_value.updateSource == null) {
      return null;
    }

    return $LxdImageSourceCopyWith<$Res>(_value.updateSource!, (value) {
      return _then(_value.copyWith(updateSource: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_LxdImageCopyWith<$Res> implements $LxdImageCopyWith<$Res> {
  factory _$$_LxdImageCopyWith(
          _$_LxdImage value, $Res Function(_$_LxdImage) then) =
      __$$_LxdImageCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool autoUpdate,
      Map<String, String> properties,
      bool public,
      DateTime expiresAt,
      List<String> profiles,
      List<LxdImageAlias> aliases,
      String architecture,
      bool cached,
      String filename,
      String fingerprint,
      int size,
      LxdImageSource? updateSource,
      LxdImageType type,
      DateTime createdAt,
      DateTime? lastUsedAt,
      DateTime uploadedAt});

  @override
  $LxdImageSourceCopyWith<$Res>? get updateSource;
}

/// @nodoc
class __$$_LxdImageCopyWithImpl<$Res>
    extends _$LxdImageCopyWithImpl<$Res, _$_LxdImage>
    implements _$$_LxdImageCopyWith<$Res> {
  __$$_LxdImageCopyWithImpl(
      _$_LxdImage _value, $Res Function(_$_LxdImage) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? autoUpdate = null,
    Object? properties = null,
    Object? public = null,
    Object? expiresAt = null,
    Object? profiles = null,
    Object? aliases = null,
    Object? architecture = null,
    Object? cached = null,
    Object? filename = null,
    Object? fingerprint = null,
    Object? size = null,
    Object? updateSource = freezed,
    Object? type = null,
    Object? createdAt = null,
    Object? lastUsedAt = freezed,
    Object? uploadedAt = null,
  }) {
    return _then(_$_LxdImage(
      autoUpdate: null == autoUpdate
          ? _value.autoUpdate
          : autoUpdate // ignore: cast_nullable_to_non_nullable
              as bool,
      properties: null == properties
          ? _value._properties
          : properties // ignore: cast_nullable_to_non_nullable
              as Map<String, String>,
      public: null == public
          ? _value.public
          : public // ignore: cast_nullable_to_non_nullable
              as bool,
      expiresAt: null == expiresAt
          ? _value.expiresAt
          : expiresAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      profiles: null == profiles
          ? _value._profiles
          : profiles // ignore: cast_nullable_to_non_nullable
              as List<String>,
      aliases: null == aliases
          ? _value._aliases
          : aliases // ignore: cast_nullable_to_non_nullable
              as List<LxdImageAlias>,
      architecture: null == architecture
          ? _value.architecture
          : architecture // ignore: cast_nullable_to_non_nullable
              as String,
      cached: null == cached
          ? _value.cached
          : cached // ignore: cast_nullable_to_non_nullable
              as bool,
      filename: null == filename
          ? _value.filename
          : filename // ignore: cast_nullable_to_non_nullable
              as String,
      fingerprint: null == fingerprint
          ? _value.fingerprint
          : fingerprint // ignore: cast_nullable_to_non_nullable
              as String,
      size: null == size
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as int,
      updateSource: freezed == updateSource
          ? _value.updateSource
          : updateSource // ignore: cast_nullable_to_non_nullable
              as LxdImageSource?,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as LxdImageType,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      lastUsedAt: freezed == lastUsedAt
          ? _value.lastUsedAt
          : lastUsedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      uploadedAt: null == uploadedAt
          ? _value.uploadedAt
          : uploadedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_LxdImage implements _LxdImage {
  const _$_LxdImage(
      {this.autoUpdate = false,
      final Map<String, String> properties = const {},
      this.public = true,
      required this.expiresAt,
      final List<String> profiles = const [],
      final List<LxdImageAlias> aliases = const [],
      required this.architecture,
      this.cached = false,
      required this.filename,
      required this.fingerprint,
      required this.size,
      this.updateSource,
      required this.type,
      required this.createdAt,
      this.lastUsedAt,
      required this.uploadedAt})
      : _properties = properties,
        _profiles = profiles,
        _aliases = aliases;

  factory _$_LxdImage.fromJson(Map<String, dynamic> json) =>
      _$$_LxdImageFromJson(json);

  /// Whether the image should auto-update when a new build is available
  @override
  @JsonKey()
  final bool autoUpdate;

  /// Descriptive properties
  ///
  /// Example:
  /// ```json
  /// {"os": "Ubuntu", "release": "jammy", "variant": "cloud"}
  final Map<String, String> _properties;

  /// Descriptive properties
  ///
  /// Example:
  /// ```json
  /// {"os": "Ubuntu", "release": "jammy", "variant": "cloud"}
  @override
  @JsonKey()
  Map<String, String> get properties {
    if (_properties is EqualUnmodifiableMapView) return _properties;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_properties);
  }

  /// Whether the image is available to unauthenticated users
  @override
  @JsonKey()
  final bool public;

  /// When the image becomes obsolete
  ///
  /// API extension: images_expiry
  @override
  final DateTime expiresAt;

  /// List of profiles to use when creating from this image (if none provided by user)
  ///
  /// Example: ["default"]
  ///
  /// API extension: image_profiles
  final List<String> _profiles;

  /// List of profiles to use when creating from this image (if none provided by user)
  ///
  /// Example: ["default"]
  ///
  /// API extension: image_profiles
  @override
  @JsonKey()
  List<String> get profiles {
    if (_profiles is EqualUnmodifiableListView) return _profiles;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_profiles);
  }

  /// List of aliases
  final List<LxdImageAlias> _aliases;

  /// List of aliases
  @override
  @JsonKey()
  List<LxdImageAlias> get aliases {
    if (_aliases is EqualUnmodifiableListView) return _aliases;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_aliases);
  }

  /// Architecture
  /// Example: x86_64
  @override
  final String architecture;

  /// Whether the image is an automatically cached remote image
  @override
  @JsonKey()
  final bool cached;

  /// Original filename
  ///
  /// Example: 06b86454720d36b20f94e31c6812e05ec51c1b568cf3a8abd273769d213394bb.rootfs
  @override
  final String filename;

  /// Full SHA-256 fingerprint
  ///
  /// Example: 06b86454720d36b20f94e31c6812e05ec51c1b568cf3a8abd273769d213394bb
  @override
  final String fingerprint;

  /// Size of the image in bytes
  ///
  /// Example: 272237676
  @override
  final int size;

  /// Where the image came from
  @override
  final LxdImageSource? updateSource;

  /// Type of image
  ///
  /// API extension: image_types
  @override
  final LxdImageType type;

  /// When the image was originally created
  @override
  final DateTime createdAt;

  /// Last time the image was used
  @override
  final DateTime? lastUsedAt;

  /// When the image was added to this LXD server
  @override
  final DateTime uploadedAt;

  @override
  String toString() {
    return 'LxdImage(autoUpdate: $autoUpdate, properties: $properties, public: $public, expiresAt: $expiresAt, profiles: $profiles, aliases: $aliases, architecture: $architecture, cached: $cached, filename: $filename, fingerprint: $fingerprint, size: $size, updateSource: $updateSource, type: $type, createdAt: $createdAt, lastUsedAt: $lastUsedAt, uploadedAt: $uploadedAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LxdImage &&
            (identical(other.autoUpdate, autoUpdate) ||
                other.autoUpdate == autoUpdate) &&
            const DeepCollectionEquality()
                .equals(other._properties, _properties) &&
            (identical(other.public, public) || other.public == public) &&
            (identical(other.expiresAt, expiresAt) ||
                other.expiresAt == expiresAt) &&
            const DeepCollectionEquality().equals(other._profiles, _profiles) &&
            const DeepCollectionEquality().equals(other._aliases, _aliases) &&
            (identical(other.architecture, architecture) ||
                other.architecture == architecture) &&
            (identical(other.cached, cached) || other.cached == cached) &&
            (identical(other.filename, filename) ||
                other.filename == filename) &&
            (identical(other.fingerprint, fingerprint) ||
                other.fingerprint == fingerprint) &&
            (identical(other.size, size) || other.size == size) &&
            (identical(other.updateSource, updateSource) ||
                other.updateSource == updateSource) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.lastUsedAt, lastUsedAt) ||
                other.lastUsedAt == lastUsedAt) &&
            (identical(other.uploadedAt, uploadedAt) ||
                other.uploadedAt == uploadedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      autoUpdate,
      const DeepCollectionEquality().hash(_properties),
      public,
      expiresAt,
      const DeepCollectionEquality().hash(_profiles),
      const DeepCollectionEquality().hash(_aliases),
      architecture,
      cached,
      filename,
      fingerprint,
      size,
      updateSource,
      type,
      createdAt,
      lastUsedAt,
      uploadedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LxdImageCopyWith<_$_LxdImage> get copyWith =>
      __$$_LxdImageCopyWithImpl<_$_LxdImage>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_LxdImageToJson(
      this,
    );
  }
}

abstract class _LxdImage implements LxdImage {
  const factory _LxdImage(
      {final bool autoUpdate,
      final Map<String, String> properties,
      final bool public,
      required final DateTime expiresAt,
      final List<String> profiles,
      final List<LxdImageAlias> aliases,
      required final String architecture,
      final bool cached,
      required final String filename,
      required final String fingerprint,
      required final int size,
      final LxdImageSource? updateSource,
      required final LxdImageType type,
      required final DateTime createdAt,
      final DateTime? lastUsedAt,
      required final DateTime uploadedAt}) = _$_LxdImage;

  factory _LxdImage.fromJson(Map<String, dynamic> json) = _$_LxdImage.fromJson;

  @override

  /// Whether the image should auto-update when a new build is available
  bool get autoUpdate;
  @override

  /// Descriptive properties
  ///
  /// Example:
  /// ```json
  /// {"os": "Ubuntu", "release": "jammy", "variant": "cloud"}
  Map<String, String> get properties;
  @override

  /// Whether the image is available to unauthenticated users
  bool get public;
  @override

  /// When the image becomes obsolete
  ///
  /// API extension: images_expiry
  DateTime get expiresAt;
  @override

  /// List of profiles to use when creating from this image (if none provided by user)
  ///
  /// Example: ["default"]
  ///
  /// API extension: image_profiles
  List<String> get profiles;
  @override

  /// List of aliases
  List<LxdImageAlias> get aliases;
  @override

  /// Architecture
  /// Example: x86_64
  String get architecture;
  @override

  /// Whether the image is an automatically cached remote image
  bool get cached;
  @override

  /// Original filename
  ///
  /// Example: 06b86454720d36b20f94e31c6812e05ec51c1b568cf3a8abd273769d213394bb.rootfs
  String get filename;
  @override

  /// Full SHA-256 fingerprint
  ///
  /// Example: 06b86454720d36b20f94e31c6812e05ec51c1b568cf3a8abd273769d213394bb
  String get fingerprint;
  @override

  /// Size of the image in bytes
  ///
  /// Example: 272237676
  int get size;
  @override

  /// Where the image came from
  LxdImageSource? get updateSource;
  @override

  /// Type of image
  ///
  /// API extension: image_types
  LxdImageType get type;
  @override

  /// When the image was originally created
  DateTime get createdAt;
  @override

  /// Last time the image was used
  DateTime? get lastUsedAt;
  @override

  /// When the image was added to this LXD server
  DateTime get uploadedAt;
  @override
  @JsonKey(ignore: true)
  _$$_LxdImageCopyWith<_$_LxdImage> get copyWith =>
      throw _privateConstructorUsedError;
}

LxdImageAlias _$LxdImageAliasFromJson(Map<String, dynamic> json) {
  return _LxdImageAlias.fromJson(json);
}

/// @nodoc
mixin _$LxdImageAlias {
  /// Name of the alias
  ///
  /// Example: ubuntu-22.04
  String get name => throw _privateConstructorUsedError;

  /// Description of the alias
  ///
  /// Example: Our preferred Ubuntu image
  String? get description => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LxdImageAliasCopyWith<LxdImageAlias> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LxdImageAliasCopyWith<$Res> {
  factory $LxdImageAliasCopyWith(
          LxdImageAlias value, $Res Function(LxdImageAlias) then) =
      _$LxdImageAliasCopyWithImpl<$Res, LxdImageAlias>;
  @useResult
  $Res call({String name, String? description});
}

/// @nodoc
class _$LxdImageAliasCopyWithImpl<$Res, $Val extends LxdImageAlias>
    implements $LxdImageAliasCopyWith<$Res> {
  _$LxdImageAliasCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? description = freezed,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_LxdImageAliasCopyWith<$Res>
    implements $LxdImageAliasCopyWith<$Res> {
  factory _$$_LxdImageAliasCopyWith(
          _$_LxdImageAlias value, $Res Function(_$_LxdImageAlias) then) =
      __$$_LxdImageAliasCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, String? description});
}

/// @nodoc
class __$$_LxdImageAliasCopyWithImpl<$Res>
    extends _$LxdImageAliasCopyWithImpl<$Res, _$_LxdImageAlias>
    implements _$$_LxdImageAliasCopyWith<$Res> {
  __$$_LxdImageAliasCopyWithImpl(
      _$_LxdImageAlias _value, $Res Function(_$_LxdImageAlias) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? description = freezed,
  }) {
    return _then(_$_LxdImageAlias(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_LxdImageAlias implements _LxdImageAlias {
  const _$_LxdImageAlias({required this.name, this.description});

  factory _$_LxdImageAlias.fromJson(Map<String, dynamic> json) =>
      _$$_LxdImageAliasFromJson(json);

  /// Name of the alias
  ///
  /// Example: ubuntu-22.04
  @override
  final String name;

  /// Description of the alias
  ///
  /// Example: Our preferred Ubuntu image
  @override
  final String? description;

  @override
  String toString() {
    return 'LxdImageAlias(name: $name, description: $description)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LxdImageAlias &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, description);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LxdImageAliasCopyWith<_$_LxdImageAlias> get copyWith =>
      __$$_LxdImageAliasCopyWithImpl<_$_LxdImageAlias>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_LxdImageAliasToJson(
      this,
    );
  }
}

abstract class _LxdImageAlias implements LxdImageAlias {
  const factory _LxdImageAlias(
      {required final String name,
      final String? description}) = _$_LxdImageAlias;

  factory _LxdImageAlias.fromJson(Map<String, dynamic> json) =
      _$_LxdImageAlias.fromJson;

  @override

  /// Name of the alias
  ///
  /// Example: ubuntu-22.04
  String get name;
  @override

  /// Description of the alias
  ///
  /// Example: Our preferred Ubuntu image
  String? get description;
  @override
  @JsonKey(ignore: true)
  _$$_LxdImageAliasCopyWith<_$_LxdImageAlias> get copyWith =>
      throw _privateConstructorUsedError;
}

LxdImageSource _$LxdImageSourceFromJson(Map<String, dynamic> json) {
  return _LxdImageSource.fromJson(json);
}

/// @nodoc
mixin _$LxdImageSource {
  /// Source alias to download from
  ///
  /// Example: jammy
  String get alias => throw _privateConstructorUsedError;

  /// Source server certificate (if not trusted by system CA)
  ///
  /// Example: X509 PEM certificate
  String? get certificate => throw _privateConstructorUsedError;

  /// Source server protocol
  ///
  /// Example: simplestreams
  String get protocol => throw _privateConstructorUsedError;

  /// URL of the source server
  ///
  /// Example: https://images.linuxcontainers.org
  String get server => throw _privateConstructorUsedError;

  /// Type of image
  ///
  /// API extension: image_types
  @JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
  LxdImageType? get imageType => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LxdImageSourceCopyWith<LxdImageSource> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LxdImageSourceCopyWith<$Res> {
  factory $LxdImageSourceCopyWith(
          LxdImageSource value, $Res Function(LxdImageSource) then) =
      _$LxdImageSourceCopyWithImpl<$Res, LxdImageSource>;
  @useResult
  $Res call(
      {String alias,
      String? certificate,
      String protocol,
      String server,
      @JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
          LxdImageType? imageType});
}

/// @nodoc
class _$LxdImageSourceCopyWithImpl<$Res, $Val extends LxdImageSource>
    implements $LxdImageSourceCopyWith<$Res> {
  _$LxdImageSourceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? alias = null,
    Object? certificate = freezed,
    Object? protocol = null,
    Object? server = null,
    Object? imageType = freezed,
  }) {
    return _then(_value.copyWith(
      alias: null == alias
          ? _value.alias
          : alias // ignore: cast_nullable_to_non_nullable
              as String,
      certificate: freezed == certificate
          ? _value.certificate
          : certificate // ignore: cast_nullable_to_non_nullable
              as String?,
      protocol: null == protocol
          ? _value.protocol
          : protocol // ignore: cast_nullable_to_non_nullable
              as String,
      server: null == server
          ? _value.server
          : server // ignore: cast_nullable_to_non_nullable
              as String,
      imageType: freezed == imageType
          ? _value.imageType
          : imageType // ignore: cast_nullable_to_non_nullable
              as LxdImageType?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_LxdImageSourceCopyWith<$Res>
    implements $LxdImageSourceCopyWith<$Res> {
  factory _$$_LxdImageSourceCopyWith(
          _$_LxdImageSource value, $Res Function(_$_LxdImageSource) then) =
      __$$_LxdImageSourceCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String alias,
      String? certificate,
      String protocol,
      String server,
      @JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
          LxdImageType? imageType});
}

/// @nodoc
class __$$_LxdImageSourceCopyWithImpl<$Res>
    extends _$LxdImageSourceCopyWithImpl<$Res, _$_LxdImageSource>
    implements _$$_LxdImageSourceCopyWith<$Res> {
  __$$_LxdImageSourceCopyWithImpl(
      _$_LxdImageSource _value, $Res Function(_$_LxdImageSource) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? alias = null,
    Object? certificate = freezed,
    Object? protocol = null,
    Object? server = null,
    Object? imageType = freezed,
  }) {
    return _then(_$_LxdImageSource(
      alias: null == alias
          ? _value.alias
          : alias // ignore: cast_nullable_to_non_nullable
              as String,
      certificate: freezed == certificate
          ? _value.certificate
          : certificate // ignore: cast_nullable_to_non_nullable
              as String?,
      protocol: null == protocol
          ? _value.protocol
          : protocol // ignore: cast_nullable_to_non_nullable
              as String,
      server: null == server
          ? _value.server
          : server // ignore: cast_nullable_to_non_nullable
              as String,
      imageType: freezed == imageType
          ? _value.imageType
          : imageType // ignore: cast_nullable_to_non_nullable
              as LxdImageType?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_LxdImageSource implements _LxdImageSource {
  const _$_LxdImageSource(
      {required this.alias,
      this.certificate,
      required this.protocol,
      required this.server,
      @JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
          this.imageType});

  factory _$_LxdImageSource.fromJson(Map<String, dynamic> json) =>
      _$$_LxdImageSourceFromJson(json);

  /// Source alias to download from
  ///
  /// Example: jammy
  @override
  final String alias;

  /// Source server certificate (if not trusted by system CA)
  ///
  /// Example: X509 PEM certificate
  @override
  final String? certificate;

  /// Source server protocol
  ///
  /// Example: simplestreams
  @override
  final String protocol;

  /// URL of the source server
  ///
  /// Example: https://images.linuxcontainers.org
  @override
  final String server;

  /// Type of image
  ///
  /// API extension: image_types
  @override
  @JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
  final LxdImageType? imageType;

  @override
  String toString() {
    return 'LxdImageSource(alias: $alias, certificate: $certificate, protocol: $protocol, server: $server, imageType: $imageType)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LxdImageSource &&
            (identical(other.alias, alias) || other.alias == alias) &&
            (identical(other.certificate, certificate) ||
                other.certificate == certificate) &&
            (identical(other.protocol, protocol) ||
                other.protocol == protocol) &&
            (identical(other.server, server) || other.server == server) &&
            (identical(other.imageType, imageType) ||
                other.imageType == imageType));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, alias, certificate, protocol, server, imageType);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LxdImageSourceCopyWith<_$_LxdImageSource> get copyWith =>
      __$$_LxdImageSourceCopyWithImpl<_$_LxdImageSource>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_LxdImageSourceToJson(
      this,
    );
  }
}

abstract class _LxdImageSource implements LxdImageSource {
  const factory _LxdImageSource(
      {required final String alias,
      final String? certificate,
      required final String protocol,
      required final String server,
      @JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
          final LxdImageType? imageType}) = _$_LxdImageSource;

  factory _LxdImageSource.fromJson(Map<String, dynamic> json) =
      _$_LxdImageSource.fromJson;

  @override

  /// Source alias to download from
  ///
  /// Example: jammy
  String get alias;
  @override

  /// Source server certificate (if not trusted by system CA)
  ///
  /// Example: X509 PEM certificate
  String? get certificate;
  @override

  /// Source server protocol
  ///
  /// Example: simplestreams
  String get protocol;
  @override

  /// URL of the source server
  ///
  /// Example: https://images.linuxcontainers.org
  String get server;
  @override

  /// Type of image
  ///
  /// API extension: image_types
  @JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
  LxdImageType? get imageType;
  @override
  @JsonKey(ignore: true)
  _$$_LxdImageSourceCopyWith<_$_LxdImageSource> get copyWith =>
      throw _privateConstructorUsedError;
}

LxdImageMetadata _$LxdImageMetadataFromJson(Map<String, dynamic> json) {
  return _LxdImageMetadata.fromJson(json);
}

/// @nodoc
mixin _$LxdImageMetadata {
  /// Architecture name
  ///
  /// Example: x86_64
  String get architecture => throw _privateConstructorUsedError;

  /// Image creation data (as UNIX epoch)
  ///
  /// Example: 1620655439
  int get creationDate => throw _privateConstructorUsedError;

  /// Image expiry data (as UNIX epoch)
  ///
  /// Example: 1620685757
  int get expiryDate => throw _privateConstructorUsedError;

  /// Descriptive properties
  ///
  /// Example: {"os": "Ubuntu", "release": "jammy", "variant": "cloud"}
  Map<String, String> get properties =>
      throw _privateConstructorUsedError; // Template for files in the image
  Map<String, LxdImageMetadataTemplate> get templates =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LxdImageMetadataCopyWith<LxdImageMetadata> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LxdImageMetadataCopyWith<$Res> {
  factory $LxdImageMetadataCopyWith(
          LxdImageMetadata value, $Res Function(LxdImageMetadata) then) =
      _$LxdImageMetadataCopyWithImpl<$Res, LxdImageMetadata>;
  @useResult
  $Res call(
      {String architecture,
      int creationDate,
      int expiryDate,
      Map<String, String> properties,
      Map<String, LxdImageMetadataTemplate> templates});
}

/// @nodoc
class _$LxdImageMetadataCopyWithImpl<$Res, $Val extends LxdImageMetadata>
    implements $LxdImageMetadataCopyWith<$Res> {
  _$LxdImageMetadataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? architecture = null,
    Object? creationDate = null,
    Object? expiryDate = null,
    Object? properties = null,
    Object? templates = null,
  }) {
    return _then(_value.copyWith(
      architecture: null == architecture
          ? _value.architecture
          : architecture // ignore: cast_nullable_to_non_nullable
              as String,
      creationDate: null == creationDate
          ? _value.creationDate
          : creationDate // ignore: cast_nullable_to_non_nullable
              as int,
      expiryDate: null == expiryDate
          ? _value.expiryDate
          : expiryDate // ignore: cast_nullable_to_non_nullable
              as int,
      properties: null == properties
          ? _value.properties
          : properties // ignore: cast_nullable_to_non_nullable
              as Map<String, String>,
      templates: null == templates
          ? _value.templates
          : templates // ignore: cast_nullable_to_non_nullable
              as Map<String, LxdImageMetadataTemplate>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_LxdImageMetadataCopyWith<$Res>
    implements $LxdImageMetadataCopyWith<$Res> {
  factory _$$_LxdImageMetadataCopyWith(
          _$_LxdImageMetadata value, $Res Function(_$_LxdImageMetadata) then) =
      __$$_LxdImageMetadataCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String architecture,
      int creationDate,
      int expiryDate,
      Map<String, String> properties,
      Map<String, LxdImageMetadataTemplate> templates});
}

/// @nodoc
class __$$_LxdImageMetadataCopyWithImpl<$Res>
    extends _$LxdImageMetadataCopyWithImpl<$Res, _$_LxdImageMetadata>
    implements _$$_LxdImageMetadataCopyWith<$Res> {
  __$$_LxdImageMetadataCopyWithImpl(
      _$_LxdImageMetadata _value, $Res Function(_$_LxdImageMetadata) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? architecture = null,
    Object? creationDate = null,
    Object? expiryDate = null,
    Object? properties = null,
    Object? templates = null,
  }) {
    return _then(_$_LxdImageMetadata(
      architecture: null == architecture
          ? _value.architecture
          : architecture // ignore: cast_nullable_to_non_nullable
              as String,
      creationDate: null == creationDate
          ? _value.creationDate
          : creationDate // ignore: cast_nullable_to_non_nullable
              as int,
      expiryDate: null == expiryDate
          ? _value.expiryDate
          : expiryDate // ignore: cast_nullable_to_non_nullable
              as int,
      properties: null == properties
          ? _value._properties
          : properties // ignore: cast_nullable_to_non_nullable
              as Map<String, String>,
      templates: null == templates
          ? _value._templates
          : templates // ignore: cast_nullable_to_non_nullable
              as Map<String, LxdImageMetadataTemplate>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_LxdImageMetadata implements _LxdImageMetadata {
  const _$_LxdImageMetadata(
      {required this.architecture,
      required this.creationDate,
      required this.expiryDate,
      required final Map<String, String> properties,
      required final Map<String, LxdImageMetadataTemplate> templates})
      : _properties = properties,
        _templates = templates;

  factory _$_LxdImageMetadata.fromJson(Map<String, dynamic> json) =>
      _$$_LxdImageMetadataFromJson(json);

  /// Architecture name
  ///
  /// Example: x86_64
  @override
  final String architecture;

  /// Image creation data (as UNIX epoch)
  ///
  /// Example: 1620655439
  @override
  final int creationDate;

  /// Image expiry data (as UNIX epoch)
  ///
  /// Example: 1620685757
  @override
  final int expiryDate;

  /// Descriptive properties
  ///
  /// Example: {"os": "Ubuntu", "release": "jammy", "variant": "cloud"}
  final Map<String, String> _properties;

  /// Descriptive properties
  ///
  /// Example: {"os": "Ubuntu", "release": "jammy", "variant": "cloud"}
  @override
  Map<String, String> get properties {
    if (_properties is EqualUnmodifiableMapView) return _properties;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_properties);
  }

// Template for files in the image
  final Map<String, LxdImageMetadataTemplate> _templates;
// Template for files in the image
  @override
  Map<String, LxdImageMetadataTemplate> get templates {
    if (_templates is EqualUnmodifiableMapView) return _templates;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_templates);
  }

  @override
  String toString() {
    return 'LxdImageMetadata(architecture: $architecture, creationDate: $creationDate, expiryDate: $expiryDate, properties: $properties, templates: $templates)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LxdImageMetadata &&
            (identical(other.architecture, architecture) ||
                other.architecture == architecture) &&
            (identical(other.creationDate, creationDate) ||
                other.creationDate == creationDate) &&
            (identical(other.expiryDate, expiryDate) ||
                other.expiryDate == expiryDate) &&
            const DeepCollectionEquality()
                .equals(other._properties, _properties) &&
            const DeepCollectionEquality()
                .equals(other._templates, _templates));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      architecture,
      creationDate,
      expiryDate,
      const DeepCollectionEquality().hash(_properties),
      const DeepCollectionEquality().hash(_templates));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LxdImageMetadataCopyWith<_$_LxdImageMetadata> get copyWith =>
      __$$_LxdImageMetadataCopyWithImpl<_$_LxdImageMetadata>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_LxdImageMetadataToJson(
      this,
    );
  }
}

abstract class _LxdImageMetadata implements LxdImageMetadata {
  const factory _LxdImageMetadata(
          {required final String architecture,
          required final int creationDate,
          required final int expiryDate,
          required final Map<String, String> properties,
          required final Map<String, LxdImageMetadataTemplate> templates}) =
      _$_LxdImageMetadata;

  factory _LxdImageMetadata.fromJson(Map<String, dynamic> json) =
      _$_LxdImageMetadata.fromJson;

  @override

  /// Architecture name
  ///
  /// Example: x86_64
  String get architecture;
  @override

  /// Image creation data (as UNIX epoch)
  ///
  /// Example: 1620655439
  int get creationDate;
  @override

  /// Image expiry data (as UNIX epoch)
  ///
  /// Example: 1620685757
  int get expiryDate;
  @override

  /// Descriptive properties
  ///
  /// Example: {"os": "Ubuntu", "release": "jammy", "variant": "cloud"}
  Map<String, String> get properties;
  @override // Template for files in the image
  Map<String, LxdImageMetadataTemplate> get templates;
  @override
  @JsonKey(ignore: true)
  _$$_LxdImageMetadataCopyWith<_$_LxdImageMetadata> get copyWith =>
      throw _privateConstructorUsedError;
}

LxdImageMetadataTemplate _$LxdImageMetadataTemplateFromJson(
    Map<String, dynamic> json) {
  return _LxdImageMetadataTemplate.fromJson(json);
}

/// @nodoc
mixin _$LxdImageMetadataTemplate {
  /// When to trigger the template (create, copy or start)
  ///
  /// Example: create
  List<String> get when =>
      throw _privateConstructorUsedError; // /Whether to trigger only if the file is missing
  bool get createOnly => throw _privateConstructorUsedError;

  /// The template itself as a valid pongo2 template
  ///
  /// Example: pongo2-template
  String get template => throw _privateConstructorUsedError;

  /// Key/value properties to pass to the template
  ///
  /// Example: {"foo": "bar"}
  Map<String, String> get properties => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LxdImageMetadataTemplateCopyWith<LxdImageMetadataTemplate> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LxdImageMetadataTemplateCopyWith<$Res> {
  factory $LxdImageMetadataTemplateCopyWith(LxdImageMetadataTemplate value,
          $Res Function(LxdImageMetadataTemplate) then) =
      _$LxdImageMetadataTemplateCopyWithImpl<$Res, LxdImageMetadataTemplate>;
  @useResult
  $Res call(
      {List<String> when,
      bool createOnly,
      String template,
      Map<String, String> properties});
}

/// @nodoc
class _$LxdImageMetadataTemplateCopyWithImpl<$Res,
        $Val extends LxdImageMetadataTemplate>
    implements $LxdImageMetadataTemplateCopyWith<$Res> {
  _$LxdImageMetadataTemplateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? when = null,
    Object? createOnly = null,
    Object? template = null,
    Object? properties = null,
  }) {
    return _then(_value.copyWith(
      when: null == when
          ? _value.when
          : when // ignore: cast_nullable_to_non_nullable
              as List<String>,
      createOnly: null == createOnly
          ? _value.createOnly
          : createOnly // ignore: cast_nullable_to_non_nullable
              as bool,
      template: null == template
          ? _value.template
          : template // ignore: cast_nullable_to_non_nullable
              as String,
      properties: null == properties
          ? _value.properties
          : properties // ignore: cast_nullable_to_non_nullable
              as Map<String, String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_LxdImageMetadataTemplateCopyWith<$Res>
    implements $LxdImageMetadataTemplateCopyWith<$Res> {
  factory _$$_LxdImageMetadataTemplateCopyWith(
          _$_LxdImageMetadataTemplate value,
          $Res Function(_$_LxdImageMetadataTemplate) then) =
      __$$_LxdImageMetadataTemplateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<String> when,
      bool createOnly,
      String template,
      Map<String, String> properties});
}

/// @nodoc
class __$$_LxdImageMetadataTemplateCopyWithImpl<$Res>
    extends _$LxdImageMetadataTemplateCopyWithImpl<$Res,
        _$_LxdImageMetadataTemplate>
    implements _$$_LxdImageMetadataTemplateCopyWith<$Res> {
  __$$_LxdImageMetadataTemplateCopyWithImpl(_$_LxdImageMetadataTemplate _value,
      $Res Function(_$_LxdImageMetadataTemplate) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? when = null,
    Object? createOnly = null,
    Object? template = null,
    Object? properties = null,
  }) {
    return _then(_$_LxdImageMetadataTemplate(
      when: null == when
          ? _value._when
          : when // ignore: cast_nullable_to_non_nullable
              as List<String>,
      createOnly: null == createOnly
          ? _value.createOnly
          : createOnly // ignore: cast_nullable_to_non_nullable
              as bool,
      template: null == template
          ? _value.template
          : template // ignore: cast_nullable_to_non_nullable
              as String,
      properties: null == properties
          ? _value._properties
          : properties // ignore: cast_nullable_to_non_nullable
              as Map<String, String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_LxdImageMetadataTemplate implements _LxdImageMetadataTemplate {
  const _$_LxdImageMetadataTemplate(
      {required final List<String> when,
      required this.createOnly,
      required this.template,
      required final Map<String, String> properties})
      : _when = when,
        _properties = properties;

  factory _$_LxdImageMetadataTemplate.fromJson(Map<String, dynamic> json) =>
      _$$_LxdImageMetadataTemplateFromJson(json);

  /// When to trigger the template (create, copy or start)
  ///
  /// Example: create
  final List<String> _when;

  /// When to trigger the template (create, copy or start)
  ///
  /// Example: create
  @override
  List<String> get when {
    if (_when is EqualUnmodifiableListView) return _when;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_when);
  }

// /Whether to trigger only if the file is missing
  @override
  final bool createOnly;

  /// The template itself as a valid pongo2 template
  ///
  /// Example: pongo2-template
  @override
  final String template;

  /// Key/value properties to pass to the template
  ///
  /// Example: {"foo": "bar"}
  final Map<String, String> _properties;

  /// Key/value properties to pass to the template
  ///
  /// Example: {"foo": "bar"}
  @override
  Map<String, String> get properties {
    if (_properties is EqualUnmodifiableMapView) return _properties;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_properties);
  }

  @override
  String toString() {
    return 'LxdImageMetadataTemplate(when: $when, createOnly: $createOnly, template: $template, properties: $properties)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LxdImageMetadataTemplate &&
            const DeepCollectionEquality().equals(other._when, _when) &&
            (identical(other.createOnly, createOnly) ||
                other.createOnly == createOnly) &&
            (identical(other.template, template) ||
                other.template == template) &&
            const DeepCollectionEquality()
                .equals(other._properties, _properties));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_when),
      createOnly,
      template,
      const DeepCollectionEquality().hash(_properties));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LxdImageMetadataTemplateCopyWith<_$_LxdImageMetadataTemplate>
      get copyWith => __$$_LxdImageMetadataTemplateCopyWithImpl<
          _$_LxdImageMetadataTemplate>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_LxdImageMetadataTemplateToJson(
      this,
    );
  }
}

abstract class _LxdImageMetadataTemplate implements LxdImageMetadataTemplate {
  const factory _LxdImageMetadataTemplate(
          {required final List<String> when,
          required final bool createOnly,
          required final String template,
          required final Map<String, String> properties}) =
      _$_LxdImageMetadataTemplate;

  factory _LxdImageMetadataTemplate.fromJson(Map<String, dynamic> json) =
      _$_LxdImageMetadataTemplate.fromJson;

  @override

  /// When to trigger the template (create, copy or start)
  ///
  /// Example: create
  List<String> get when;
  @override // /Whether to trigger only if the file is missing
  bool get createOnly;
  @override

  /// The template itself as a valid pongo2 template
  ///
  /// Example: pongo2-template
  String get template;
  @override

  /// Key/value properties to pass to the template
  ///
  /// Example: {"foo": "bar"}
  Map<String, String> get properties;
  @override
  @JsonKey(ignore: true)
  _$$_LxdImageMetadataTemplateCopyWith<_$_LxdImageMetadataTemplate>
      get copyWith => throw _privateConstructorUsedError;
}
