// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'products.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SimpleProducts _$SimpleProductsFromJson(Map<String, dynamic> json) {
  return _SimpleProducts.fromJson(json);
}

/// @nodoc
mixin _$SimpleProducts {
  String? get contentId => throw _privateConstructorUsedError;
  String? get datatype => throw _privateConstructorUsedError;
  String? get format => throw _privateConstructorUsedError;
  String? get license => throw _privateConstructorUsedError;
  Map<String, SimpleProduct> get products => throw _privateConstructorUsedError;
  @DateTimeConverter()
  DateTime? get updated => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SimpleProductsCopyWith<SimpleProducts> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SimpleProductsCopyWith<$Res> {
  factory $SimpleProductsCopyWith(
          SimpleProducts value, $Res Function(SimpleProducts) then) =
      _$SimpleProductsCopyWithImpl<$Res, SimpleProducts>;
  @useResult
  $Res call(
      {String? contentId,
      String? datatype,
      String? format,
      String? license,
      Map<String, SimpleProduct> products,
      @DateTimeConverter() DateTime? updated});
}

/// @nodoc
class _$SimpleProductsCopyWithImpl<$Res, $Val extends SimpleProducts>
    implements $SimpleProductsCopyWith<$Res> {
  _$SimpleProductsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? contentId = freezed,
    Object? datatype = freezed,
    Object? format = freezed,
    Object? license = freezed,
    Object? products = null,
    Object? updated = freezed,
  }) {
    return _then(_value.copyWith(
      contentId: freezed == contentId
          ? _value.contentId
          : contentId // ignore: cast_nullable_to_non_nullable
              as String?,
      datatype: freezed == datatype
          ? _value.datatype
          : datatype // ignore: cast_nullable_to_non_nullable
              as String?,
      format: freezed == format
          ? _value.format
          : format // ignore: cast_nullable_to_non_nullable
              as String?,
      license: freezed == license
          ? _value.license
          : license // ignore: cast_nullable_to_non_nullable
              as String?,
      products: null == products
          ? _value.products
          : products // ignore: cast_nullable_to_non_nullable
              as Map<String, SimpleProduct>,
      updated: freezed == updated
          ? _value.updated
          : updated // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SimpleProductsCopyWith<$Res>
    implements $SimpleProductsCopyWith<$Res> {
  factory _$$_SimpleProductsCopyWith(
          _$_SimpleProducts value, $Res Function(_$_SimpleProducts) then) =
      __$$_SimpleProductsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? contentId,
      String? datatype,
      String? format,
      String? license,
      Map<String, SimpleProduct> products,
      @DateTimeConverter() DateTime? updated});
}

/// @nodoc
class __$$_SimpleProductsCopyWithImpl<$Res>
    extends _$SimpleProductsCopyWithImpl<$Res, _$_SimpleProducts>
    implements _$$_SimpleProductsCopyWith<$Res> {
  __$$_SimpleProductsCopyWithImpl(
      _$_SimpleProducts _value, $Res Function(_$_SimpleProducts) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? contentId = freezed,
    Object? datatype = freezed,
    Object? format = freezed,
    Object? license = freezed,
    Object? products = null,
    Object? updated = freezed,
  }) {
    return _then(_$_SimpleProducts(
      contentId: freezed == contentId
          ? _value.contentId
          : contentId // ignore: cast_nullable_to_non_nullable
              as String?,
      datatype: freezed == datatype
          ? _value.datatype
          : datatype // ignore: cast_nullable_to_non_nullable
              as String?,
      format: freezed == format
          ? _value.format
          : format // ignore: cast_nullable_to_non_nullable
              as String?,
      license: freezed == license
          ? _value.license
          : license // ignore: cast_nullable_to_non_nullable
              as String?,
      products: null == products
          ? _value._products
          : products // ignore: cast_nullable_to_non_nullable
              as Map<String, SimpleProduct>,
      updated: freezed == updated
          ? _value.updated
          : updated // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SimpleProducts implements _SimpleProducts {
  const _$_SimpleProducts(
      {this.contentId,
      this.datatype,
      this.format,
      this.license,
      required final Map<String, SimpleProduct> products,
      @DateTimeConverter() this.updated})
      : _products = products;

  factory _$_SimpleProducts.fromJson(Map<String, dynamic> json) =>
      _$$_SimpleProductsFromJson(json);

  @override
  final String? contentId;
  @override
  final String? datatype;
  @override
  final String? format;
  @override
  final String? license;
  final Map<String, SimpleProduct> _products;
  @override
  Map<String, SimpleProduct> get products {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_products);
  }

  @override
  @DateTimeConverter()
  final DateTime? updated;

  @override
  String toString() {
    return 'SimpleProducts(contentId: $contentId, datatype: $datatype, format: $format, license: $license, products: $products, updated: $updated)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SimpleProducts &&
            (identical(other.contentId, contentId) ||
                other.contentId == contentId) &&
            (identical(other.datatype, datatype) ||
                other.datatype == datatype) &&
            (identical(other.format, format) || other.format == format) &&
            (identical(other.license, license) || other.license == license) &&
            const DeepCollectionEquality().equals(other._products, _products) &&
            (identical(other.updated, updated) || other.updated == updated));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, contentId, datatype, format,
      license, const DeepCollectionEquality().hash(_products), updated);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SimpleProductsCopyWith<_$_SimpleProducts> get copyWith =>
      __$$_SimpleProductsCopyWithImpl<_$_SimpleProducts>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SimpleProductsToJson(
      this,
    );
  }
}

