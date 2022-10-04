import 'package:context_menu/context_menu.dart';
import 'package:flutter/material.dart';
import 'package:terminal_view/terminal_view.dart';

List<PopupMenuEntry> buildContextMenu({
  required BuildContext context,
  required TerminalMixin? terminal,
  required int tabCount,
  required VoidCallback? onAddTab,
  required VoidCallback? onCloseTab,
}) {
  return <PopupMenuEntry>[
    ContextMenuItem(
      onTap: onAddTab,
      child: const Text('New Tab'),
    ),
    ContextMenuItem(
      onTap: onCloseTab,
      enabled: tabCount > 1,
      child: const Text('Close Tab'),
    ),
    const PopupMenuDivider(),
    ContextMenuItem(
      onTap: terminal?.copy,
      enabled: terminal?.selectedText?.isNotEmpty == true,
      child: const Text('Copy'),
    ),
    ContextMenuItem(
      onTap: terminal?.paste,
      enabled: terminal != null,
      child: const Text('Paste'),
    ),
    ContextMenuItem(
      onTap: terminal?.selectAll,
      enabled: terminal != null,
      child: const Text('Select All'),
    ),
  ];
}
