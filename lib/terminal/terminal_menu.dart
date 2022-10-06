import 'package:context_menu/context_menu.dart';
import 'package:flutter/material.dart';

List<PopupMenuEntry> buildTerminalMenu({
  required BuildContext context,
  required VoidCallback? onAddTab,
  required VoidCallback? onCloseTab,
  required VoidCallback? onSplitTab,
  required VoidCallback? onCloseSplit,
  VoidCallback? onCopy,
  VoidCallback? onPaste,
  VoidCallback? onSelectAll,
}) {
  return <PopupMenuEntry>[
    ContextMenuItem(
      onTap: onAddTab,
      enabled: onAddTab != null,
      child: const Text('New Tab'),
    ),
    ContextMenuItem(
      onTap: onCloseTab,
      enabled: onCloseTab != null,
      child: const Text('Close Tab'),
    ),
    const PopupMenuDivider(),
    ContextMenuItem(
      onTap: onSplitTab,
      enabled: onSplitTab != null,
      child: const Text('Split Tab'),
    ),
    ContextMenuItem(
      onTap: onCloseSplit,
      enabled: onCloseSplit != null,
      child: const Text('Close Split'),
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