abstract class _SimpleProducts implements SimpleProducts {
  const factory _SimpleProducts(
      {final String? contentId,
      final String? datatype,
      final String? format,
      final String? license,
      required final Map<String, SimpleProduct> products,
      @DateTimeConverter() final DateTime? updated}) = _$_SimpleProducts;

  factory _SimpleProducts.fromJson(Map<String, dynamic> json) =
      _$_SimpleProducts.fromJson;

  @override
  String? get contentId;
  @override
  String? get datatype;
  @override
  String? get format;
  @override
  String? get license;
  @override
  Map<String, SimpleProduct> get products;
  @override
  @DateTimeConverter()
  DateTime? get updated;
  @override
  @JsonKey(ignore: true)
  _$$_SimpleProductsCopyWith<_$_SimpleProducts> get copyWith =>
      throw _privateConstructorUsedError;
}

SimpleProduct _$SimpleProductFromJson(Map<String, dynamic> json) {
  return _SimpleProduct.fromJson(json);
}

/// @nodoc
mixin _$SimpleProduct {
  @AliasConverter()
  List<String>? get aliases => throw _privateConstructorUsedError;
  String get arch => throw _privateConstructorUsedError;
  String? get os => throw _privateConstructorUsedError;
  String? get release => throw _privateConstructorUsedError;
  String? get releaseCodename => throw _privateConstructorUsedError;
  String? get releaseTitle => throw _privateConstructorUsedError;
  bool get supported => throw _privateConstructorUsedError;
  @DateTimeConverter()
  DateTime? get supportEol => throw _privateConstructorUsedError;
  String? get variant => throw _privateConstructorUsedError;
  String? get version => throw _privateConstructorUsedError;
  Map<String, SimpleVersion> get versions => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SimpleProductCopyWith<SimpleProduct> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SimpleProductCopyWith<$Res> {
  factory $SimpleProductCopyWith(
          SimpleProduct value, $Res Function(SimpleProduct) then) =
      _$SimpleProductCopyWithImpl<$Res, SimpleProduct>;
  @useResult
  $Res call(
      {@AliasConverter() List<String>? aliases,
      String arch,
      String? os,
      String? release,
      String? releaseCodename,
      String? releaseTitle,
      bool supported,
      @DateTimeConverter() DateTime? supportEol,
      String? variant,
      String? version,
      Map<String, SimpleVersion> versions});
}

/// @nodoc
class _$SimpleProductCopyWithImpl<$Res, $Val extends SimpleProduct>
    implements $SimpleProductCopyWith<$Res> {
  _$SimpleProductCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? aliases = freezed,
    Object? arch = null,
    Object? os = freezed,
    Object? release = freezed,
    Object? releaseCodename = freezed,
    Object? releaseTitle = freezed,
    Object? supported = null,
    Object? supportEol = freezed,
    Object? variant = freezed,
    Object? version = freezed,
    Object? versions = null,
  }) {
    return _then(_value.copyWith(
      aliases: freezed == aliases
          ? _value.aliases
          : aliases // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      arch: null == arch
          ? _value.arch
          : arch // ignore: cast_nullable_to_non_nullable
              as String,
      os: freezed == os
          ? _value.os
          : os // ignore: cast_nullable_to_non_nullable
              as String?,
      release: freezed == release
          ? _value.release
          : release // ignore: cast_nullable_to_non_nullable
              as String?,
      releaseCodename: freezed == releaseCodename
          ? _value.releaseCodename
          : releaseCodename // ignore: cast_nullable_to_non_nullable
              as String?,
      releaseTitle: freezed == releaseTitle
          ? _value.releaseTitle
          : releaseTitle // ignore: cast_nullable_to_non_nullable
              as String?,
      supported: null == supported
          ? _value.supported
          : supported // ignore: cast_nullable_to_non_nullable
              as bool,
      supportEol: freezed == supportEol
          ? _value.supportEol
          : supportEol // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      variant: freezed == variant
          ? _value.variant
          : variant // ignore: cast_nullable_to_non_nullable
              as String?,
      version: freezed == version
          ? _value.version
          : version // ignore: cast_nullable_to_non_nullable
              as String?,
      versions: null == versions
          ? _value.versions
          : versions // ignore: cast_nullable_to_non_nullable
              as Map<String, SimpleVersion>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SimpleProductCopyWith<$Res>
    implements $SimpleProductCopyWith<$Res> {
  factory _$$_SimpleProductCopyWith(
          _$_SimpleProduct value, $Res Function(_$_SimpleProduct) then) =
      __$$_SimpleProductCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@AliasConverter() List<String>? aliases,
      String arch,
      String? os,
      String? release,
      String? releaseCodename,
      String? releaseTitle,
      bool supported,
      @DateTimeConverter() DateTime? supportEol,
      String? variant,
      String? version,
      Map<String, SimpleVersion> versions});
}

/// @nodoc
class __$$_SimpleProductCopyWithImpl<$Res>
    extends _$SimpleProductCopyWithImpl<$Res, _$_SimpleProduct>
    implements _$$_SimpleProductCopyWith<$Res> {
  __$$_SimpleProductCopyWithImpl(
      _$_SimpleProduct _value, $Res Function(_$_SimpleProduct) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? aliases = freezed,
    Object? arch = null,
    Object? os = freezed,
    Object? release = freezed,
    Object? releaseCodename = freezed,
    Object? releaseTitle = freezed,
    Object? supported = null,
    Object? supportEol = freezed,
    Object? variant = freezed,
    Object? version = freezed,
    Object? versions = null,
  }) {
    return _then(_$_SimpleProduct(
      aliases: freezed == aliases
          ? _value._aliases
          : aliases // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      arch: null == arch
          ? _value.arch
          : arch // ignore: cast_nullable_to_non_nullable
              as String,
      os: freezed == os
          ? _value.os
          : os // ignore: cast_nullable_to_non_nullable
              as String?,
      release: freezed == release
          ? _value.release
          : release // ignore: cast_nullable_to_non_nullable
              as String?,
      releaseCodename: freezed == releaseCodename
          ? _value.releaseCodename
          : releaseCodename // ignore: cast_nullable_to_non_nullable
              as String?,
      releaseTitle: freezed == releaseTitle
          ? _value.releaseTitle
          : releaseTitle // ignore: cast_nullable_to_non_nullable
              as String?,
      supported: null == supported
          ? _value.supported
          : supported // ignore: cast_nullable_to_non_nullable
              as bool,
      supportEol: freezed == supportEol
          ? _value.supportEol
          : supportEol // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      variant: freezed == variant
          ? _value.variant
          : variant // ignore: cast_nullable_to_non_nullable
              as String?,
      version: freezed == version
          ? _value.version
          : version // ignore: cast_nullable_to_non_nullable
              as String?,
      versions: null == versions
          ? _value._versions
          : versions // ignore: cast_nullable_to_non_nullable
              as Map<String, SimpleVersion>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SimpleProduct implements _SimpleProduct {
  const _$_SimpleProduct(
      {@AliasConverter() final List<String>? aliases,
      required this.arch,
      this.os,
      this.release,
      this.releaseCodename,
      this.releaseTitle,
      this.supported = true,
      @DateTimeConverter() this.supportEol,
      this.variant,
      this.version,
      required final Map<String, SimpleVersion> versions})
      : _aliases = aliases,
        _versions = versions;

  factory _$_SimpleProduct.fromJson(Map<String, dynamic> json) =>
      _$$_SimpleProductFromJson(json);

  final List<String>? _aliases;
  @override
  @AliasConverter()
  List<String>? get aliases {
    final value = _aliases;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String arch;
  @override
  final String? os;
  @override
  final String? release;
  @override
  final String? releaseCodename;
  @override
  final String? releaseTitle;
  @override
  @JsonKey()
  final bool supported;
  @override
  @DateTimeConverter()
  final DateTime? supportEol;
  @override
  final String? variant;
  @override
  final String? version;
  final Map<String, SimpleVersion> _versions;
  @override
  Map<String, SimpleVersion> get versions {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_versions);
  }

  @override
  String toString() {
    return 'SimpleProduct(aliases: $aliases, arch: $arch, os: $os, release: $release, releaseCodename: $releaseCodename, releaseTitle: $releaseTitle, supported: $supported, supportEol: $supportEol, variant: $variant, version: $version, versions: $versions)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SimpleProduct &&
            const DeepCollectionEquality().equals(other._aliases, _aliases) &&
            (identical(other.arch, arch) || other.arch == arch) &&
            (identical(other.os, os) || other.os == os) &&
            (identical(other.release, release) || other.release == release) &&
            (identical(other.releaseCodename, releaseCodename) ||
                other.releaseCodename == releaseCodename) &&
            (identical(other.releaseTitle, releaseTitle) ||
                other.releaseTitle == releaseTitle) &&
            (identical(other.supported, supported) ||
                other.supported == supported) &&
            (identical(other.supportEol, supportEol) ||
                other.supportEol == supportEol) &&
            (identical(other.variant, variant) || other.variant == variant) &&
            (identical(other.version, version) || other.version == version) &&
            const DeepCollectionEquality().equals(other._versions, _versions));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_aliases),
      arch,
      os,
      release,
      releaseCodename,
      releaseTitle,
      supported,
      supportEol,
      variant,
      version,
      const DeepCollectionEquality().hash(_versions));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SimpleProductCopyWith<_$_SimpleProduct> get copyWith =>
      __$$_SimpleProductCopyWithImpl<_$_SimpleProduct>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SimpleProductToJson(
      this,
    );
  }
}

abstract class _SimpleProduct implements SimpleProduct {
  const factory _SimpleProduct(
      {@AliasConverter() final List<String>? aliases,
      required final String arch,
      final String? os,
      final String? release,
      final String? releaseCodename,
      final String? releaseTitle,
      final bool supported,
      @DateTimeConverter() final DateTime? supportEol,
      final String? variant,
      final String? version,
      required final Map<String, SimpleVersion> versions}) = _$_SimpleProduct;

  factory _SimpleProduct.fromJson(Map<String, dynamic> json) =
      _$_SimpleProduct.fromJson;

  @override
  @AliasConverter()
  List<String>? get aliases;
  @override
  String get arch;
  @override
  String? get os;
  @override
  String? get release;
  @override
  String? get releaseCodename;
  @override
  String? get releaseTitle;
  @override
  bool get supported;
  @override
  @DateTimeConverter()
  DateTime? get supportEol;
  @override
  String? get variant;
  @override
  String? get version;
  @override
  Map<String, SimpleVersion> get versions;
  @override
  @JsonKey(ignore: true)
  _$$_SimpleProductCopyWith<_$_SimpleProduct> get copyWith =>
      throw _privateConstructorUsedError;
}

SimpleVersion _$SimpleVersionFromJson(Map<String, dynamic> json) {
  return _SimpleVersion.fromJson(json);
}

/// @nodoc
mixin _$SimpleVersion {
  @SimpleItemConverter()
  Map<String, SimpleItem> get items => throw _privateConstructorUsedError;
  String? get label => throw _privateConstructorUsedError;
  String? get pubname => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SimpleVersionCopyWith<SimpleVersion> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SimpleVersionCopyWith<$Res> {
  factory $SimpleVersionCopyWith(
          SimpleVersion value, $Res Function(SimpleVersion) then) =
      _$SimpleVersionCopyWithImpl<$Res, SimpleVersion>;
  @useResult
  $Res call(
      {@SimpleItemConverter() Map<String, SimpleItem> items,
      String? label,
      String? pubname});
}

/// @nodoc
class _$SimpleVersionCopyWithImpl<$Res, $Val extends SimpleVersion>
    implements $SimpleVersionCopyWith<$Res> {
  _$SimpleVersionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = null,
    Object? label = freezed,
    Object? pubname = freezed,
  }) {
    return _then(_value.copyWith(
      items: null == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as Map<String, SimpleItem>,
      label: freezed == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String?,
      pubname: freezed == pubname
          ? _value.pubname
          : pubname // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SimpleVersionCopyWith<$Res>
    implements $SimpleVersionCopyWith<$Res> {
  factory _$$_SimpleVersionCopyWith(
          _$_SimpleVersion value, $Res Function(_$_SimpleVersion) then) =
      __$$_SimpleVersionCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@SimpleItemConverter() Map<String, SimpleItem> items,
      String? label,
      String? pubname});
}

/// @nodoc
class __$$_SimpleVersionCopyWithImpl<$Res>
    extends _$SimpleVersionCopyWithImpl<$Res, _$_SimpleVersion>
    implements _$$_SimpleVersionCopyWith<$Res> {
  __$$_SimpleVersionCopyWithImpl(
      _$_SimpleVersion _value, $Res Function(_$_SimpleVersion) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = null,
    Object? label = freezed,
    Object? pubname = freezed,
  }) {
    return _then(_$_SimpleVersion(
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as Map<String, SimpleItem>,
      label: freezed == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String?,
      pubname: freezed == pubname
          ? _value.pubname
          : pubname // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SimpleVersion implements _SimpleVersion {
  const _$_SimpleVersion(
      {@SimpleItemConverter() final Map<String, SimpleItem> items = const {},
      this.label,
      this.pubname})
      : _items = items;

  factory _$_SimpleVersion.fromJson(Map<String, dynamic> json) =>
      _$$_SimpleVersionFromJson(json);

  final Map<String, SimpleItem> _items;
  @override
  @JsonKey()
  @SimpleItemConverter()
  Map<String, SimpleItem> get items {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_items);
  }

  @override
  final String? label;
  @override
  final String? pubname;

  @override
  String toString() {
    return 'SimpleVersion(items: $items, label: $label, pubname: $pubname)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SimpleVersion &&
            const DeepCollectionEquality().equals(other._items, _items) &&
            (identical(other.label, label) || other.label == label) &&
            (identical(other.pubname, pubname) || other.pubname == pubname));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_items), label, pubname);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SimpleVersionCopyWith<_$_SimpleVersion> get copyWith =>
      __$$_SimpleVersionCopyWithImpl<_$_SimpleVersion>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SimpleVersionToJson(
      this,
    );
  }
}

