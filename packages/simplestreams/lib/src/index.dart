import 'package:freezed_annotation/freezed_annotation.dart';

import 'convert.dart';

part 'index.freezed.dart';
part 'index.g.dart';

/// Represents the base structure of index.json
@freezed
class SimpleStream with _$SimpleStream {
  const factory SimpleStream({
    required String format,
    required Map<String, SimpleStreamIndex> index,
    @DateTimeConverter() DateTime? updated,
  }) = _SimpleStream;

  factory SimpleStream.fromJson(Map<String, dynamic> json) =>
      _$SimpleStreamFromJson(json);
}

// Represents the index entry inside index.json
@freezed
class SimpleStreamIndex with _$SimpleStreamIndex {
  const factory SimpleStreamIndex({
    required String datatype,
    String? format,
    required String path,
    required List<String> products,
    @DateTimeConverter() DateTime? updated,
  }) = _SimpleStreamIndex;

  factory SimpleStreamIndex.fromJson(Map<String, dynamic> json) =>
      _$SimpleStreamIndexFromJson(json);
}
