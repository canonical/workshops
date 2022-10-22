import 'package:context_menu/context_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:lxd/lxd.dart';

import '../tabs/tab_intents.dart';
import 'instance_intents.dart';

List<PopupMenuEntry> buildInstanceMenu({
  required BuildContext context,
  required LxdInstance? instance,
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
      onTap: Actions.handler(context, StartInstanceIntent(instance)),
      enabled: Actions.find<StartInstanceIntent>(context).isActionEnabled,
      child: Text(l10n.startInstanceMenuItem),
    ),
    ContextMenuItem(
      onTap: Actions.handler(context, StopInstanceIntent(instance)),
      enabled: Actions.find<StopInstanceIntent>(context).isActionEnabled,
      child: Text(l10n.stopInstanceMenuItem),
    ),
    ContextMenuItem(
      onTap: Actions.handler(context, DeleteInstanceIntent(instance)),
      enabled: Actions.find<DeleteInstanceIntent>(context).isActionEnabled,
      child: Text(l10n.deleteInstanceMenuItem),
    ),
  ];
}
