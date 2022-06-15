import 'package:flutter/material.dart';
import 'package:terminal_view/terminal_view.dart';

import '../terminal/terminal_state.dart';

class ContextMenuArea extends StatelessWidget {
  const ContextMenuArea({
    super.key,
    required this.current,
    required this.terminals,
    required this.onNewTab,
    required this.onCloseTab,
    this.child,
  });

  final Terminal? current;
  final List<TerminalState> terminals;
  final VoidCallback onNewTab;
  final VoidCallback onCloseTab;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onSecondaryTapDown: (d) => showContextMenu(
        context: context,
        globalPosition: d.globalPosition,
        current: current,
        terminals: terminals,
        onNewTab: onNewTab,
        onCloseTab: onCloseTab,
      ),
      child: child,
    );
  }
}

Future showContextMenu({
  required BuildContext context,
  required Offset globalPosition,
  required Terminal? current,
  required List<TerminalState> terminals,
  required VoidCallback? onNewTab,
  required VoidCallback? onCloseTab,
}) {
  return showMenu(
    context: context,
    position: RelativeRect.fromSize(
      globalPosition & Size.zero,
      MediaQuery.of(context).size,
    ),
    items: buildContextMenu(
      context: context,
      current: current,
      terminals: terminals,
      onNewTab: onNewTab,
      onCloseTab: onCloseTab,
    ),
  );
}

List<PopupMenuEntry> buildContextMenu({
  required BuildContext context,
  required Terminal? current,
  required List<TerminalState> terminals,
  required VoidCallback? onNewTab,
  required VoidCallback? onCloseTab,
}) {
  return <PopupMenuEntry>[
    PopupMenuItem(
      onTap: onNewTab,
      child: const Text('New Tab'),
    ),
    PopupMenuItem(
      onTap: onCloseTab,
      enabled: terminals.length > 1,
      child: const Text('Close Tab'),
    ),
    const PopupMenuDivider(),
    PopupMenuItem(
      onTap: current?.copy,
      enabled: current?.selectedText?.isNotEmpty == true,
      child: const Text('Copy'),
    ),
    PopupMenuItem(
      onTap: current?.paste,
      enabled: current != null,
      child: const Text('Paste'),
    ),
    PopupMenuItem(
      onTap: current?.selectAll,
      enabled: current != null,
      child: const Text('Select All'),
    ),
  ];
}
