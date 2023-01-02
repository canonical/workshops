import 'package:command_store/command_store.dart';
import 'package:flutter/material.dart';
import 'package:lxd_service/lxd_service.dart';
import 'package:provider/provider.dart';
import 'package:ubuntu_service/ubuntu_service.dart';

import 'command_palette/command_palette_page.dart';
import 'home/instance_store.dart';
import 'tabs/tab_page.dart';

class Workshops extends StatelessWidget {
  const Workshops({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => InstanceStore(getService<LxdService>())..init(),
      builder: (context, child) => CommandStore(
        shortcuts: context.watch<ShortcutStore>(),
        child: const CommandPalettePage(child: TabPage()),
      ),
    );
  }
}
