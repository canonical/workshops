import 'package:context_menu/context_menu.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:terminal_view/terminal_view.dart';

import '../tabs/tab_model.dart';
import 'terminal_menu.dart';
import 'terminal_model.dart';
import 'terminal_shortcuts.dart';

class TerminalPane extends StatelessWidget {
  const TerminalPane({
    super.key,
    required this.onSplit,
    required this.onUnsplit,
  });

  final VoidCallback onSplit;
  final VoidCallback? onUnsplit;

  @override
  Widget build(BuildContext context) {
    final model = context.watch<TerminalModel>();
    return Stack(
      children: [
        TerminalView(
          terminal: model.terminal,
          controller: model.controller,
          focusNode: model.focusNode,
          onContextMenu: (position) {
            final tabs = context.read<TabModel>();
            showContextMenu(
              context: context,
              position: position,
              items: buildTerminalMenu(
                context: context,
                onAddTab: tabs.newTab,
                onCloseTab: tabs.length > 1 ? tabs.closeTab : null,
                onSplitTab: onSplit,
                onCloseSplit: onUnsplit,
                onCopy: model.canCopy ? model.copy : null,
                onPaste: model.paste,
                onSelectAll: model.selectAll,
              ),
            );
          },
          shortcuts: buildTerminalShortcuts(context),
          actions: {
            MoveFocusIntent: MoveFocusAction(),
            SplitAutoIntent: SplitAutoAction(onSplit),
          },
        ),
        if (model.state == TerminalState.starting)
          const Center(child: CircularProgressIndicator())
      ],
    );
  }
}
