import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

abstract class TerminalShortcuts {
  const TerminalShortcuts._();

  static const copy = SingleActivator(
    LogicalKeyboardKey.keyC,
    control: true,
    shift: true,
  );

  static const paste = SingleActivator(
    LogicalKeyboardKey.keyV,
    control: true,
    shift: true,
  );

  static const scrollUp = SingleActivator(
    LogicalKeyboardKey.arrowUp,
    control: true,
    shift: true,
  );

  static const scrollDown = SingleActivator(
    LogicalKeyboardKey.arrowDown,
    control: true,
    shift: true,
  );

  static const scrollPageUp = SingleActivator(
    LogicalKeyboardKey.pageUp,
    shift: true,
  );

  static const scrollPageDown = SingleActivator(
    LogicalKeyboardKey.pageDown,
    shift: true,
  );

  static const scrollToTop = SingleActivator(
    LogicalKeyboardKey.home,
    shift: true,
  );

  static const scrollToBottom = SingleActivator(
    LogicalKeyboardKey.end,
    shift: true,
  );
}
