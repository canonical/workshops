import 'package:data_size/data_size.dart';
import 'package:flutter/material.dart';
import 'package:lxd/lxd.dart';
import 'package:petname/petname.dart' as petname;
import 'package:provider/provider.dart';

import '../widgets/product_logo.dart';
import 'image_model.dart';

class ImageForm extends StatelessWidget {
  const ImageForm({
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
      create: (_) => ImageModel(images),
      child: _ImageForm(
        os: os,
        selectedImage: initialValue,
        onImageSelected: onChanged,
      ),
    );
  }
}

class _ImageForm extends StatefulWidget {
  const _ImageForm({
    required this.os,
    required this.selectedImage,
    required this.onImageSelected,
  });

  final String os;
  final LxdImage? selectedImage;
  final ValueChanged<LxdImage?>? onImageSelected;

  @override
  State<_ImageForm> createState() => _ImageFormState();
}

class _ImageFormState extends State<_ImageForm> {
  late final TextEditingController _nameController;

  @override
  void initState() {
    super.initState();

    final model = context.read<ImageModel>();
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
    final model = context.read<ImageModel>();
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
    final model = context.watch<ImageModel>();
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
