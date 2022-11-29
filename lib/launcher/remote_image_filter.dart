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
  Set<LxdImageType>? _availableTypes;

  List<LxdImage> get availableImages => _availableImages ?? [];
  Set<String> get availableReleases => _availableReleases ?? {};
  Set<String> get availableVariants => _availableVariants ?? {};
  Set<LxdImageType> get availableTypes => _availableTypes ?? {};

  String? _selectedRelease;
  String? _selectedVariant;
  LxdImageType? _selectedType;

  LxdImage? get selectedImage => _availableImages?.firstOrNull;
  String? get selectedRelease =>
      _selectedRelease ?? _availableReleases?.firstOrNull;
  String? get selectedVariant =>
      _selectedVariant ?? _defaultVariant ?? _availableVariants?.firstOrNull;
  String? get _defaultVariant =>
      _availableVariants?.contains('default') == true ? 'default' : null;
  LxdImageType? get _defaultType =>
      _availableTypes?.contains(LxdImageType.container) == true
          ? LxdImageType.container
          : null;
  LxdImageType? get selectedType =>
      _selectedType ?? _defaultType ?? _availableTypes?.firstOrNull;

  void init(List<LxdImage> images) {
    _allImages = images;
    _allReleases =
        _allImages.map((i) => i.release).whereType<String>().toSet().toList();
    _allVariants =
        _allImages.map((i) => i.variant).whereType<String>().toSet().toList();
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

  void selectType(LxdImageType? type) {
    if (_selectedType == type) return;
    _selectedType = type;
    select(type: type);
  }

  void select({String? release, String? variant, LxdImageType? type}) {
    final availableImages = _allImages
        .where((image) =>
            (_selectedRelease == null || image.release == _selectedRelease) &&
            (_selectedVariant == null || image.variant == _selectedVariant) &&
            (_selectedType == null || image.type == _selectedType))
        .toList();
    availableImages.sort((a, b) => a.compareTo(b));
    if (_availableImages == availableImages) return;
    _availableImages = availableImages;

    _availableReleases = _allImages
        .where((image) =>
            image.release != null &&
            (_selectedVariant == null || image.variant == _selectedVariant) &&
            (_selectedType == null || image.type == _selectedType))
        .map((image) => image.release!)
        .toSet();

    _availableVariants = _allImages
        .where((image) =>
            image.variant != null &&
            (_selectedRelease == null || image.release == _selectedRelease) &&
            (_selectedType == null || image.type == _selectedType))
        .map((image) => image.variant!)
        .toSet();

    _availableTypes = _allImages
        .where((image) =>
            (_selectedRelease == null || image.release == _selectedRelease) &&
            (_selectedVariant == null || image.variant == _selectedVariant))
        .map((image) => image.type)
        .toSet();

    if (_selectedRelease != null &&
        !_availableReleases!.contains(_selectedRelease)) {
      if (variant != null || type != null) {
        _selectedRelease = null;
      }
    }

    if (_selectedVariant != null &&
        !_availableVariants!.contains(_selectedVariant)) {
      if (release != null || type != null) {
        _selectedVariant = null;
      }
    }

    if (_selectedType != null && !_availableTypes!.contains(_selectedType)) {
      if (release != null || variant != null) {
        _selectedType = null;
      }
    }

    if (release != null || variant != null || type != null) {
      notifyListeners();
    }
  }
}

extension _LxdImageX on LxdImage {
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
