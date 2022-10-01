import 'package:flutter/material.dart';
import 'package:xterm/xterm.dart' as xterm;

import 'terminal_actions.dart';
import 'terminal_intents.dart';
import 'terminal_shortcuts.dart';
import 'terminal_theme.dart';

class TerminalView extends StatefulWidget {
  const TerminalView({
    super.key,
    required this.terminal,
    this.controller,
    this.scrollController,
    this.focusNode,
    this.autofocus = false,
    this.onContextMenu,
  });

  final xterm.Terminal terminal;
  final xterm.TerminalController? controller;
  final ScrollController? scrollController;
  final FocusNode? focusNode;
  final bool autofocus;
  final void Function(Offset)? onContextMenu;

  @override
  State<TerminalView> createState() => _TerminalViewState();
}

class _TerminalViewState extends State<TerminalView> {
  late final xterm.TerminalController _controller;
  late final ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _controller = widget.controller ?? xterm.TerminalController();
    _scrollController = widget.scrollController ?? ScrollController();
  }

  @override
  void didUpdateWidget(covariant TerminalView oldWidget) {
    if (oldWidget.controller != widget.controller) {
      if (oldWidget.controller == null) {
        _controller.dispose();
      }
      _controller = widget.controller ?? xterm.TerminalController();
    }
    if (oldWidget.scrollController != widget.scrollController) {
      if (oldWidget.scrollController == null) {
        _scrollController.dispose();
      }
      _scrollController = widget.scrollController ?? ScrollController();
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    if (widget.controller == null) {
      _controller.dispose();
    }
    if (widget.scrollController == null) {
      _scrollController.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = TerminalTheme.maybeOf(context);
    return FocusScope(
      child: xterm.TerminalView(
        widget.terminal,
        controller: _controller,
        scrollController: _scrollController,
        padding: const EdgeInsets.all(2),
        autofocus: widget.autofocus,
        focusNode: widget.focusNode,
        theme: theme?.toXterm() ?? xterm.TerminalThemes.defaultTheme,
        textStyle: xterm.TerminalStyle(
          fontSize: theme?.fontSize ?? 16,
          fontFamily: theme?.fontFamily ?? 'Monospace',
        ),
        onSecondaryTapDown: (details, offset) {
          widget.onContextMenu?.call(details.globalPosition);
        },
        shortcuts: const {
          TerminalShortcuts.copy: TerminalIntents.copy,
          TerminalShortcuts.paste: TerminalIntents.paste,
          TerminalShortcuts.scrollUp: TerminalIntents.scrollUp,
          TerminalShortcuts.scrollDown: TerminalIntents.scrollDown,
          TerminalShortcuts.scrollPageUp: TerminalIntents.scrollPageUp,
          TerminalShortcuts.scrollPageDown: TerminalIntents.scrollPageDown,
          TerminalShortcuts.scrollToTop: TerminalIntents.scrollToTop,
          TerminalShortcuts.scrollToBottom: TerminalIntents.scrollToBottom,
        },
        actions: {
          ScrollUpIntent: ScrollUpAction(_scrollController),
          ScrollDownIntent: ScrollDownAction(_scrollController),
          ScrollPageUpIntent: ScrollPageUpAction(_scrollController),
          ScrollPageDownIntent: ScrollPageDownAction(_scrollController),
          ScrollToTopIntent: ScrollToTopAction(_scrollController),
          ScrollToBottomIntent: ScrollToBottomAction(_scrollController),
        },
      ),
    );
  }
}

extension _XtermTheme on TerminalThemeData {
  xterm.TerminalTheme toXterm() {
    return xterm.TerminalTheme(
      foreground: scheme.foreground,
      background: scheme.background,
      black: palette.black,
      red: palette.red,
      green: palette.green,
      yellow: palette.yellow,
      blue: palette.blue,
      magenta: palette.magenta,
      cyan: palette.cyan,
      white: palette.white,
      brightBlack: brightPalette.black,
      brightRed: brightPalette.red,
      brightGreen: brightPalette.green,
      brightYellow: brightPalette.yellow,
      brightBlue: brightPalette.black,
      brightMagenta: brightPalette.magenta,
      brightCyan: brightPalette.cyan,
      brightWhite: brightPalette.white,
      searchHitBackground: searchHitBackground,
      searchHitBackgroundCurrent: searchHitBackgroundCurrent,
      searchHitForeground: searchHitForeground,
    );
  }
}
