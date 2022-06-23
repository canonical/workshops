import 'package:flutter/material.dart';
import 'package:lxd/lxd.dart';
import 'package:provider/provider.dart';
import 'package:ubuntu_widgets/ubuntu_widgets.dart';
import 'package:wizard_router/wizard_router.dart';

import '../widgets/wizard_page.dart';
import 'disk_config_dialog.dart';
import 'disk_config_model.dart';

class DiskConfigPage extends StatefulWidget {
  const DiskConfigPage({super.key});

  static Widget create(BuildContext context) {
    final image = Wizard.of(context).arguments as LxdImage;
    return ChangeNotifierProvider(
      create: (_) => DiskConfigModel(image),
      child: const DiskConfigPage(),
    );
  }

  @override
  State<DiskConfigPage> createState() => _DiskConfigPageState();
}

class _DiskConfigPageState extends State<DiskConfigPage> {
  @override
  void initState() {
    super.initState();
    final model = context.read<DiskConfigModel>();
    model.load();
  }

  @override
  Widget build(BuildContext context) {
    final model = context.watch<DiskConfigModel>();
    return WizardPage(
      title: const Text('Configure disks'),
      content: RoundedListView.builder(
        itemCount: model.disks.length,
        itemBuilder: (context, index) {
          final name = model.disks[index];
          final disk = model.getDisk(name);
          return ListTile(
            title: Text(name),
            subtitle: disk.path != disk.source
                ? Text('${disk.path} (${disk.source})')
                : Text(disk.path),
            trailing: IconButton(
              iconSize: 16,
              splashRadius: 16,
              padding: EdgeInsets.zero,
              icon: const Icon(Icons.close),
              onPressed: () => model.removeDisk(name),
            ),
            onTap: () => showDiskConfigDialog(context, name, disk),
          );
        },
      ),
      actions: [
        OutlinedButton(
          onPressed: () => showDiskConfigDialog(context),
          child: const Text('Add'),
        ),
        const Spacer(),
        OutlinedButton(
          onPressed: Wizard.of(context).done,
          child: const Text('Cancel'),
        ),
        OutlinedButton(
          onPressed: () => Wizard.of(context).next(arguments: model.save()),
          child: const Text('Continue'),
        ),
      ],
    );
  }
}
