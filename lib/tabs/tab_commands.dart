import 'package:command_store/command_store.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'tab_model.dart';

class TabCommands extends StatelessWidget {
  const TabCommands({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final length = context.select<TabModel, int>((m) => m.length);
    final model = context.read<TabModel>();

    return CommandScope(
      commands: [
        Command(
          id: 'tab-new',
          intent: VoidCallbackIntent(model.newTab),
        ),
        if (length > 1)
          Command(
            id: 'tab-close',
            intent: VoidCallbackIntent(model.closeTab),
          ),
        Command(
          id: 'tab-next',
          intent: VoidCallbackIntent(model.nextTab),
        ),
        Command(
          id: 'tab-previous',
          intent: VoidCallbackIntent(model.previousTab),
        ),
      ],
      child: child,
    );
  }
}
