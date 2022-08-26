import 'package:async_value/async_value.dart';
import 'package:data_size/data_size.dart';
import 'package:flutter/material.dart';
import 'package:lxd/lxd.dart';
import 'package:lxd_x/lxd_x.dart';
import 'package:provider/provider.dart';
import 'package:ubuntu_widgets/ubuntu_widgets.dart';
import 'package:wizard_router/wizard_router.dart';

import '../remotes/remote_selector.dart';
import '../widgets/product_logo.dart';
import '../widgets/wizard_page.dart';
import 'local_image_model.dart';

class LocalImagePage extends StatelessWidget {
  const LocalImagePage({super.key});

  static Widget create(BuildContext context) => const LocalImagePage();

  @override
  Widget build(BuildContext context) {
    return WizardPage(
      title: const Text('Select image'),
      content: LocalImageView(
        onSelected: (image) => Wizard.of(context).next(arguments: image),
      ),
      actions: [
        const IntrinsicWidth(
          child: RemoteSelector(),
        ),
        const Spacer(),
        OutlinedButton(
          onPressed: Wizard.of(context).done,
          child: const Text('Cancel'),
        ),
      ],
    );
  }
}

class LocalImageView extends StatelessWidget {
  const LocalImageView({
    super.key,
    this.onSelected,
  });

  final ValueChanged<LxdImage?>? onSelected;

  @override
  Widget build(BuildContext context) {
    final model = context.watch<LocalImageModel>();
    return RoundedContainer(
      child: model.images?.when(
        data: (images) => _LocalImageView(
          images: images,
          onSelected: onSelected,
        ),
        error: (error, stackTrace) => ErrorWidget(error),
        loading: () => const Center(child: CircularProgressIndicator()),
      ),
    );
  }
}

class _LocalImageView extends StatelessWidget {
  const _LocalImageView({
    required this.images,
    this.onSelected,
  });

  final List<LxdImage> images;
  final ValueChanged<LxdImage>? onSelected;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: images.length,
      itemBuilder: (context, index) {
        final image = images[index];
        return ListTile(
          title: Text(image.description ?? ''),
          // TODO: present more information about the image
          // subtitle: SelectableText('${image.toJson()}'),
          leading: ProductLogo.asset(
            name: image.os,
            size: 48,
          ),
          trailing: Text(image.size.formatByteSize()),
          onTap: () => onSelected?.call(images[index]),
        );
      },
    );
  }
}
