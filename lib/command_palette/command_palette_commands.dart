import 'package:command_store/command_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'command_palette_intents.dart';

class CommandPaletteCommands extends StatelessWidget {
  const CommandPaletteCommands({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return CommandScope(
      commands: [
        Command(
          id: 'commandPalette.open',
          label: l10n.openPaletteCommand,
          intent: CommandPaletteOpenIntent(),
        ),
      ],
      child: child,
    );
  }
}
