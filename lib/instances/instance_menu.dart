import 'package:context_menu/context_menu.dart';
import 'package:flutter/material.dart';

List<PopupMenuEntry> buildInstanceMenu({
  required BuildContext context,
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
      enabled: onCloseTab != null,
      child: const Text('Close Tab'),
    ),
  ];
}
