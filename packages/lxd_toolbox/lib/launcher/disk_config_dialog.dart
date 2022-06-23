import 'dart:io';

import 'package:flutter/material.dart';
import 'package:lxd_service/lxd_service.dart';
import 'package:provider/provider.dart';

import 'disk_config_model.dart';

Future<void> showDiskConfigDialog(
  BuildContext context, [
  String? disk,
  LxdDiskConfig? config,
]) async {
  final model = context.read<DiskConfigModel>();
  final name = TextEditingController(text: disk);
  final source = TextEditingController(text: config?.source);
  final path = TextEditingController(text: config?.path);

  bool isValidName(String? v) {
    return v?.trim().isNotEmpty == true &&
        (disk == v || ((disk == null || disk != v) && !model.hasDisk(v!)));
  }

  bool isValidSource(String? v) {
    return v != null &&
        (FileSystemEntity.isDirectorySync(v) ||
            FileSystemEntity.isFileSync(v) ||
            FileSystemEntity.isLinkSync(v));
  }

  final result = await showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text(disk == null ? 'Add disk' : 'Edit disk'),
        content: SizedBox(
          width: MediaQuery.of(context).size.width / 3 * 2,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                controller: name,
                decoration: const InputDecoration(labelText: 'Name'),
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (v) {
                  if (isValidName(v)) {
                    return null;
                  }
                  return v?.isNotEmpty == true
                      ? 'Disk "$v" already exists'
                      : 'A name is required';
                },
              ),
              const SizedBox(height: 24),
              TextFormField(
                controller: source,
                decoration: const InputDecoration(
                  labelText: 'Source',
                  helperText:
                      'Path on the host, either to a file/directory or to a block device',
                ),
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (v) {
                  if (isValidSource(v)) {
                    return null;
                  }
                  return v?.isNotEmpty == true
                      ? 'No such file or directory'
                      : 'A source is required';
                },
              ),
              const SizedBox(height: 24),
              ValueListenableBuilder(
                valueListenable: source,
                builder: (context, value, child) {
                  return TextFormField(
                    controller: path,
                    decoration: InputDecoration(
                      labelText: 'Path',
                      hintText: source.text,
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      helperText:
                          'Path inside the instance where the disk will be mounted',
                    ),
                  );
                },
              ),
            ],
          ),
        ),
        actions: [
          OutlinedButton(
            onPressed: Navigator.of(context).pop,
            child: const Text('Cancel'),
          ),
          AnimatedBuilder(
            animation: Listenable.merge([name, source, path]),
            builder: (context, child) {
              return OutlinedButton(
                onPressed: isValidName(name.text) && isValidSource(source.text)
                    ? () => Navigator.of(context).pop(true)
                    : null,
                child: const Text('Ok'),
              );
            },
          ),
        ],
      );
    },
  );

  if (result == true) {
    final newConfig = LxdDiskConfig(source: source.text, path: path.text);
    if (disk != null && disk != name.text) {
      model.removeDisk(disk);
    }
    model.addDisk(name.text, newConfig);
  }
}
