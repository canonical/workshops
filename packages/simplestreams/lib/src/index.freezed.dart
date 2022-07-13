// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'index.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SimpleStream _$SimpleStreamFromJson(Map<String, dynamic> json) {
  return _SimpleStream.fromJson(json);
}

/// @nodoc
mixin _$SimpleStream {
  String get format => throw _privateConstructorUsedError;
  Map<String, SimpleStreamIndex> get index =>
      throw _privateConstructorUsedError;
  @DateTimeConverter()
  DateTime? get updated => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SimpleStreamCopyWith<SimpleStream> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SimpleStreamCopyWith<$Res> {
  factory $SimpleStreamCopyWith(
          SimpleStream value, $Res Function(SimpleStream) then) =
      _$SimpleStreamCopyWithImpl<$Res>;
  $Res call(
      {String format,
      Map<String, SimpleStreamIndex> index,
      @DateTimeConverter() DateTime? updated});
}

/// @nodoc
class _$SimpleStreamCopyWithImpl<$Res> implements $SimpleStreamCopyWith<$Res> {
  _$SimpleStreamCopyWithImpl(this._value, this._then);

  final SimpleStream _value;
  // ignore: unused_field
  final $Res Function(SimpleStream) _then;

  @override
  $Res call({
    Object? format = freezed,
    Object? index = freezed,
    Object? updated = freezed,
  }) {
    return _then(_value.copyWith(
      format: format == freezed
          ? _value.format
          : format // ignore: cast_nullable_to_non_nullable
              as String,
      index: index == freezed
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as Map<String, SimpleStreamIndex>,
      updated: updated == freezed
          ? _value.updated
          : updated // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
abstract class _$$_SimpleStreamCopyWith<$Res>
    implements $SimpleStreamCopyWith<$Res> {
  factory _$$_SimpleStreamCopyWith(
          _$_SimpleStream value, $Res Function(_$_SimpleStream) then) =
      __$$_SimpleStreamCopyWithImpl<$Res>;
  @override
  $Res call(
      {String format,
      Map<String, SimpleStreamIndex> index,
      @DateTimeConverter() DateTime? updated});
}

/// @nodoc
class __$$_SimpleStreamCopyWithImpl<$Res>
    extends _$SimpleStreamCopyWithImpl<$Res>
    implements _$$_SimpleStreamCopyWith<$Res> {
  __$$_SimpleStreamCopyWithImpl(
      _$_SimpleStream _value, $Res Function(_$_SimpleStream) _then)
      : super(_value, (v) => _then(v as _$_SimpleStream));

  @override
  _$_SimpleStream get _value => super._value as _$_SimpleStream;

  @override
  $Res call({
    Object? format = freezed,
    Object? index = freezed,
    Object? updated = freezed,
  }) {
    return _then(_$_SimpleStream(
      format: format == freezed
          ? _value.format
          : format // ignore: cast_nullable_to_non_nullable
              as String,
      index: index == freezed
          ? _value._index
          : index // ignore: cast_nullable_to_non_nullable
              as Map<String, SimpleStreamIndex>,
      updated: updated == freezed
          ? _value.updated
          : updated // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SimpleStream implements _SimpleStream {
  const _$_SimpleStream(
      {required this.format,
      required final Map<String, SimpleStreamIndex> index,
      @DateTimeConverter() this.updated})
      : _index = index;

  factory _$_SimpleStream.fromJson(Map<String, dynamic> json) =>
      _$$_SimpleStreamFromJson(json);

  @override
  final String format;
  final Map<String, SimpleStreamIndex> _index;
  @override
  Map<String, SimpleStreamIndex> get index {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_index);
  }

  @override
  @DateTimeConverter()
  final DateTime? updated;

  @override
  String toString() {
    return 'SimpleStream(format: $format, index: $index, updated: $updated)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SimpleStream &&
            const DeepCollectionEquality().equals(other.format, format) &&
            const DeepCollectionEquality().equals(other._index, _index) &&
            const DeepCollectionEquality().equals(other.updated, updated));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(format),
      const DeepCollectionEquality().hash(_index),
      const DeepCollectionEquality().hash(updated));

  @JsonKey(ignore: true)
  @override
  _$$_SimpleStreamCopyWith<_$_SimpleStream> get copyWith =>
      __$$_SimpleStreamCopyWithImpl<_$_SimpleStream>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SimpleStreamToJson(this);
  }
}

abstract class _SimpleStream implements SimpleStream {
  const factory _SimpleStream(
      {required final String format,
      required final Map<String, SimpleStreamIndex> index,
      @DateTimeConverter() final DateTime? updated}) = _$_SimpleStream;

  factory _SimpleStream.fromJson(Map<String, dynamic> json) =
      _$_SimpleStream.fromJson;

  @override
  String get format;
  @override
  Map<String, SimpleStreamIndex> get index;
  @override
  @DateTimeConverter()
  DateTime? get updated;
  @override
  @JsonKey(ignore: true)
  _$$_SimpleStreamCopyWith<_$_SimpleStream> get copyWith =>
      throw _privateConstructorUsedError;
}

SimpleStreamIndex _$SimpleStreamIndexFromJson(Map<String, dynamic> json) {
  return _SimpleStreamIndex.fromJson(json);
}

/// @nodoc
mixin _$SimpleStreamIndex {
  String get datatype => throw _privateConstructorUsedError;
  String? get format => throw _privateConstructorUsedError;
  String get path => throw _privateConstructorUsedError;
  List<String> get products => throw _privateConstructorUsedError;
  @DateTimeConverter()
  DateTime? get updated => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SimpleStreamIndexCopyWith<SimpleStreamIndex> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SimpleStreamIndexCopyWith<$Res> {
  factory $SimpleStreamIndexCopyWith(
          SimpleStreamIndex value, $Res Function(SimpleStreamIndex) then) =
      _$SimpleStreamIndexCopyWithImpl<$Res>;
  $Res call(
      {String datatype,
      String? format,
      String path,
      List<String> products,
      @DateTimeConverter() DateTime? updated});
}

/// @nodoc
class _$SimpleStreamIndexCopyWithImpl<$Res>
    implements $SimpleStreamIndexCopyWith<$Res> {
  _$SimpleStreamIndexCopyWithImpl(this._value, this._then);

  final SimpleStreamIndex _value;
  // ignore: unused_field
  final $Res Function(SimpleStreamIndex) _then;

  @override
  $Res call({
    Object? datatype = freezed,
    Object? format = freezed,
    Object? path = freezed,
    Object? products = freezed,
    Object? updated = freezed,
  }) {
    return _then(_value.copyWith(
      datatype: datatype == freezed
          ? _value.datatype
          : datatype // ignore: cast_nullable_to_non_nullable
              as String,
      format: format == freezed
          ? _value.format
          : format // ignore: cast_nullable_to_non_nullable
              as String?,
      path: path == freezed
          ? _value.path
          : path // ignore: cast_nullable_to_non_nullable
              as String,
      products: products == freezed
          ? _value.products
          : products // ignore: cast_nullable_to_non_nullable
              as List<String>,
      updated: updated == freezed
          ? _value.updated
          : updated // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
abstract class _$$_SimpleStreamIndexCopyWith<$Res>
    implements $SimpleStreamIndexCopyWith<$Res> {
  factory _$$_SimpleStreamIndexCopyWith(_$_SimpleStreamIndex value,
          $Res Function(_$_SimpleStreamIndex) then) =
      __$$_SimpleStreamIndexCopyWithImpl<$Res>;
  @override
  $Res call(
      {String datatype,
      String? format,
      String path,
      List<String> products,
      @DateTimeConverter() DateTime? updated});
}

/// @nodoc
class __$$_SimpleStreamIndexCopyWithImpl<$Res>
    extends _$SimpleStreamIndexCopyWithImpl<$Res>
    implements _$$_SimpleStreamIndexCopyWith<$Res> {
  __$$_SimpleStreamIndexCopyWithImpl(
      _$_SimpleStreamIndex _value, $Res Function(_$_SimpleStreamIndex) _then)
      : super(_value, (v) => _then(v as _$_SimpleStreamIndex));

  @override
  _$_SimpleStreamIndex get _value => super._value as _$_SimpleStreamIndex;

  @override
  $Res call({
    Object? datatype = freezed,
    Object? format = freezed,
    Object? path = freezed,
    Object? products = freezed,
    Object? updated = freezed,
  }) {
    return _then(_$_SimpleStreamIndex(
      datatype: datatype == freezed
          ? _value.datatype
          : datatype // ignore: cast_nullable_to_non_nullable
              as String,
      format: format == freezed
          ? _value.format
          : format // ignore: cast_nullable_to_non_nullable
              as String?,
      path: path == freezed
          ? _value.path
          : path // ignore: cast_nullable_to_non_nullable
              as String,
      products: products == freezed
          ? _value._products
          : products // ignore: cast_nullable_to_non_nullable
              as List<String>,
      updated: updated == freezed
          ? _value.updated
          : updated // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SimpleStreamIndex implements _SimpleStreamIndex {
  const _$_SimpleStreamIndex(
      {required this.datatype,
      this.format,
      required this.path,
      required final List<String> products,
      @DateTimeConverter() this.updated})
      : _products = products;

  factory _$_SimpleStreamIndex.fromJson(Map<String, dynamic> json) =>
      _$$_SimpleStreamIndexFromJson(json);

  @override
  final String datatype;
  @override
  final String? format;
  @override
  final String path;
  final List<String> _products;
  @override
  List<String> get products {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_products);
  }

  @override
  @DateTimeConverter()
  final DateTime? updated;

  @override
  String toString() {
    return 'SimpleStreamIndex(datatype: $datatype, format: $format, path: $path, products: $products, updated: $updated)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SimpleStreamIndex &&
            const DeepCollectionEquality().equals(other.datatype, datatype) &&
            const DeepCollectionEquality().equals(other.format, format) &&
            const DeepCollectionEquality().equals(other.path, path) &&
            const DeepCollectionEquality().equals(other._products, _products) &&
            const DeepCollectionEquality().equals(other.updated, updated));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(datatype),
      const DeepCollectionEquality().hash(format),
      const DeepCollectionEquality().hash(path),
      const DeepCollectionEquality().hash(_products),
      const DeepCollectionEquality().hash(updated));

  @JsonKey(ignore: true)
  @override
  _$$_SimpleStreamIndexCopyWith<_$_SimpleStreamIndex> get copyWith =>
      __$$_SimpleStreamIndexCopyWithImpl<_$_SimpleStreamIndex>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SimpleStreamIndexToJson(this);
  }
}

abstract class _SimpleStreamIndex implements SimpleStreamIndex {
  const factory _SimpleStreamIndex(
      {required final String datatype,
      final String? format,
      required final String path,
      required final List<String> products,
      @DateTimeConverter() final DateTime? updated}) = _$_SimpleStreamIndex;

  factory _SimpleStreamIndex.fromJson(Map<String, dynamic> json) =
      _$_SimpleStreamIndex.fromJson;

  @override
  String get datatype;
  @override
  String? get format;
  @override
  String get path;
  @override
  List<String> get products;
  @override
  @DateTimeConverter()
  DateTime? get updated;
  @override
  @JsonKey(ignore: true)
  _$$_SimpleStreamIndexCopyWith<_$_SimpleStreamIndex> get copyWith =>
      throw _privateConstructorUsedError;
}
