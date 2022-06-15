// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'products.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SimpleProducts _$$_SimpleProductsFromJson(Map<String, dynamic> json) =>
    _$_SimpleProducts(
      contentId: json['content_id'] as String?,
      datatype: json['datatype'] as String?,
      format: json['format'] as String?,
      license: json['license'] as String?,
      products: (json['products'] as Map<String, dynamic>).map(
        (k, e) =>
            MapEntry(k, SimpleProduct.fromJson(e as Map<String, dynamic>)),
      ),
      updated: const DateTimeConverter().fromJson(json['updated'] as String?),
    );

Map<String, dynamic> _$$_SimpleProductsToJson(_$_SimpleProducts instance) =>
    <String, dynamic>{
      'content_id': instance.contentId,
      'datatype': instance.datatype,
      'format': instance.format,
      'license': instance.license,
      'products': instance.products.map((k, e) => MapEntry(k, e.toJson())),
      'updated': const DateTimeConverter().toJson(instance.updated),
    };

_$_SimpleProduct _$$_SimpleProductFromJson(Map<String, dynamic> json) =>
    _$_SimpleProduct(
      aliases: const AliasConverter().fromJson(json['aliases'] as String?),
      arch: json['arch'] as String,
      os: json['os'] as String?,
      release: json['release'] as String?,
      releaseCodename: json['release_codename'] as String?,
      releaseTitle: json['release_title'] as String?,
      supported: json['supported'] as bool? ?? true,
      supportEol:
          const DateTimeConverter().fromJson(json['support_eol'] as String?),
      variant: json['variant'] as String?,
      version: json['version'] as String?,
      versions: (json['versions'] as Map<String, dynamic>).map(
        (k, e) =>
            MapEntry(k, SimpleVersion.fromJson(e as Map<String, dynamic>)),
      ),
    );

Map<String, dynamic> _$$_SimpleProductToJson(_$_SimpleProduct instance) =>
    <String, dynamic>{
      'aliases': const AliasConverter().toJson(instance.aliases),
      'arch': instance.arch,
      'os': instance.os,
      'release': instance.release,
      'release_codename': instance.releaseCodename,
      'release_title': instance.releaseTitle,
      'supported': instance.supported,
      'support_eol': const DateTimeConverter().toJson(instance.supportEol),
      'variant': instance.variant,
      'version': instance.version,
      'versions': instance.versions.map((k, e) => MapEntry(k, e.toJson())),
    };

_$_SimpleVersion _$$_SimpleVersionFromJson(Map<String, dynamic> json) =>
    _$_SimpleVersion(
      items: (json['items'] as Map<String, dynamic>?)?.map(
            (k, e) => MapEntry(
                k,
                const SimpleItemConverter()
                    .fromJson(e as Map<String, dynamic>)),
          ) ??
          const {},
      label: json['label'] as String?,
      pubname: json['pubname'] as String?,
    );

Map<String, dynamic> _$$_SimpleVersionToJson(_$_SimpleVersion instance) =>
    <String, dynamic>{
      'items': instance.items
          .map((k, e) => MapEntry(k, const SimpleItemConverter().toJson(e))),
      'label': instance.label,
      'pubname': instance.pubname,
    };

_$SimpleDownload _$$SimpleDownloadFromJson(Map<String, dynamic> json) =>
    _$SimpleDownload(
      combinedDisk1ImgSha256: json['combined_disk1-img_sha256'] as String?,
      combinedDiskKvmImgSha256: json['combined_disk-kvm-img_sha256'] as String?,
      combinedUefi1ImgSha256: json['combined_uefi1-img_sha256'] as String?,
      combinedRootxzSha256: json['combined_rootxz_sha256'] as String?,
      combinedSha256: json['combined_sha256'] as String?,
      combinedSquashfsSha256: json['combined_squashfs_sha256'] as String?,
      ftype: json['ftype'] as String,
      deltaBase: json['delta_base'] as String?,
      md5: json['md5'] as String?,
      path: json['path'] as String,
      sha256: json['sha256'] as String?,
      size: json['size'] as int,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$SimpleDownloadToJson(_$SimpleDownload instance) =>
    <String, dynamic>{
      'combined_disk1-img_sha256': instance.combinedDisk1ImgSha256,
      'combined_disk-kvm-img_sha256': instance.combinedDiskKvmImgSha256,
      'combined_uefi1-img_sha256': instance.combinedUefi1ImgSha256,
      'combined_rootxz_sha256': instance.combinedRootxzSha256,
      'combined_sha256': instance.combinedSha256,
      'combined_squashfs_sha256': instance.combinedSquashfsSha256,
      'ftype': instance.ftype,
      'delta_base': instance.deltaBase,
      'md5': instance.md5,
      'path': instance.path,
      'sha256': instance.sha256,
      'size': instance.size,
      'runtimeType': instance.$type,
    };

_$SimpleId _$$SimpleIdFromJson(Map<String, dynamic> json) => _$SimpleId(
      crsn: json['crsn'] as String?,
      id: json['id'] as String?,
      rootStore: json['root_store'] as String?,
      virt: json['virt'] as String?,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$SimpleIdToJson(_$SimpleId instance) =>
    <String, dynamic>{
      'crsn': instance.crsn,
      'id': instance.id,
      'root_store': instance.rootStore,
      'virt': instance.virt,
      'runtimeType': instance.$type,
    };
