import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:terminal_view/terminal_view.dart';

import '../settings/shortcut_settings.dart';

Map<ShortcutActivator, Intent> buildTerminalShortcuts(BuildContext context) {
  final shortcuts = context.watch<ShortcutSettings>();
  return {
    // edit
    for (final shortcut in shortcuts.getShortcuts('terminal-copy'))
      shortcut: TerminalIntents.copy,
    for (final shortcut in shortcuts.getShortcuts('terminal-paste'))
      shortcut: TerminalIntents.paste,
    // scroll
    for (final shortcut in shortcuts.getShortcuts('terminal-scroll-up'))
      shortcut: TerminalIntents.scrollUp,
    for (final shortcut in shortcuts.getShortcuts('terminal-scroll-down'))
      shortcut: TerminalIntents.scrollDown,
    for (final shortcut in shortcuts.getShortcuts('terminal-scroll-page-up'))
      shortcut: TerminalIntents.scrollPageUp,
    for (final shortcut in shortcuts.getShortcuts('terminal-scroll-page-down'))
      shortcut: TerminalIntents.scrollPageDown,
    for (final shortcut in shortcuts.getShortcuts('terminal-scroll-to-top'))
      shortcut: TerminalIntents.scrollToTop,
    for (final shortcut in shortcuts.getShortcuts('terminal-scroll-to-bottom'))
      shortcut: TerminalIntents.scrollToBottom,
    // focus
    for (final shortcut in shortcuts.getShortcuts('terminal-focus-up'))
      shortcut: TerminalIntents.moveFocusUp,
    for (final shortcut in shortcuts.getShortcuts('terminal-focus-down'))
      shortcut: TerminalIntents.moveFocusDown,
    for (final shortcut in shortcuts.getShortcuts('terminal-focus-left'))
      shortcut: TerminalIntents.moveFocusLeft,
    for (final shortcut in shortcuts.getShortcuts('terminal-focus-right'))
      shortcut: TerminalIntents.moveFocusRight,
  };
}
