import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../settings/shortcut_settings.dart';
import 'tab_model.dart';

class TabShortcuts extends StatelessWidget {
  const TabShortcuts({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final shortcuts = context.watch<ShortcutSettings>();
    final length = context.select<TabModel, int>((m) => m.length);
    final model = context.read<TabModel>();

    final newTab = shortcuts.getShortcut('tab-new');
    final closeTab = shortcuts.getShortcut('tab-close');
    final previousTab = shortcuts.getShortcut('tab-previous');
    final nextTab = shortcuts.getShortcut('tab-next');

    return CallbackShortcuts(
      bindings: {
        if (newTab != null) newTab: model.newTab,
        if (length > 1 && closeTab != null) closeTab: model.closeTab,
        if (previousTab != null) previousTab: model.previousTab,
        if (nextTab != null) nextTab: model.nextTab,
      },
      child: child,
    );
  }
}
