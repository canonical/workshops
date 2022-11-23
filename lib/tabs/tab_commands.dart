import 'package:command_store/command_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import 'tab_intents.dart';
import 'tab_model.dart';

class TabCommands extends StatelessWidget {
  const TabCommands({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final length = context.select<TabModel, int>((m) => m.length);
    return CommandScope(
      commands: [
        Command(
          id: 'tab.new',
          priority: 10,
          label: l10n.newTabCommand,
          intent: const AddTabIntent(),
        ),
        if (length > 1) ...[
          Command(
            id: 'tab.close',
            priority: 10,
            label: l10n.closeTabCommand,
            intent: const CloseTabIntent(),
          ),
          Command(
            id: 'tab.next',
            priority: 10,
            label: l10n.nextTabCommand,
            intent: const NextTabIntent(),
          ),
          Command(
            id: 'tab.previous',
            priority: 10,
            label: l10n.previousTabCommand,
            intent: const PreviousTabIntent(),
          ),
        ],
      ],
      child: child,
    );
  }
}
