import 'package:async_value/async_value.dart';
import 'package:flutter/material.dart';
import 'package:lxd/lxd.dart';
import 'package:provider/provider.dart';
import 'package:ubuntu_widgets/ubuntu_widgets.dart';

import 'local_image_model.dart';
import 'local_image_selector.dart';

class LocalImageView extends StatelessWidget {
  const LocalImageView({
    super.key,
    this.selected,
    this.onSelected,
  });

  final LxdImage? selected;
  final ValueChanged<LxdImage?>? onSelected;

  @override
  Widget build(BuildContext context) {
    final model = context.watch<LocalImageModel>();
    return RoundedContainer(
      child: SizedBox.expand(
        child: model.images?.when(
          data: (images) => LocalImageSelector(
            images: images,
            selected: selected,
            onSelected: onSelected,
          ),
          error: (error, stackTrace) => ErrorWidget(error),
          loading: () => const Center(child: CircularProgressIndicator()),
        ),
      ),
    );
  }
}
