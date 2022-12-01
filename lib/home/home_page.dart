import 'package:command_store/command_store.dart';
import 'package:context_menu/context_menu.dart';
import 'package:flutter/material.dart';
import 'package:lxd/lxd.dart';

import '../launcher/launcher_wizard.dart';
import 'home_menu.dart';
import 'instance_actions.dart';
import 'instance_intents.dart';
import 'instance_table_view.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key, required this.onSelected});

  final ValueChanged<LxdInstance> onSelected;

  @override
  Widget build(BuildContext context) {
    return Shortcuts(
      shortcuts: CommandStore.shortcutsOf(context),
      child: Scaffold(
        body: ContextMenuArea(
          builder: (context, position) => buildHomeMenu(context: context),
          child: Actions(
            actions: {
              SelectInstanceIntent: SelectInstanceAction(onSelected),
            },
            child: const InstanceTableView(),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            final instance = await showLauncherWizard(context);
            if (instance != null) {
              onSelected(instance);
            }
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
