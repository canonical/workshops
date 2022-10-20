import 'package:command_store/command_store.dart';
import 'package:context_menu/context_menu.dart';
import 'package:flutter/material.dart';
import 'package:lxd/lxd.dart';
import 'package:provider/provider.dart';

import '../launcher/launcher_wizard.dart';
import '../tabs/tab_model.dart';
import 'instance_menu.dart';
import 'instance_view.dart';

class InstancePage extends StatelessWidget {
  const InstancePage({
    super.key,
    required this.onStart,
    required this.onCreate,
  });

  final ValueChanged<LxdInstance> onStart;
  final ValueChanged<LxdInstance> onCreate;

  @override
  Widget build(BuildContext context) {
    final tabs = context.read<TabModel>();
    return Shortcuts(
      shortcuts: CommandStore.shortcutsOf(context),
      child: Scaffold(
        body: ContextMenuArea(
          builder: (context, position) => buildInstanceMenu(
            context: context,
            onAddTab: tabs.newTab,
            onCloseTab: tabs.length > 1 ? tabs.closeTab : null,
          ),
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
              onCreate(instance);
            }
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
