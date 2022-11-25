import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

import 'convert.dart';

part 'index.g.dart';

/// Represents the base structure of index.json
@immutable
@JsonSerializable()
class SimpleStream with EquatableMixin {
  const SimpleStream({
    required this.format,
    required this.index,
    this.updated,
  });

  final String format;
  final Map<String, SimpleStreamIndex> index;
  @DateTimeConverter()
  final DateTime? updated;

  factory SimpleStream.fromJson(Map<String, dynamic> json) =>
      _$SimpleStreamFromJson(json);

  Map<String, dynamic> toJson() => _$SimpleStreamToJson(this);

  @override
  List<Object?> get props => [format, index, updated];

  @override
  bool? get stringify => true;
}

// Represents the index entry inside index.json
@immutable
@JsonSerializable()
class SimpleStreamIndex with EquatableMixin {
  const SimpleStreamIndex({
    required this.datatype,
    this.format,
    required this.path,
    required this.products,
    this.updated,
  });

  final String datatype;
  final String? format;
  final String path;
  final List<String> products;
  @DateTimeConverter()
  final DateTime? updated;

  factory SimpleStreamIndex.fromJson(Map<String, dynamic> json) =>
      _$SimpleStreamIndexFromJson(json);

  Map<String, dynamic> toJson() => _$SimpleStreamIndexToJson(this);

  @override
  List<Object?> get props => [datatype, format, path, products];

  @override
  bool? get stringify => true;
}
