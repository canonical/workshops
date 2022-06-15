import 'package:async_value/async_value.dart';
import 'package:flutter/foundation.dart';
import 'package:lxd/lxd.dart';
import 'package:meta/meta.dart';
import 'package:osarch/osarch.dart';
import 'package:safe_change_notifier/safe_change_notifier.dart';
import 'package:simplestreams/simplestreams.dart';

typedef AsyncLxdImageMap = AsyncValue<Map<String, List<LxdImage>>>;

class SimpleStreamModel extends SafeChangeNotifier {
  SimpleStreamModel();

  SimpleStreamClient? _client;

  SimpleStreamClient? get client => _client;

  AsyncLxdImageMap? _images;

  AsyncLxdImageMap? get images => _images;

  @protected
  set images(AsyncLxdImageMap? images) {
    if (_images == images) return;
    _images = images;
    notifyListeners();
  }

  Future<void> init(SimpleStreamClient? client) async {
    if (client == null) return;
    _client = client;
    images = const AsyncLxdImageMap.loading();
    images = await AsyncLxdImageMap.guard(() async {
      final images = <String, List<LxdImage>>{};
      final stream = await client.getStream();
      for (final index in stream.index.values
          .where((index) => index.datatype == 'image-downloads')) {
        final products = await client.getProducts(index);
        // TODO: merge & isolate
        images.addAll(products.toLxd());
      }
      return images;
    });
  }

  @override
  void dispose() {
    super.dispose();
    _client?.close();
  }
}

// Ported from lxd/shared/simplestreams/products.go

// Converts the products data into a list of LXD images and associated downloadable files
extension LxdProducts on SimpleProducts {
  Map<String, List<LxdImage>> toLxd() {
    final images = <String, List<LxdImage>>{};

    final native = Arch.local();
    for (final product in products.values) {
      // Skip unsupported architectures
      final arch = Arch.byName(product.arch);
      if (arch == null || arch != native) {
        continue;
      }

      for (final v in product.versions.entries) {
        final name = v.key;
        final version = v.value;
        final downloads = version.items.values.whereType<SimpleDownload>();

        // Short of anything better, use the name as date (see format above)
        if (name.length < 8) {
          continue;
        }

        final creationDate = DateTime.tryParse(name.substring(0, 8));
        if (creationDate == null) {
          continue;
        }

        // Image processing function
        bool addImage(SimpleDownload meta, SimpleDownload? root) {
          // Look for deltas (only on squashfs)
          final deltas = <SimpleDownload>[];
          if (root?.ftype == 'squashfs') {
            for (final item in downloads) {
              if (item.ftype == 'squashfs.vcdiff') {
                deltas.add(item);
              }
            }
          }

          // Figure out the fingerprint
          String? fingerprint;
          if (root != null) {
            if (root.ftype == 'root.tar.xz') {
              if (meta.combinedRootxzSha256?.isNotEmpty == true) {
                fingerprint = meta.combinedRootxzSha256;
              } else {
                fingerprint = meta.combinedSha256;
              }
            } else if (root.ftype == 'squashfs') {
              fingerprint = meta.combinedSquashfsSha256;
            } else if (root.ftype == 'disk-kvm.img') {
              fingerprint = meta.combinedDiskKvmImgSha256;
            } else if (root.ftype == 'disk1.img') {
              fingerprint = meta.combinedDisk1ImgSha256;
            } else if (root.ftype == 'uefi1.img') {
              fingerprint = meta.combinedUefi1ImgSha256;
            }
          } else {
            fingerprint = meta.sha256;
          }

          if (fingerprint == null || fingerprint.isEmpty) {
            // No LXD image fingerprint found
            return false;
          }

          // Figure out the size
          final size = meta.size + (root?.size ?? 0);

          // Determine filename
          if (meta.path == '') {
            // Missing path field on metadata entry
            return false;
          }

          final fields = meta.path.split('/');
          final filename = fields.last;

          // Generate the actual image entry
          var description =
              '${product.os} ${product.releaseTitle} ${product.arch}';
          if (version.label?.isNotEmpty == true) {
            description = '$description (${version.label})';
          }
          description = '$description ($name)';

          final image = LxdImage(
            architecture: arch.name,
            public: true,
            size: size,
            createdAt: creationDate,
            uploadedAt: creationDate,
            filename: filename,
            fingerprint: fingerprint,
            properties: {
              if (product.os?.isNotEmpty == true) 'os': product.os!,
              if (product.release?.isNotEmpty == true)
                'release': product.release!,
              if (product.version?.isNotEmpty == true)
                'version': product.version!,
              'architecture': product.arch,
              if (version.label?.isNotEmpty == true) 'label': version.label!,
              'serial': name,
              'description': description,
              // for (final req in product.lxdRequirements.entries)
              //   'requirements.${req.key}': req.value,
              if (product.variant?.isNotEmpty == true)
                'variant': product.variant!,
              'type': root?.ftype ?? 'tar.gz',
            },
            type: root?.ftype == 'disk1.img' ||
                    root?.ftype == 'disk-kvm.img' ||
                    root?.ftype == 'uefi1.img'
                ? LxdImageType.virtualMachine
                : LxdImageType.container,
            aliases: [
              for (final alias in product.aliases ?? <String>[])
                LxdImageAlias(name: alias),
            ],
            expiresAt:
                product.supportEol ?? DateTime.fromMillisecondsSinceEpoch(0),
          );

          final key = product.os ?? '';
          images[key] ??= <LxdImage>[];
          images[key]!.add(image);

          return true;
        }

        // Locate a valid LXD image
        for (final item in downloads) {
          if (item.ftype == 'lxd_combined.tar.gz') {
            if (!addImage(item, null)) {
              continue;
            }
          }

          if (item.ftype == 'lxd.tar.xz') {
            // Locate the root files
            for (final subItem in downloads) {
              const ftypes = {
                'disk1.img',
                'disk-kvm.img',
                'uefi1.img',
                'root.tar.xz',
                'squashfs',
              };
              if (ftypes.contains(subItem.ftype)) {
                if (!addImage(item, subItem)) {
                  continue;
                }
              }
            }
          }
        }
      }
    }

    return images;
  }
}
