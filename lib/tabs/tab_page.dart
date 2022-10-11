import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:lxd_x/lxd_x.dart';
import 'package:movable_tabs/movable_tabs.dart';
import 'package:provider/provider.dart';

import '../instances/instance_page.dart';
import '../terminal/terminal_page.dart';
import '../widgets/product_logo.dart';
import 'tab_item.dart';
import 'tab_model.dart';

class TabPage extends StatelessWidget {
  const TabPage({super.key});

  static Widget create(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => TabModel(),
      child: const TabPage(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final model = context.watch<TabModel>();
    return CallbackShortcuts(
      bindings: {
        const SingleActivator(
          LogicalKeyboardKey.keyT,
          control: true,
          shift: true,
          includeRepeats: false,
        ): model.newTab,
        if (model.tabs.length > 1)
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
          appBar: model.tabs.length <= 1
              ? null
              : MovableTabBar(
                  count: model.tabs.length,
                  builder: (context, index) {
                    return ChangeNotifierProvider.value(
                      value: model.tabs[index],
                      builder: (context, child) {
                        final tab = context.watch<TabItem>();
                        return MovableTabButton(
                          selected: index == model.currentIndex,
                          onPressed: () => model.currentIndex = index,
                          onClosed: () => model.removeTab(index),
                          icon: ProductLogo.asset(
                            name: tab.instance?.os,
                            size: 32,
                          ),
                          label: Text(tab.instance?.name ?? l10n.homeTab),
                        );
                      },
                    );
                  },
                  trailing: IconButton(
                    icon: const Icon(Icons.add),
                    splashRadius: 16,
                    iconSize: 16,
                    onPressed: model.newTab,
                  ),
                  onMoved: model.moveTab,
                  preferredHeight: Theme.of(context).appBarTheme.toolbarHeight,
                ),
          body: IndexedStack(
            index: model.currentIndex,
            children: [
              for (final tab in model.tabs)
                ChangeNotifierProvider.value(
                  value: tab,
                  key: ValueKey(tab),
                  builder: (context, child) {
                    final tab = context.watch<TabItem>();
                    return FocusScope(
                      node: tab.focusScope,
                      child: tab.instance == null
                          ? InstancePage(
                              onStart: (instance) => tab.instance = instance,
                              onCreate: (instance) => tab.instance = instance,
                            )
                          : TerminalPage(
                              instance: tab.instance!,
                              onExit: () => tab.instance = null,
                            ),
                    );
                  },
                ),
            ],
          ),
        ),
      ),
    );
  }
}
