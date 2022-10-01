import 'dart:async';

import 'package:context_menu/context_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lxd_service/lxd_service.dart';
import 'package:lxd_x/lxd_x.dart';
import 'package:movable_tabs/movable_tabs.dart';
import 'package:provider/provider.dart';
import 'package:ubuntu_service/ubuntu_service.dart';

import '../instances/instance_view.dart';
import '../launcher/launcher_wizard.dart';
import '../terminal/terminal_page.dart';
import '../widgets/product_logo.dart';
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
                      icon: terminal.maybeWhen(
                        none: () => null,
                        orElse: () => ProductLogo.asset(
                          name: terminal.instance?.os,
                          size: 32,
                        ),
                      ),
                      label: terminal.maybeWhen(
                        running: (instance, running) => Text(instance.name),
                        orElse: () => const Text('Home'),
                      ),
                    );
                  },
                  trailing: IconButton(
                    icon: const Icon(Icons.add),
                    splashRadius: 16,
                    iconSize: 16,
                    onPressed: model.addTab,
                  ),
                  onMoved: model.moveTab,
                  preferredHeight: Theme.of(context).appBarTheme.toolbarHeight,
                ),
          body: ContextMenuArea(
            builder: (context, position) => buildContextMenu(
              context: context,
              terminal: model.currentTerminal,
              tabCount: model.tabCount,
              onNewTab: model.addTab,
              onCloseTab: model.closeTab,
            ),
            child: model.currentState.maybeWhen(
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
              orElse: () => Stack(
                children: [
                  Positioned.fill(
                    child: TerminalPage(
                      model: model.currentModel,
                      onContextMenu: (position) {
                        showContextMenu(
                          context: context,
                          position: position,
                          items: buildContextMenu(
                            context: context,
                            terminal: model.currentTerminal,
                            tabCount: model.tabCount,
                            onNewTab: model.addTab,
                            onCloseTab: model.closeTab,
                          ),
                        );
                      },
                    ),
                  ),
                  if (model.tabCount == 1 && model.currentTerminal != null)
                    Positioned.directional(
                      textDirection: Directionality.of(context),
                      top: 4,
                      end: 0,
                      child: Material(
                        color: Colors.transparent,
                        child: IconButton(
                          icon: const Icon(Icons.add),
                          color: Colors.white,
                          splashRadius: 16,
                          iconSize: 16,
                          onPressed: model.addTab,
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
