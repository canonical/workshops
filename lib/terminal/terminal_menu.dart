import 'package:context_menu/context_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../tabs/tab_intents.dart';

List<PopupMenuEntry> buildTerminalMenu({
  required BuildContext context,
  required VoidCallback? onSplitTab,
  required VoidCallback? onCloseSplit,
  VoidCallback? onCopy,
  VoidCallback? onPaste,
  VoidCallback? onSelectAll,
}) {
  final l10n = AppLocalizations.of(context);
  return <PopupMenuEntry>[
    ContextMenuItem(
      onTap: Actions.handler(context, const AddTabIntent()),
      enabled: Actions.find<AddTabIntent>(context).isActionEnabled,
      child: Text(l10n.newTabMenuItem),
    ),
    ContextMenuItem(
      onTap: Actions.handler(context, const CloseTabIntent()),
      enabled: Actions.find<CloseTabIntent>(context).isActionEnabled,
      child: Text(l10n.closeTabMenuItem),
    ),
    const PopupMenuDivider(),
    ContextMenuItem(
      onTap: onSplitTab,
      enabled: onSplitTab != null,
      child: Text(l10n.splitTabMenuItem),
    ),
    ContextMenuItem(
      onTap: onCloseSplit,
      enabled: onCloseSplit != null,
      child: Text(l10n.closeSplitMenuItem),
    ),
    const PopupMenuDivider(),
    ContextMenuItem(
      onTap: onCopy,
      enabled: onCopy != null,
      child: Text(l10n.copyMenuItem),
    ),
    ContextMenuItem(
      onTap: onPaste,
      enabled: onPaste != null,
      child: Text(l10n.pasteMenuItem),
    ),
    ContextMenuItem(
      onTap: onSelectAll,
      enabled: onSelectAll != null,
      child: Text(l10n.selectAllMenuItem),
    ),
  ];
}
