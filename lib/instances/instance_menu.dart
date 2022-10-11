import 'package:context_menu/context_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

List<PopupMenuEntry> buildInstanceMenu({
  required BuildContext context,
  required VoidCallback? onAddTab,
  required VoidCallback? onCloseTab,
}) {
  final l10n = AppLocalizations.of(context);
  return <PopupMenuEntry>[
    ContextMenuItem(
      onTap: onAddTab,
      enabled: onAddTab != null,
      child: Text(l10n.newTabMenuItem),
    ),
    ContextMenuItem(
      onTap: onCloseTab,
      enabled: onCloseTab != null,
      child: Text(l10n.closeTabMenuItem),
    ),
  ];
}
