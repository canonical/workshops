import 'package:collection/collection.dart';
import 'package:data_size/data_size.dart';
import 'package:flutter/material.dart';
import 'package:lxd/lxd.dart';
import 'package:petname/petname.dart' as petname;
import 'package:provider/provider.dart';
import 'package:safe_change_notifier/safe_change_notifier.dart';

import '../widgets/product_logo.dart';

class RemoteImageForm extends StatelessWidget {
  const RemoteImageForm({
    super.key,
    required this.os,
    required this.images,
    this.initialValue,
    this.onChanged,
  });

  final String os;
  final List<LxdImage> images;
  final LxdImage? initialValue;
  final ValueChanged<LxdImage?>? onChanged;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => RemoteImageFormModel(images),
      child: _RemoteImageForm(
        os: os,
        selectedImage: initialValue,
        onImageSelected: onChanged,
      ),
    );
  }
}

class _RemoteImageForm extends StatefulWidget {
  const _RemoteImageForm({
    required this.os,
    required this.selectedImage,
    required this.onImageSelected,
  });

  final String os;
  final LxdImage? selectedImage;
  final ValueChanged<LxdImage?>? onImageSelected;

  @override
  State<_RemoteImageForm> createState() => _RemoteImageFormState();
}

class _RemoteImageFormState extends State<_RemoteImageForm> {
  late final TextEditingController _nameController;

  @override
  void initState() {
    super.initState();

    final model = context.read<RemoteImageFormModel>();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      model.init();
      if (model.selectedImage != widget.selectedImage) {
        widget.onImageSelected?.call(model.selectedImage);
      }
    });

    final name = widget.selectedImage?.properties['name'];
    _nameController = TextEditingController(
      text: name ?? petname.generate(2, separator: '-'),
    );
  }

  void _notifyImageChange() {
    final model = context.read<RemoteImageFormModel>();
    final image = model.selectedImage?.copyWith(properties: {
      'name': _nameController.text,
      ...?model.selectedImage?.properties,
    });
    widget.onImageSelected?.call(image);
  }

  @override
  void dispose() {
    super.dispose();
    _nameController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final model = context.watch<RemoteImageFormModel>();
    return LayoutBuilder(builder: (context, constraints) {
      final fieldWidth = constraints.maxWidth / 3;
      return Material(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                width: fieldWidth,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _DropdownField(
                      label: 'Release',
                      value: model.selectedRelease,
                      allValues: model.allReleases,
                      availableValues: model.availableReleases,
                      onChanged: (release) {
                        model.selectRelease(release);
                        _notifyImageChange();
                      },
                    ),
                    const SizedBox(height: 24),
                    _DropdownField(
                      label: 'Variant',
                      value: model.selectedVariant,
                      allValues: model.allVariants,
                      availableValues: model.availableVariants,
                      onChanged: (variant) {
                        model.selectVariant(variant);
                        _notifyImageChange();
                      },
                    ),
                    const SizedBox(height: 24),
                    TextFormField(
                      controller: _nameController,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      decoration: const InputDecoration(labelText: 'Name'),
                      validator: (value) {
                        if (value != null && !validateImageName(value)) {
                          return 'Alphanumeric and hyphen characters allowed';
                        }
                        return null;
                      },
                      onChanged: (_) => _notifyImageChange(),
                    ),
                  ],
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ProductLogo.asset(name: widget.os, size: 192),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    textBaseline: TextBaseline.alphabetic,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    children: [
                      Text(
                        widget.os,
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      const SizedBox(width: 16),
                      Text(
                        model.selectedImage?.size.formatByteSize() ?? '',
                        textAlign: TextAlign.end,
                      )
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    });
  }
}

class _DropdownField extends StatelessWidget {
  const _DropdownField({
    required this.label,
    required this.value,
    required this.allValues,
    required this.availableValues,
    required this.onChanged,
  });

  final String label;
  final String? value;
  final List<String> allValues;
  final Set<String> availableValues;
  final ValueChanged<String?> onChanged;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      decoration: InputDecoration(labelText: label),
      value: value,
      items: allValues.map((variant) {
        return DropdownMenuItem<String>(
          value: variant,
          child: Text(
            variant,
            style: TextStyle(
              color: availableValues.contains(variant)
                  ? null
                  : Theme.of(context).disabledColor,
            ),
          ),
        );
      }).toList(),
      onChanged: onChanged,
    );
  }
}

/// The regular expression pattern for valid image names:
/// - must start and end with a letter or digit
/// - may contain letters, digits, and hyphens
final _validName = RegExp(r'^[a-zA-Z0-9]([a-zA-Z0-9-]*[a-zA-Z0-9])*$');

bool validateImageName(String name) {
  return name.isEmpty || _validName.hasMatch(name);
}

class RemoteImageFormModel extends SafeChangeNotifier {
  RemoteImageFormModel(this._allImages)
      : _allReleases = _allImages.map((i) => i.release).toSet().toList(),
        _allVariants = _allImages.map((i) => i.variant).toSet().toList();

  final List<LxdImage> _allImages;
  final List<String> _allReleases;
  final List<String> _allVariants;

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

  void selectRelease(String? release) {
    if (_selectedRelease == release) return;
    _selectedRelease = release;
    init(release: release);
  }

  void selectVariant(String? variant) {
    if (_selectedVariant == variant) return;
    _selectedVariant = variant;
    init(variant: variant);
  }

  void init({String? release, String? variant}) {
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

    notifyListeners();
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
