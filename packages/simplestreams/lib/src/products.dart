// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

import 'convert.dart';

part 'products.freezed.dart';
part 'products.g.dart';

@freezed
class SimpleProducts with _$SimpleProducts {
  const factory SimpleProducts({
    String? contentId,
    String? datatype,
    String? format,
    String? license,
    required Map<String, SimpleProduct> products,
    @DateTimeConverter() DateTime? updated,
  }) = _SimpleProducts;

  factory SimpleProducts.fromJson(Map<String, dynamic> json) =>
      _$SimpleProductsFromJson(json);
}

@freezed
class SimpleProduct with _$SimpleProduct {
  const factory SimpleProduct({
    @AliasConverter() List<String>? aliases,
    required String arch,
    String? os,
    String? release,
    String? releaseCodename,
    String? releaseTitle,
    @Default(true) bool supported,
    @DateTimeConverter() DateTime? supportEol,
    String? variant,
    String? version,
    required Map<String, SimpleVersion> versions,
  }) = _SimpleProduct;

  factory SimpleProduct.fromJson(Map<String, dynamic> json) =>
      _$SimpleProductFromJson(json);
}

@freezed
class SimpleVersion with _$SimpleVersion {
  const factory SimpleVersion({
    @Default({}) @SimpleItemConverter() Map<String, SimpleItem> items,
    String? label,
    String? pubname,
  }) = _SimpleVersion;

  factory SimpleVersion.fromJson(Map<String, dynamic> json) =>
      _$SimpleVersionFromJson(json);
}

@freezed
class SimpleItem with _$SimpleItem {
  const factory SimpleItem.download({
    @JsonKey(name: 'combined_disk1-img_sha256') String? combinedDisk1ImgSha256,
    @JsonKey(name: 'combined_disk-kvm-img_sha256')
        String? combinedDiskKvmImgSha256,
    @JsonKey(name: 'combined_uefi1-img_sha256') String? combinedUefi1ImgSha256,
    String? combinedRootxzSha256,
    String? combinedSha256,
    String? combinedSquashfsSha256,
    required String ftype,
    String? deltaBase,
    String? md5,
    required String path,
    String? sha256,
    required int size,
  }) = SimpleDownload;

  const factory SimpleItem.id({
    required String? crsn,
    required String? id,
    required String? rootStore,
    required String? virt,
  }) = SimpleId;

  factory SimpleItem.fromJson(Map<String, dynamic> json) =>
      _$SimpleItemFromJson(json);
}
