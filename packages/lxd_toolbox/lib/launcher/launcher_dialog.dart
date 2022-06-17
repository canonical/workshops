import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lxd/lxd.dart';
import 'package:provider/provider.dart';

import '../remotes/remote.dart';
import '../remotes/remote_selector.dart';
import '../remotes/remote_store.dart';
import 'launcher_model.dart';
import 'local_image_view.dart';
import 'remote_image_view.dart';

class LaunchOptions {
  const LaunchOptions({
    required this.name,
    required this.image,
    required this.remote,
  });
  final String? name;
  final LxdImage image;
  final Remote? remote;
}

Future<LaunchOptions?> showLauncherDialog(BuildContext context) {
  return showDialog(
    context: context,
    builder: (context) {
      return ChangeNotifierProvider(
        create: (_) => LauncherModel(),
        child: const LauncherDialog(),
      );
    },
  );
}

class LauncherDialog extends StatelessWidget {
  const LauncherDialog({super.key});

  void _accept(BuildContext context) {
    final image = context.read<LauncherModel>().selectedImage!;
    final remote = context.read<RemoteStore>().current!;
    final options = LaunchOptions(
      name: image.properties['name'],
      image: image,
      remote: remote,
    );
    Navigator.of(context).pop(options);
  }

  void _back(BuildContext context) {
    final model = context.read<LauncherModel>();
    model.selectImage(null);
    model.selectOs(null);
  }

  @override
  Widget build(BuildContext context) {
    final model = context.watch<LauncherModel>();
    final remote = context.watch<RemoteStore>().current;
    return AlertDialog(
      title: Row(
        children: [
          Padding(
            padding: const EdgeInsetsDirectional.only(start: 24, top: 24),
            child: IconButton(
              splashRadius: 16,
              icon: const Icon(Icons.arrow_back),
              onPressed: model.selectedOs != null ? () => _back(context) : null,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 24),
              child: Text(remote?.isLocal == true || model.selectedOs != null
                  ? 'Select image'
                  : 'Select OS'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: IconButton(
              splashRadius: 16,
              icon: const Icon(Icons.close),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ),
        ],
      ),
      titlePadding: EdgeInsets.zero,
      content: SizedBox.fromSize(
        size: MediaQuery.of(context).size,
        child: Column(
          children: [
            Expanded(
              child: remote?.isLocal == true
                  ? LocalImageView(
                      selected: model.selectedImage,
                      onSelected: model.selectImage,
                    )
                  : RemoteImageView(
                      selectedOs: model.selectedOs,
                      onOsSelected: model.selectOs,
                      selectedImage: model.selectedImage,
                      onImageSelected: model.selectImage,
                    ),
            ),
            const SizedBox(height: 24),
            Row(
              children: [
                IntrinsicWidth(
                  child: RemoteSelector(
                    enabled: model.selectedOs == null,
                  ),
                ),
                const Spacer(),
                OutlinedButton(
                  onPressed: Navigator.of(context).pop,
                  child: const Text('Cancel'),
                ),
                const SizedBox(width: 8),
                OutlinedButton(
                  onPressed: model.hasSelection ? () => _accept(context) : null,
                  child: const Text('Ok'),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
