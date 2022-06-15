import 'package:flutter/material.dart';
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
    return FocusScope(
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
    );
  }
}
