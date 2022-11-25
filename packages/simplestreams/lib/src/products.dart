import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

import 'convert.dart';

part 'products.g.dart';

@immutable
@JsonSerializable()
class SimpleProducts with EquatableMixin {
  const SimpleProducts({
    this.contentId,
    this.datatype,
    this.format,
    this.license,
    required this.products,
    this.updated,
  });

  final String? contentId;
  final String? datatype;
  final String? format;
  final String? license;
  final Map<String, SimpleProduct> products;
  @DateTimeConverter()
  final DateTime? updated;

  factory SimpleProducts.fromJson(Map<String, dynamic> json) =>
      _$SimpleProductsFromJson(json);

  Map<String, dynamic> toJson() => _$SimpleProductsToJson(this);

  @override
  List<Object?> get props {
    return [
      contentId,
      datatype,
      format,
      license,
      products,
      updated,
    ];
  }

  @override
  bool? get stringify => true;
}

@immutable
@JsonSerializable()
class SimpleProduct with EquatableMixin {
  const SimpleProduct({
    this.aliases,
    required this.arch,
    this.os,
    this.release,
    this.releaseCodename,
    this.releaseTitle,
    this.supported = true,
    this.supportEol,
    this.variant,
    this.version,
    required this.versions,
  });

  @AliasConverter()
  final List<String>? aliases;
  final String arch;
  final String? os;
  final String? release;
  final String? releaseCodename;
  final String? releaseTitle;
  final bool supported;
  @DateTimeConverter()
  final DateTime? supportEol;
  final String? variant;
  final String? version;
  final Map<String, SimpleVersion> versions;

  factory SimpleProduct.fromJson(Map<String, dynamic> json) =>
      _$SimpleProductFromJson(json);

  Map<String, dynamic> toJson() => _$SimpleProductToJson(this);

  @override
  List<Object?> get props {
    return [
      aliases,
      arch,
      os,
      release,
      releaseCodename,
      releaseTitle,
      supported,
      supportEol,
      variant,
      version,
      versions,
    ];
  }

  @override
  bool? get stringify => true;
}

@immutable
@JsonSerializable()
class SimpleVersion with EquatableMixin {
  const SimpleVersion({
    this.items = const {},
    this.label,
    this.pubname,
  });

  @SimpleItemConverter()
  final Map<String, SimpleItem> items;
  final String? label;
  final String? pubname;

  factory SimpleVersion.fromJson(Map<String, dynamic> json) =>
      _$SimpleVersionFromJson(json);

  Map<String, dynamic> toJson() => _$SimpleVersionToJson(this);

  @override
  List<Object?> get props => [items, label, pubname];

  @override
  bool? get stringify => true;
}

abstract class SimpleItem {
  const SimpleItem._();

  Map<String, dynamic> toJson();
}

@immutable
@JsonSerializable()
class SimpleDownload extends SimpleItem with EquatableMixin {
  const SimpleDownload({
    this.combinedDisk1ImgSha256,
    this.combinedDiskKvmImgSha256,
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
  }) : super._();

  @JsonKey(name: 'combined_disk1-img_sha256')
  final String? combinedDisk1ImgSha256;
  @JsonKey(name: 'combined_disk-kvm-img_sha256')
  final String? combinedDiskKvmImgSha256;
  @JsonKey(name: 'combined_uefi1-img_sha256')
  final String? combinedUefi1ImgSha256;
  final String? combinedRootxzSha256;
  final String? combinedSha256;
  final String? combinedSquashfsSha256;
  final String ftype;
  final String? deltaBase;
  final String? md5;
  final String path;
  final String? sha256;
  final int size;

  factory SimpleDownload.fromJson(Map<String, dynamic> json) =>
      _$SimpleDownloadFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$SimpleDownloadToJson(this);

  @override
  List<Object?> get props {
    return [
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
      size,
    ];
  }

  @override
  bool? get stringify => true;
}

@immutable
@JsonSerializable()
class SimpleId extends SimpleItem with EquatableMixin {
  const SimpleId({
    required this.crsn,
    required this.id,
    required this.rootStore,
    required this.virt,
  }) : super._();

  final String? crsn;
  final String? id;
  final String? rootStore;
  final String? virt;

  factory SimpleId.fromJson(Map<String, dynamic> json) =>
      _$SimpleIdFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$SimpleIdToJson(this);

  @override
  List<Object?> get props => [crsn, id, rootStore, virt];

  @override
  bool? get stringify => true;
}
