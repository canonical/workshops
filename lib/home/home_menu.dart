import 'package:context_menu/context_menu.dart';
import 'package:flutter/material.dart';
import 'package:lxd_terminal/lxd_terminal.dart';

List<PopupMenuEntry> buildContextMenu({
  required BuildContext context,
  required LxdTerminal? current,
  required int tabCount,
  required VoidCallback? onNewTab,
  required VoidCallback? onCloseTab,
}) {
  return <PopupMenuEntry>[
    ContextMenuItem(
      onTap: onNewTab,
      child: const Text('New Tab'),
    ),
    ContextMenuItem(
      onTap: onCloseTab,
      enabled: tabCount > 1,
      child: const Text('Close Tab'),
    ),
    const PopupMenuDivider(),
    ContextMenuItem(
      onTap: current?.copy,
      enabled: current?.selectedText?.isNotEmpty == true,
      child: const Text('Copy'),
    ),
    ContextMenuItem(
      onTap: current?.paste,
      enabled: current != null,
      child: const Text('Paste'),
    ),
    ContextMenuItem(
      onTap: current?.selectAll,
      enabled: current != null,
      child: const Text('Select All'),
    ),
  ];
}
