import 'package:command_store/command_store.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'terminal_intents.dart';

class TerminalCommands extends StatelessWidget {
  const TerminalCommands({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return CommandScope(
      commands: [
        // edit
        Command(
          id: 'terminal-copy',
          label: l10n.copyCommand,
          intent: TerminalIntents.copy,
        ),
        Command(
          id: 'terminal-paste',
          label: l10n.pasteCommand,
          intent: TerminalIntents.paste,
        ),
        // scroll
        Command(
          id: 'terminal-scroll-up',
          label: l10n.scrollUpCommand,
          intent: TerminalIntents.scrollUp,
        ),
        Command(
          id: 'terminal-scroll-down',
          label: l10n.scrollDownCommand,
          intent: TerminalIntents.scrollDown,
        ),
        Command(
          id: 'terminal-scroll-page-up',
          label: l10n.scrollPageUpCommand,
          intent: TerminalIntents.scrollPageUp,
        ),
        Command(
          id: 'terminal-scroll-page-down',
          label: l10n.scrollPageDownCommand,
          intent: TerminalIntents.scrollPageDown,
        ),
        Command(
          id: 'terminal-scroll-to-top',
          label: l10n.scrollToTopCommand,
          intent: TerminalIntents.scrollToTop,
        ),
        Command(
          id: 'terminal-scroll-to-bottom',
          label: l10n.scrollToBottomCommand,
          intent: TerminalIntents.scrollToBottom,
        ),
        // split
        Command(
          id: 'terminal-split-auto',
          priority: 32,
          label: l10n.splitAutoCommand,
          intent: TerminalIntents.splitAuto,
        ),
        Command(
          id: 'terminal-split-up',
          priority: 30,
          label: l10n.splitUpCommand,
          intent: TerminalIntents.splitUp,
        ),
        Command(
          id: 'terminal-split-down',
          priority: 31,
          label: l10n.splitDownCommand,
          intent: TerminalIntents.splitDown,
        ),
        Command(
          id: 'terminal-split-left',
          priority: 30,
          label: l10n.splitLeftCommand,
          intent: TerminalIntents.splitLeft,
        ),
        Command(
          id: 'terminal-split-right',
          priority: 31,
          label: l10n.splitRightCommand,
          intent: TerminalIntents.splitRight,
        ),
        // focus
        Command(
          id: 'terminal-focus-up',
          priority: 30,
          label: l10n.moveFocusUpCommand,
          intent: TerminalIntents.moveFocusUp,
        ),
        Command(
          id: 'terminal-focus-down',
          priority: 30,
          label: l10n.moveFocusDownCommand,
          intent: TerminalIntents.moveFocusDown,
        ),
        Command(
          id: 'terminal-focus-left',
          priority: 30,
          label: l10n.moveFocusLeftCommand,
          intent: TerminalIntents.moveFocusLeft,
        ),
        Command(
          id: 'terminal-focus-right',
          priority: 30,
          label: l10n.moveFocusRightCommand,
          intent: TerminalIntents.moveFocusRight,
        ),
        Command(
          id: 'terminal-zoom-in',
          label: l10n.zoomInCommand,
          intent: TerminalIntents.zoomIn,
        ),
        Command(
          id: 'terminal-zoom-out',
          label: l10n.zoomOutCommand,
          intent: TerminalIntents.zoomOut,
        ),
        Command(
          id: 'terminal-zoom-reset',
          label: l10n.zoomResetCommand,
          intent: TerminalIntents.zoomReset,
        ),
      ],
      child: child,
    );
  }
}
