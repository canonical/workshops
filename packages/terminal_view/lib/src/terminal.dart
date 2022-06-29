import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:lxd/lxd.dart';
import 'package:xterm/theme/terminal_theme.dart' as xterm;
import 'package:xterm/theme/terminal_themes.dart' as xterm;
import 'package:xterm/xterm.dart' as xterm;

import 'terminal_backend.dart';
import 'terminal_theme.dart';

class Terminal extends ChangeNotifier {
  Terminal({
    required this.client,
    required this.instance,
    int? maxLines,
    TerminalThemeData? theme,
    this.onExit,
  })  : _maxLines = maxLines,
        _theme = theme;

  final LxdClient client;
  final LxdInstance instance;
  final VoidCallback? onExit;

  int? _maxLines;
  xterm.Terminal? _xterm;
  TerminalThemeData? _theme;

  xterm.Terminal buildXterm({int? maxLines, TerminalThemeData? theme}) {
    if (_xterm == null || _theme != theme || _maxLines != maxLines) {
      _maxLines = maxLines;
      _theme = theme;
      _xterm = _rebuildXterm(
        maxLines ?? 10000, // TODO
        theme?.palette.toXtermTheme() ?? xterm.TerminalThemes.defaultTheme,
      );
      _xterm!.setBracketedPasteMode(false);
    }
    return _xterm!;
  }

  xterm.Terminal _rebuildXterm(int maxLines, xterm.TerminalTheme theme) {
    return xterm.Terminal(
      backend: LxdTerminalBackend(
        client: client,
        instance: instance,
        onExit: onExit,
      ),
      maxLines: maxLines,
      theme: theme,
      onTitleChange: _setTitle,
    );
  }

  String? _title;
  String? get title => _title;
  void _setTitle(String title) {
    if (_title == title) return;
    _title = title;
    notifyListeners();
  }

  String? get selectedText => _xterm?.selectedText;

  Future<void> copy() async {
    final data = ClipboardData(text: selectedText);
    return Clipboard.setData(data);
  }

  Future<void> paste() async {
    final data = await Clipboard.getData('text/plain');
    _xterm?.paste(data?.text ?? '');
  }

  void selectAll() => _xterm?.selectAll();

  int get _bufferHeight => _xterm?.bufferHeight ?? 0;
  int get _pageHeight => _xterm?.viewHeight ?? 0;
  int get _scrollOffset => _xterm?.scrollOffsetFromBottom ?? 0;
  void _scrollTo(int offset) => _xterm?.setScrollOffsetFromBottom(offset);

  void scrollUp() => _scrollTo(_scrollOffset + 1);
  void scrollDown() => _scrollTo(_scrollOffset - 1);
  void scrollPageUp() => _scrollTo(_scrollOffset + _pageHeight);
  void scrollPageDown() => _scrollTo(_scrollOffset - _pageHeight);
  void scrollToTop() => _scrollTo(_bufferHeight - _pageHeight);
  void scrollToBottom() => _scrollTo(0);
}

extension _XtermTheme on TerminalPalette {
  xterm.TerminalTheme toXtermTheme() {
    return xterm.TerminalTheme(
      cursor: cursor.value,
      selection: selection.value,
      foreground: foreground.value,
      background: background.value,
      black: black.value,
      red: red.value,
      green: green.value,
      yellow: yellow.value,
      blue: blue.value,
      magenta: magenta.value,
      cyan: cyan.value,
      white: white.value,
      brightBlack: brightBlack.value,
      brightRed: brightRed.value,
      brightGreen: brightGreen.value,
      brightYellow: brightYellow.value,
      brightBlue: brightBlack.value,
      brightMagenta: brightMagenta.value,
      brightCyan: brightCyan.value,
      brightWhite: brightWhite.value,
      searchHitBackground: searchHitBackground.value,
      searchHitBackgroundCurrent: searchHitBackgroundCurrent.value,
      searchHitForeground: searchHitForeground.value,
    );
  }
}
