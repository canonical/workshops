import 'package:async_value/async_value.dart';
import 'package:flutter/material.dart';
import 'package:lxd/lxd.dart';
import 'package:provider/provider.dart';
import 'package:ubuntu_widgets/ubuntu_widgets.dart';

import '../widgets/os_selector.dart';
import 'remote_image_form.dart';
import 'remote_image_model.dart';

class RemoteImageView extends StatelessWidget {
  const RemoteImageView({
    super.key,
    this.selectedOs,
    this.onOsSelected,
    this.selectedImage,
    this.onImageSelected,
  });

  final String? selectedOs;
  final ValueChanged<String>? onOsSelected;
  final LxdImage? selectedImage;
  final ValueChanged<LxdImage?>? onImageSelected;

  @override
  Widget build(BuildContext context) {
    final model = context.watch<RemoteImageModel>();
    return RoundedContainer(
      child: SizedBox.expand(
        child: model.images?.when(
          data: (images) => Navigator(
            pages: [
              MaterialPage(
                child: OsSelector(
                  items: images.keys.toList(),
                  selected: selectedOs,
                  onSelected: onOsSelected,
                ),
              ),
              if (selectedOs != null)
                MaterialPage(
                  child: RemoteImageForm(
                    os: selectedOs!,
                    images: images[selectedOs] ?? [],
                    initialValue: selectedImage,
                    onChanged: onImageSelected,
                  ),
                ),
            ],
            onPopPage: (route, result) => route.didPop(result),
          ),
          error: (error, stackTrace) => ErrorWidget(error),
          loading: () => const Center(child: CircularProgressIndicator()),
        ),
      ),
    );
  }
}
