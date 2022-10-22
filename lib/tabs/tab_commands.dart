import 'package:command_store/command_store.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'tab_intents.dart';
import 'tab_model.dart';

class TabCommands extends StatelessWidget {
  const TabCommands({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final length = context.select<TabModel, int>((m) => m.length);
    return CommandScope(
      commands: [
        const Command(
          id: 'tab-new',
          intent: AddTabIntent(),
        ),
        if (length > 1) ...[
          const Command(
            id: 'tab-close',
            intent: CloseTabIntent(),
          ),
          const Command(
            id: 'tab-next',
            intent: NextTabIntent(),
          ),
          const Command(
            id: 'tab-previous',
            intent: PreviousTabIntent(),
          ),
        ],
      ],
      child: child,
    );
  }
}
