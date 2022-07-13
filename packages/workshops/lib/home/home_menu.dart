import 'package:flutter/material.dart';
import 'package:terminal_view/terminal_view.dart';

import '../terminal/terminal_state.dart';

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