abstract class _SimpleVersion implements SimpleVersion {
  const factory _SimpleVersion(
      {@SimpleItemConverter() final Map<String, SimpleItem> items,
      final String? label,
      final String? pubname}) = _$_SimpleVersion;

  factory _SimpleVersion.fromJson(Map<String, dynamic> json) =
      _$_SimpleVersion.fromJson;

  @override
  @SimpleItemConverter()
  Map<String, SimpleItem> get items;
  @override
  String? get label;
  @override
  String? get pubname;
  @override
  @JsonKey(ignore: true)
  _$$_SimpleVersionCopyWith<_$_SimpleVersion> get copyWith =>
      throw _privateConstructorUsedError;
}

SimpleItem _$SimpleItemFromJson(Map<String, dynamic> json) {
  switch (json['runtimeType']) {
    case 'download':
      return SimpleDownload.fromJson(json);
    case 'id':
      return SimpleId.fromJson(json);

    default:
      throw CheckedFromJsonException(json, 'runtimeType', 'SimpleItem',
          'Invalid union type "${json['runtimeType']}"!');
  }
}

/// @nodoc
mixin _$SimpleItem {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            @JsonKey(name: 'combined_disk1-img_sha256')
                String? combinedDisk1ImgSha256,
            @JsonKey(name: 'combined_disk-kvm-img_sha256')
                String? combinedDiskKvmImgSha256,
            @JsonKey(name: 'combined_uefi1-img_sha256')
                String? combinedUefi1ImgSha256,
            String? combinedRootxzSha256,
            String? combinedSha256,
            String? combinedSquashfsSha256,
            String ftype,
            String? deltaBase,
            String? md5,
            String path,
            String? sha256,
            int size)
        download,
    required TResult Function(
            String? crsn, String? id, String? rootStore, String? virt)
        id,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            @JsonKey(name: 'combined_disk1-img_sha256')
                String? combinedDisk1ImgSha256,
            @JsonKey(name: 'combined_disk-kvm-img_sha256')
                String? combinedDiskKvmImgSha256,
            @JsonKey(name: 'combined_uefi1-img_sha256')
                String? combinedUefi1ImgSha256,
            String? combinedRootxzSha256,
            String? combinedSha256,
            String? combinedSquashfsSha256,
            String ftype,
            String? deltaBase,
            String? md5,
            String path,
            String? sha256,
            int size)?
        download,
    TResult? Function(
            String? crsn, String? id, String? rootStore, String? virt)?
        id,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            @JsonKey(name: 'combined_disk1-img_sha256')
                String? combinedDisk1ImgSha256,
            @JsonKey(name: 'combined_disk-kvm-img_sha256')
                String? combinedDiskKvmImgSha256,
            @JsonKey(name: 'combined_uefi1-img_sha256')
                String? combinedUefi1ImgSha256,
            String? combinedRootxzSha256,
            String? combinedSha256,
            String? combinedSquashfsSha256,
            String ftype,
            String? deltaBase,
            String? md5,
            String path,
            String? sha256,
            int size)?
        download,
    TResult Function(String? crsn, String? id, String? rootStore, String? virt)?
        id,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SimpleDownload value) download,
    required TResult Function(SimpleId value) id,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SimpleDownload value)? download,
    TResult? Function(SimpleId value)? id,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SimpleDownload value)? download,
    TResult Function(SimpleId value)? id,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SimpleItemCopyWith<$Res> {
  factory $SimpleItemCopyWith(
          SimpleItem value, $Res Function(SimpleItem) then) =
      _$SimpleItemCopyWithImpl<$Res, SimpleItem>;
}

