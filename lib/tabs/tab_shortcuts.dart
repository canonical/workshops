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

    return CallbackShortcuts(
      bindings: {
        for (final shortcut in shortcuts.getShortcuts('tab-new'))
          shortcut: model.newTab,
        if (length > 1)
          for (final shortcut in shortcuts.getShortcuts('tab-close'))
            shortcut: model.closeTab,
        for (final shortcut in shortcuts.getShortcuts('tab-next'))
          shortcut: model.nextTab,
        for (final shortcut in shortcuts.getShortcuts('tab-previous'))
          shortcut: model.previousTab,
      },
      child: child,
    );
  }
}
