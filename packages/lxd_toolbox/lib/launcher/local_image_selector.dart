import 'package:data_size/data_size.dart';
import 'package:flutter/material.dart';
import 'package:lxd/lxd.dart';

import '../widgets/product_logo.dart';

class LocalImageSelector extends StatelessWidget {
  const LocalImageSelector({
    super.key,
    required this.images,
    this.selected,
    this.onSelected,
  });

  final List<LxdImage> images;
  final LxdImage? selected;
  final ValueChanged<LxdImage>? onSelected;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: images.length,
      itemBuilder: (context, index) {
        final image = images[index];
        return ListTile(
          title: Text('${image.properties['description']}'),
          // TODO: present more information about the image
          // subtitle: SelectableText('${image.toJson()}'),
          leading: ProductLogo.asset(
            name: image.properties['os'],
            size: 48,
          ),
          trailing: Text(image.size.formatByteSize()),
          selected: image == selected,
          onTap: () => onSelected?.call(images[index]),
        );
      },
    );
  }
}