/// @nodoc
class _$SimpleItemCopyWithImpl<$Res, $Val extends SimpleItem>
    implements $SimpleItemCopyWith<$Res> {
  _$SimpleItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$SimpleDownloadCopyWith<$Res> {
  factory _$$SimpleDownloadCopyWith(
          _$SimpleDownload value, $Res Function(_$SimpleDownload) then) =
      __$$SimpleDownloadCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {@JsonKey(name: 'combined_disk1-img_sha256')
          String? combinedDisk1ImgSha256,
      @JsonKey(name: 'combined_disk-kvm-img_sha256')
          String? combinedDiskKvmImgSha256,
      @JsonKey(name: 'combined_uefi1-img_sha256')
          String? combinedUefi1ImgSha256,
      String? combinedRootxzSha256,
      String? combinedSha256,
      String? combinedSquashfsSha256,
      String ftype,
      String? deltaBase,
      String? md5,
      String path,
      String? sha256,
      int size});
}

/// @nodoc
class __$$SimpleDownloadCopyWithImpl<$Res>
    extends _$SimpleItemCopyWithImpl<$Res, _$SimpleDownload>
    implements _$$SimpleDownloadCopyWith<$Res> {
  __$$SimpleDownloadCopyWithImpl(
      _$SimpleDownload _value, $Res Function(_$SimpleDownload) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? combinedDisk1ImgSha256 = freezed,
    Object? combinedDiskKvmImgSha256 = freezed,
    Object? combinedUefi1ImgSha256 = freezed,
    Object? combinedRootxzSha256 = freezed,
    Object? combinedSha256 = freezed,
    Object? combinedSquashfsSha256 = freezed,
    Object? ftype = null,
    Object? deltaBase = freezed,
    Object? md5 = freezed,
    Object? path = null,
    Object? sha256 = freezed,
    Object? size = null,
  }) {
    return _then(_$SimpleDownload(
      combinedDisk1ImgSha256: freezed == combinedDisk1ImgSha256
          ? _value.combinedDisk1ImgSha256
          : combinedDisk1ImgSha256 // ignore: cast_nullable_to_non_nullable
              as String?,
      combinedDiskKvmImgSha256: freezed == combinedDiskKvmImgSha256
          ? _value.combinedDiskKvmImgSha256
          : combinedDiskKvmImgSha256 // ignore: cast_nullable_to_non_nullable
              as String?,
      combinedUefi1ImgSha256: freezed == combinedUefi1ImgSha256
          ? _value.combinedUefi1ImgSha256
          : combinedUefi1ImgSha256 // ignore: cast_nullable_to_non_nullable
              as String?,
      combinedRootxzSha256: freezed == combinedRootxzSha256
          ? _value.combinedRootxzSha256
          : combinedRootxzSha256 // ignore: cast_nullable_to_non_nullable
              as String?,
      combinedSha256: freezed == combinedSha256
          ? _value.combinedSha256
          : combinedSha256 // ignore: cast_nullable_to_non_nullable
              as String?,
      combinedSquashfsSha256: freezed == combinedSquashfsSha256
          ? _value.combinedSquashfsSha256
          : combinedSquashfsSha256 // ignore: cast_nullable_to_non_nullable
              as String?,
      ftype: null == ftype
          ? _value.ftype
          : ftype // ignore: cast_nullable_to_non_nullable
              as String,
      deltaBase: freezed == deltaBase
          ? _value.deltaBase
          : deltaBase // ignore: cast_nullable_to_non_nullable
              as String?,
      md5: freezed == md5
          ? _value.md5
          : md5 // ignore: cast_nullable_to_non_nullable
              as String?,
      path: null == path
          ? _value.path
          : path // ignore: cast_nullable_to_non_nullable
              as String,
      sha256: freezed == sha256
          ? _value.sha256
          : sha256 // ignore: cast_nullable_to_non_nullable
              as String?,
      size: null == size
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SimpleDownload implements SimpleDownload {
  const _$SimpleDownload(
      {@JsonKey(name: 'combined_disk1-img_sha256')
          this.combinedDisk1ImgSha256,
      @JsonKey(name: 'combined_disk-kvm-img_sha256')
          this.combinedDiskKvmImgSha256,
      @JsonKey(name: 'combined_uefi1-img_sha256')
          this.combinedUefi1ImgSha256,
      this.combinedRootxzSha256,
      this.combinedSha256,
      this.combinedSquashfsSha256,
      required this.ftype,
      this.deltaBase,
      this.md5,
      required this.path,
      this.sha256,
      required this.size,
      final String? $type})
      : $type = $type ?? 'download';

  factory _$SimpleDownload.fromJson(Map<String, dynamic> json) =>
      _$$SimpleDownloadFromJson(json);

  @override
  @JsonKey(name: 'combined_disk1-img_sha256')
  final String? combinedDisk1ImgSha256;
  @override
  @JsonKey(name: 'combined_disk-kvm-img_sha256')
  final String? combinedDiskKvmImgSha256;
  @override
  @JsonKey(name: 'combined_uefi1-img_sha256')
  final String? combinedUefi1ImgSha256;
  @override
  final String? combinedRootxzSha256;
  @override
  final String? combinedSha256;
  @override
  final String? combinedSquashfsSha256;
  @override
  final String ftype;
  @override
  final String? deltaBase;
  @override
  final String? md5;
  @override
  final String path;
  @override
  final String? sha256;
  @override
  final int size;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'SimpleItem.download(combinedDisk1ImgSha256: $combinedDisk1ImgSha256, combinedDiskKvmImgSha256: $combinedDiskKvmImgSha256, combinedUefi1ImgSha256: $combinedUefi1ImgSha256, combinedRootxzSha256: $combinedRootxzSha256, combinedSha256: $combinedSha256, combinedSquashfsSha256: $combinedSquashfsSha256, ftype: $ftype, deltaBase: $deltaBase, md5: $md5, path: $path, sha256: $sha256, size: $size)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SimpleDownload &&
            (identical(other.combinedDisk1ImgSha256, combinedDisk1ImgSha256) ||
                other.combinedDisk1ImgSha256 == combinedDisk1ImgSha256) &&
            (identical(
                    other.combinedDiskKvmImgSha256, combinedDiskKvmImgSha256) ||
                other.combinedDiskKvmImgSha256 == combinedDiskKvmImgSha256) &&
            (identical(other.combinedUefi1ImgSha256, combinedUefi1ImgSha256) ||
                other.combinedUefi1ImgSha256 == combinedUefi1ImgSha256) &&
            (identical(other.combinedRootxzSha256, combinedRootxzSha256) ||
                other.combinedRootxzSha256 == combinedRootxzSha256) &&
            (identical(other.combinedSha256, combinedSha256) ||
                other.combinedSha256 == combinedSha256) &&
            (identical(other.combinedSquashfsSha256, combinedSquashfsSha256) ||
                other.combinedSquashfsSha256 == combinedSquashfsSha256) &&
            (identical(other.ftype, ftype) || other.ftype == ftype) &&
            (identical(other.deltaBase, deltaBase) ||
                other.deltaBase == deltaBase) &&
            (identical(other.md5, md5) || other.md5 == md5) &&
            (identical(other.path, path) || other.path == path) &&
            (identical(other.sha256, sha256) || other.sha256 == sha256) &&
            (identical(other.size, size) || other.size == size));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      combinedDisk1ImgSha256,
      combinedDiskKvmImgSha256,
      combinedUefi1ImgSha256,
      combinedRootxzSha256,
      combinedSha256,
      combinedSquashfsSha256,
      ftype,
      deltaBase,
      md5,
      path,
      sha256,
      size);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SimpleDownloadCopyWith<_$SimpleDownload> get copyWith =>
      __$$SimpleDownloadCopyWithImpl<_$SimpleDownload>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            @JsonKey(name: 'combined_disk1-img_sha256')
                String? combinedDisk1ImgSha256,
            @JsonKey(name: 'combined_disk-kvm-img_sha256')
                String? combinedDiskKvmImgSha256,
            @JsonKey(name: 'combined_uefi1-img_sha256')
                String? combinedUefi1ImgSha256,
            String? combinedRootxzSha256,
            String? combinedSha256,
            String? combinedSquashfsSha256,
            String ftype,
            String? deltaBase,
            String? md5,
            String path,
            String? sha256,
            int size)
        download,
    required TResult Function(
            String? crsn, String? id, String? rootStore, String? virt)
        id,
  }) {
    return download(
        combinedDisk1ImgSha256,
        combinedDiskKvmImgSha256,
        combinedUefi1ImgSha256,
        combinedRootxzSha256,
        combinedSha256,
        combinedSquashfsSha256,
        ftype,
        deltaBase,
        md5,
        path,
        sha256,
        size);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            @JsonKey(name: 'combined_disk1-img_sha256')
                String? combinedDisk1ImgSha256,
            @JsonKey(name: 'combined_disk-kvm-img_sha256')
                String? combinedDiskKvmImgSha256,
            @JsonKey(name: 'combined_uefi1-img_sha256')
                String? combinedUefi1ImgSha256,
            String? combinedRootxzSha256,
            String? combinedSha256,
            String? combinedSquashfsSha256,
            String ftype,
            String? deltaBase,
            String? md5,
            String path,
            String? sha256,
            int size)?
        download,
    TResult? Function(
            String? crsn, String? id, String? rootStore, String? virt)?
        id,
  }) {
    return download?.call(
        combinedDisk1ImgSha256,
        combinedDiskKvmImgSha256,
        combinedUefi1ImgSha256,
        combinedRootxzSha256,
        combinedSha256,
        combinedSquashfsSha256,
        ftype,
        deltaBase,
        md5,
        path,
        sha256,
        size);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            @JsonKey(name: 'combined_disk1-img_sha256')
                String? combinedDisk1ImgSha256,
            @JsonKey(name: 'combined_disk-kvm-img_sha256')
                String? combinedDiskKvmImgSha256,
            @JsonKey(name: 'combined_uefi1-img_sha256')
                String? combinedUefi1ImgSha256,
            String? combinedRootxzSha256,
            String? combinedSha256,
            String? combinedSquashfsSha256,
            String ftype,
            String? deltaBase,
            String? md5,
            String path,
            String? sha256,
            int size)?
        download,
    TResult Function(String? crsn, String? id, String? rootStore, String? virt)?
        id,
    required TResult orElse(),
  }) {
    if (download != null) {
      return download(
          combinedDisk1ImgSha256,
          combinedDiskKvmImgSha256,
          combinedUefi1ImgSha256,
          combinedRootxzSha256,
          combinedSha256,
          combinedSquashfsSha256,
          ftype,
          deltaBase,
          md5,
          path,
          sha256,
          size);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SimpleDownload value) download,
    required TResult Function(SimpleId value) id,
  }) {
    return download(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SimpleDownload value)? download,
    TResult? Function(SimpleId value)? id,
  }) {
    return download?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SimpleDownload value)? download,
    TResult Function(SimpleId value)? id,
    required TResult orElse(),
  }) {
    if (download != null) {
      return download(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$SimpleDownloadToJson(
      this,
    );
  }
}

abstract class SimpleDownload implements SimpleItem {
  const factory SimpleDownload(
      {@JsonKey(name: 'combined_disk1-img_sha256')
          final String? combinedDisk1ImgSha256,
      @JsonKey(name: 'combined_disk-kvm-img_sha256')
          final String? combinedDiskKvmImgSha256,
      @JsonKey(name: 'combined_uefi1-img_sha256')
          final String? combinedUefi1ImgSha256,
      final String? combinedRootxzSha256,
      final String? combinedSha256,
      final String? combinedSquashfsSha256,
      required final String ftype,
      final String? deltaBase,
      final String? md5,
      required final String path,
      final String? sha256,
      required final int size}) = _$SimpleDownload;

  factory SimpleDownload.fromJson(Map<String, dynamic> json) =
      _$SimpleDownload.fromJson;

  @JsonKey(name: 'combined_disk1-img_sha256')
  String? get combinedDisk1ImgSha256;
  @JsonKey(name: 'combined_disk-kvm-img_sha256')
  String? get combinedDiskKvmImgSha256;
  @JsonKey(name: 'combined_uefi1-img_sha256')
  String? get combinedUefi1ImgSha256;
  String? get combinedRootxzSha256;
  String? get combinedSha256;
  String? get combinedSquashfsSha256;
  String get ftype;
  String? get deltaBase;
  String? get md5;
  String get path;
  String? get sha256;
  int get size;
  @JsonKey(ignore: true)
  _$$SimpleDownloadCopyWith<_$SimpleDownload> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SimpleIdCopyWith<$Res> {
  factory _$$SimpleIdCopyWith(
          _$SimpleId value, $Res Function(_$SimpleId) then) =
      __$$SimpleIdCopyWithImpl<$Res>;
  @useResult
  $Res call({String? crsn, String? id, String? rootStore, String? virt});
}

/// @nodoc
class __$$SimpleIdCopyWithImpl<$Res>
    extends _$SimpleItemCopyWithImpl<$Res, _$SimpleId>
    implements _$$SimpleIdCopyWith<$Res> {
  __$$SimpleIdCopyWithImpl(_$SimpleId _value, $Res Function(_$SimpleId) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? crsn = freezed,
    Object? id = freezed,
    Object? rootStore = freezed,
    Object? virt = freezed,
  }) {
    return _then(_$SimpleId(
      crsn: freezed == crsn
          ? _value.crsn
          : crsn // ignore: cast_nullable_to_non_nullable
              as String?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      rootStore: freezed == rootStore
          ? _value.rootStore
          : rootStore // ignore: cast_nullable_to_non_nullable
              as String?,
      virt: freezed == virt
          ? _value.virt
          : virt // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SimpleId implements SimpleId {
  const _$SimpleId(
      {required this.crsn,
      required this.id,
      required this.rootStore,
      required this.virt,
      final String? $type})
      : $type = $type ?? 'id';

  factory _$SimpleId.fromJson(Map<String, dynamic> json) =>
      _$$SimpleIdFromJson(json);

  @override
  final String? crsn;
  @override
  final String? id;
  @override
  final String? rootStore;
  @override
  final String? virt;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'SimpleItem.id(crsn: $crsn, id: $id, rootStore: $rootStore, virt: $virt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SimpleId &&
            (identical(other.crsn, crsn) || other.crsn == crsn) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.rootStore, rootStore) ||
                other.rootStore == rootStore) &&
            (identical(other.virt, virt) || other.virt == virt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, crsn, id, rootStore, virt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SimpleIdCopyWith<_$SimpleId> get copyWith =>
      __$$SimpleIdCopyWithImpl<_$SimpleId>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            @JsonKey(name: 'combined_disk1-img_sha256')
                String? combinedDisk1ImgSha256,
            @JsonKey(name: 'combined_disk-kvm-img_sha256')
                String? combinedDiskKvmImgSha256,
            @JsonKey(name: 'combined_uefi1-img_sha256')
                String? combinedUefi1ImgSha256,
            String? combinedRootxzSha256,
            String? combinedSha256,
            String? combinedSquashfsSha256,
            String ftype,
            String? deltaBase,
            String? md5,
            String path,
            String? sha256,
            int size)
        download,
    required TResult Function(
            String? crsn, String? id, String? rootStore, String? virt)
        id,
  }) {
    return id(crsn, this.id, rootStore, virt);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            @JsonKey(name: 'combined_disk1-img_sha256')
                String? combinedDisk1ImgSha256,
            @JsonKey(name: 'combined_disk-kvm-img_sha256')
                String? combinedDiskKvmImgSha256,
            @JsonKey(name: 'combined_uefi1-img_sha256')
                String? combinedUefi1ImgSha256,
            String? combinedRootxzSha256,
            String? combinedSha256,
            String? combinedSquashfsSha256,
            String ftype,
            String? deltaBase,
            String? md5,
            String path,
            String? sha256,
            int size)?
        download,
    TResult? Function(
            String? crsn, String? id, String? rootStore, String? virt)?
        id,
  }) {
    return id?.call(crsn, this.id, rootStore, virt);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            @JsonKey(name: 'combined_disk1-img_sha256')
                String? combinedDisk1ImgSha256,
            @JsonKey(name: 'combined_disk-kvm-img_sha256')
                String? combinedDiskKvmImgSha256,
            @JsonKey(name: 'combined_uefi1-img_sha256')
                String? combinedUefi1ImgSha256,
            String? combinedRootxzSha256,
            String? combinedSha256,
            String? combinedSquashfsSha256,
            String ftype,
            String? deltaBase,
            String? md5,
            String path,
            String? sha256,
            int size)?
        download,
    TResult Function(String? crsn, String? id, String? rootStore, String? virt)?
        id,
    required TResult orElse(),
  }) {
    if (id != null) {
      return id(crsn, this.id, rootStore, virt);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SimpleDownload value) download,
    required TResult Function(SimpleId value) id,
  }) {
    return id(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SimpleDownload value)? download,
    TResult? Function(SimpleId value)? id,
  }) {
    return id?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SimpleDownload value)? download,
    TResult Function(SimpleId value)? id,
    required TResult orElse(),
  }) {
    if (id != null) {
      return id(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$SimpleIdToJson(
      this,
    );
  }
}

abstract class SimpleId implements SimpleItem {
  const factory SimpleId(
      {required final String? crsn,
      required final String? id,
      required final String? rootStore,
      required final String? virt}) = _$SimpleId;

  factory SimpleId.fromJson(Map<String, dynamic> json) = _$SimpleId.fromJson;

  String? get crsn;
  String? get id;
  String? get rootStore;
  String? get virt;
  @JsonKey(ignore: true)
  _$$SimpleIdCopyWith<_$SimpleId> get copyWith =>
      throw _privateConstructorUsedError;
}
