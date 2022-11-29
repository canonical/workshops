// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'storage_pool.freezed.dart';
part 'storage_pool.g.dart';

@freezed
class LxdStoragePool with _$LxdStoragePool {
  const factory LxdStoragePool({
    required Map<String, String> config,
    required String description,
    required String name,
    required String status,
  }) = _LxdStoragePool;

  factory LxdStoragePool.fromJson(Map<String, dynamic> json) =>
      _$LxdStoragePoolFromJson(json);
}
