import 'package:context_menu/context_menu.dart';
import 'package:flutter/material.dart';

List<PopupMenuEntry> buildTerminalMenu({
  required BuildContext context,
  required VoidCallback? onAddTab,
  required VoidCallback? onCloseTab,
  VoidCallback? onCopy,
  VoidCallback? onPaste,
  VoidCallback? onSelectAll,
}) {
  return <PopupMenuEntry>[
    ContextMenuItem(
      onTap: onAddTab,
      child: const Text('New Tab'),
    ),
    ContextMenuItem(
      onTap: onCloseTab,
      enabled: onCloseTab != null,
      child: const Text('Close Tab'),
    ),
    const PopupMenuDivider(),
    ContextMenuItem(
      onTap: onCopy,
      enabled: onCopy != null,
      child: const Text('Copy'),
    ),
    ContextMenuItem(
      onTap: onPaste,
      enabled: onPaste != null,
      child: const Text('Paste'),
    ),
    ContextMenuItem(
      onTap: onSelectAll,
      enabled: onSelectAll != null,
      child: const Text('Select All'),
    ),
  ];
}
