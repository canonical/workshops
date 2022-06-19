import 'package:collection/collection.dart';
import 'package:lxd/lxd.dart';
import 'package:safe_change_notifier/safe_change_notifier.dart';

class RemoteImageFilter extends SafeChangeNotifier {
  var _allImages = <LxdImage>[];
  var _allReleases = <String>[];
  var _allVariants = <String>[];

  List<LxdImage> get allImages => _allImages;
  List<String> get allReleases => _allReleases;
  List<String> get allVariants => _allVariants;

  List<LxdImage>? _availableImages;
  Set<String>? _availableReleases;
  Set<String>? _availableVariants;

  List<LxdImage> get availableImages => _availableImages ?? [];
  Set<String> get availableReleases => _availableReleases ?? {};
  Set<String> get availableVariants => _availableVariants ?? {};

  String? _selectedRelease;
  String? _selectedVariant;

  LxdImage? get selectedImage => _availableImages?.firstOrNull;
  String? get selectedRelease =>
      _selectedRelease ?? _availableReleases?.firstOrNull;
  String? get selectedVariant =>
      _selectedVariant ?? _defaultVariant ?? _availableVariants?.firstOrNull;
  String? get _defaultVariant =>
      _availableVariants?.contains('default') == true ? 'default' : null;

  void init(List<LxdImage> images) {
    _allImages = images;
    _allReleases = _allImages.map((i) => i.release).toSet().toList();
    _allVariants = _allImages.map((i) => i.variant).toSet().toList();
    select();
  }

  void selectRelease(String? release) {
    if (_selectedRelease == release) return;
    _selectedRelease = release;
    select(release: release);
  }

  void selectVariant(String? variant) {
    if (_selectedVariant == variant) return;
    _selectedVariant = variant;
    select(variant: variant);
  }

  void select({String? release, String? variant}) {
    final availableImages = _allImages
        .where((image) =>
            (_selectedRelease == null || image.release == _selectedRelease) &&
            (_selectedVariant == null || image.variant == _selectedVariant))
        .toList();
    availableImages.sort((a, b) => a.compareTo(b));
    if (_availableImages == availableImages) return;
    _availableImages = availableImages;

    _availableReleases = _allImages
        .where((image) =>
            _selectedVariant == null || image.variant == _selectedVariant)
        .map((image) => image.release)
        .toSet();

    if (variant != null &&
        _selectedRelease != null &&
        !_availableReleases!.contains(_selectedRelease)) {
      selectRelease(null);
      return;
    }

    _availableVariants = _allImages
        .where((image) =>
            _selectedRelease == null || image.release == _selectedRelease)
        .map((image) => image.variant)
        .toSet();

    if (release != null &&
        _selectedVariant != null &&
        !_availableVariants!.contains(_selectedVariant)) {
      selectVariant(null);
      return;
    }

    if (release != null || variant != null) {
      notifyListeners();
    }
  }
}

extension _LxdImageX on LxdImage {
  String get release => properties['release'] ?? '';
  String get variant => properties['variant'] ?? '';

  int compareTo(LxdImage other) {
    return _compareProperties(other) ?? _compareType(other);
  }

  int? _compareProperties(LxdImage other) {
    for (final prop in ['release', 'variant', 'serial']) {
      final a = properties[prop] ?? '';
      final b = other.properties[prop] ?? '';
      if (a == b) continue;
      if (a.isEmpty) return -1;
      if (b.isEmpty) return 1;
      return prop == 'serial' ? b.compareTo(a) : a.compareTo(b);
    }
    return null;
  }

  int _compareType(LxdImage other) {
    // Image types in order of preference for LXD hosts.
    const types = [
      'squashfs',
      'root.tar.xz',
      'disk-kvm.img',
      'uefi1.img',
      'disk1.img',
    ];
    final a = properties['type'] ?? '';
    final b = other.properties['type'] ?? '';
    return types.indexOf(a).compareTo(types.indexOf(b));
  }
}
