import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lxd_service/lxd_service.dart';
import 'package:movable_tabs/movable_tabs.dart';
import 'package:provider/provider.dart';
import 'package:terminal_view/terminal_view.dart';
import 'package:ubuntu_service/ubuntu_service.dart';

import '../instances/instance_view.dart';
import '../launcher/launcher_wizard.dart';
import '../operations/operation_view.dart';
import '../preferences/preferences_dialog.dart';
import '../terminal/terminal_settings.dart';
import '../widgets/context_menu.dart';
import 'home_menu.dart';
import 'home_model.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static Widget create(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => HomeModel(getService<LxdService>()),
      child: const HomePage(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final model = context.watch<HomeModel>();
    return CallbackShortcuts(
      bindings: {
        const SingleActivator(
          LogicalKeyboardKey.keyT,
          control: true,
          shift: true,
          includeRepeats: false,
        ): model.addTab,
        if (model.tabCount > 1)
          const SingleActivator(
            LogicalKeyboardKey.keyW,
            control: true,
            shift: true,
            includeRepeats: false,
          ): model.closeTab,
        const SingleActivator(
          LogicalKeyboardKey.pageUp,
          control: true,
        ): model.previousTab,
        const SingleActivator(
          LogicalKeyboardKey.pageDown,
          control: true,
        ): model.nextTab,
      },
      child: Focus(
        autofocus: true,
        child: Scaffold(
          appBar: model.tabCount <= 1
              ? null
              : MovableTabBar(
                  count: model.tabCount,
                  builder: (context, index) {
                    final terminal = model.state(index)!;
                    return MovableTabButton(
                      selected: index == model.currentIndex,
                      onPressed: () => model.currentIndex = index,
                      onClosed: () => model.closeTab(index),
                      label: terminal.maybeWhen(
                        running: (running) => AnimatedBuilder(
                          animation: running,
                          builder: (context, child) {
                            return Text(running.title ?? 'Terminal');
                          },
                        ),
                        orElse: () => const Text('Home'),
                      ),
                    );
                  },
                  trailing: PopupMenuButton<VoidCallback>(
                    icon: const Icon(Icons.more_vert),
                    splashRadius: 16,
                    iconSize: 16,
                    onSelected: (callback) => callback(),
                    itemBuilder: (context) => [
                      PopupMenuItem(
                        child: const Text('Preferences'),
                        value: () => showPreferencesDialog(context: context),
                      ),
                    ],
                  ),
                  onMoved: model.moveTab,
                  preferredHeight: Theme.of(context).appBarTheme.toolbarHeight,
                ),
          body: ContextMenuArea(
            builder: (context, position) => buildContextMenu(
              context: context,
              current: model.currentTerminal,
              tabCount: model.tabCount,
              onNewTab: model.addTab,
              onCloseTab: model.closeTab,
            ),
            child: model.currentState.when(
              none: () => Scaffold(
                body: InstanceView(
                  onSelect: model.startInstance,
                  onDelete: model.deleteInstance,
                  onStop: model.stopInstance,
                ),
                floatingActionButton: FloatingActionButton(
                  onPressed: () async {
                    final options = await showLauncherWizard(context);
                    if (options != null) {
                      unawaited(model.createInstance(
                        options.image,
                        remote: options.remote,
                      ));
                    }
                  },
                  child: const Icon(Icons.add),
                ),
              ),
              create: (op) => OperationView.create(context, op.id),
              config: (name) => OperationView.config(context, name),
              start: (op) => OperationView.start(context, op.id),
              restart: (op) => OperationView.restart(context, op.id),
              running: (terminal) => TerminalTheme(
                data: terminalTheme,
                child: TerminalView(terminal: terminal),
              ),
              error: (error) => Text('TODO: $error'),
            ),
          ),
        ),
      ),
    );
  }
}
