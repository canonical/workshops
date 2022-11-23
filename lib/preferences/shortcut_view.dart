import 'package:accel_key/accel_key.dart';
import 'package:collection/collection.dart';
import 'package:command_store/command_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import 'shortcut_dialog.dart';

class ShortcutView extends StatelessWidget {
  const ShortcutView({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final store = context.watch<ShortcutStore>();
    final ids = store.getKeys().sorted();

    return ListView.builder(
      itemCount: ids.length,
      itemBuilder: (context, index) => ListTile(
        title: Text(ids[index]),
        trailing: AccelKey(
            keys: store
                    .getShortcuts(ids[index])
                    ?.firstOrNull
                    ?.localize(context) ??
                []),
        onTap: () async {
          final shortcut = await showShortcutDialog(
            context: context,
            title: Text(ids[index]),
            label: Text(l10n.pressAndConfirmShortcut),
            shortcut: store.getShortcuts(ids[index])?.firstOrNull,
          );
          if (shortcut != null) {
            await store.setShortcuts(ids[index], [shortcut]);
          }
        },
      ),
    );
  }
}
