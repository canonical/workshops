import 'package:command_store/command_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'preferences_intents.dart';

class PreferencesCommands extends StatelessWidget {
  const PreferencesCommands({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return CommandScope(
      commands: [
        Command(
          id: 'preferences.open',
          label: l10n.openPreferencesCommand,
          intent: const OpenPreferencesIntent(),
        ),
      ],
      child: child,
    );
  }
}
