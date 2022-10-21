import 'package:command_store/command_store.dart';
import 'package:flutter/widgets.dart';
import 'package:terminal_view/terminal_view.dart';

class TerminalCommands extends StatelessWidget {
  const TerminalCommands({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return CommandScope(
      commands: const [
        // edit
        Command(
          id: 'terminal-copy',
          intent: TerminalIntents.copy,
        ),
        Command(
          id: 'terminal-paste',
          intent: TerminalIntents.paste,
        ),
        // scroll
        Command(
          id: 'terminal-scroll-up',
          intent: TerminalIntents.scrollUp,
        ),
        Command(
          id: 'terminal-scroll-down',
          intent: TerminalIntents.scrollDown,
        ),
        Command(
          id: 'terminal-scroll-page-up',
          intent: TerminalIntents.scrollPageUp,
        ),
        Command(
          id: 'terminal-scroll-page-down',
          intent: TerminalIntents.scrollPageDown,
        ),
        Command(
          id: 'terminal-scroll-to-top',
          intent: TerminalIntents.scrollToTop,
        ),
        Command(
          id: 'terminal-scroll-to-bottom',
          intent: TerminalIntents.scrollToBottom,
        ),
        // split
        Command(
          id: 'terminal-split-auto',
          intent: TerminalIntents.splitAuto,
        ),
        Command(
          id: 'terminal-split-up',
          intent: TerminalIntents.splitUp,
        ),
        Command(
          id: 'terminal-split-down',
          intent: TerminalIntents.splitDown,
        ),
        Command(
          id: 'terminal-split-left',
          intent: TerminalIntents.splitLeft,
        ),
        Command(
          id: 'terminal-split-right',
          intent: TerminalIntents.splitRight,
        ),
        // focus
        Command(
          id: 'terminal-focus-up',
          intent: TerminalIntents.moveFocusUp,
        ),
        Command(
          id: 'terminal-focus-down',
          intent: TerminalIntents.moveFocusDown,
        ),
        Command(
          id: 'terminal-focus-left',
          intent: TerminalIntents.moveFocusLeft,
        ),
        Command(
          id: 'terminal-focus-right',
          intent: TerminalIntents.moveFocusRight,
        ),
      ],
      child: child,
    );
  }
}
