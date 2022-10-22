import 'package:command_store/command_store.dart';
import 'package:context_menu/context_menu.dart';
import 'package:flutter/material.dart';
import 'package:lxd/lxd.dart';

import '../launcher/launcher_wizard.dart';
import 'home_menu.dart';
import 'instance_view.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key, required this.onStart});

  final ValueChanged<LxdInstance> onStart;

  @override
  Widget build(BuildContext context) {
    return Shortcuts(
      shortcuts: CommandStore.shortcutsOf(context),
      child: Scaffold(
        body: ContextMenuArea(
          builder: (context, position) => buildHomeMenu(context: context),
          child: Focus(
            autofocus: true,
            child: InstanceView(
              onStart: onStart,
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            final instance = await showLauncherWizard(context);
            if (instance != null) {
              onStart(instance);
            }
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
