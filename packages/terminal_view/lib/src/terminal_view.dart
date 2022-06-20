import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:xterm/flutter.dart' as xterm;
import 'package:xterm/xterm.dart' as xterm;

import 'terminal.dart';
import 'terminal_theme.dart';

class TerminalView extends StatelessWidget {
  const TerminalView({super.key, required this.terminal});

  final Terminal terminal;

  @override
  Widget build(BuildContext context) {
    final theme = TerminalTheme.maybeOf(context);
    return CallbackShortcuts(
      bindings: {
        const SingleActivator(LogicalKeyboardKey.keyC,
            control: true, shift: true): terminal.copy,
        const SingleActivator(LogicalKeyboardKey.keyV,
            control: true, shift: true): terminal.paste,
        const SingleActivator(LogicalKeyboardKey.arrowUp,
            control: true, shift: true): terminal.scrollUp,
        const SingleActivator(LogicalKeyboardKey.arrowDown,
            control: true, shift: true): terminal.scrollDown,
        const SingleActivator(LogicalKeyboardKey.pageUp, shift: true):
            terminal.scrollPageUp,
        const SingleActivator(LogicalKeyboardKey.pageDown, shift: true):
            terminal.scrollPageDown,
        const SingleActivator(LogicalKeyboardKey.home, shift: true):
            terminal.scrollToTop,
        const SingleActivator(LogicalKeyboardKey.end, shift: true):
            terminal.scrollToBottom,
      },
      child: FocusScope(
        child: AnimatedBuilder(
          animation: terminal,
          builder: (context, child) {
            return xterm.TerminalView(
              padding: 2,
              autofocus: true,
              terminal: terminal.buildXterm(theme: theme),
              style: xterm.TerminalStyle(
                fontSize: theme?.fontSize ?? 16,
                fontFamily: [
                  if (theme != null) theme.fontFamily,
                  ...xterm.TerminalStyle.defaultFontFamily,
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
