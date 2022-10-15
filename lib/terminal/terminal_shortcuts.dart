import 'package:flutter/widgets.dart';
import 'package:shortcut_store/shortcut_store.dart';
import 'package:terminal_view/terminal_view.dart';

Map<ShortcutActivator, Intent> buildTerminalShortcuts(BuildContext context) {
  final store = ShortcutStore.of(context);
  return {
    // edit
    for (final shortcut in store.getShortcuts('terminal-copy'))
      shortcut: TerminalIntents.copy,
    for (final shortcut in store.getShortcuts('terminal-paste'))
      shortcut: TerminalIntents.paste,
    // scroll
    for (final shortcut in store.getShortcuts('terminal-scroll-up'))
      shortcut: TerminalIntents.scrollUp,
    for (final shortcut in store.getShortcuts('terminal-scroll-down'))
      shortcut: TerminalIntents.scrollDown,
    for (final shortcut in store.getShortcuts('terminal-scroll-page-up'))
      shortcut: TerminalIntents.scrollPageUp,
    for (final shortcut in store.getShortcuts('terminal-scroll-page-down'))
      shortcut: TerminalIntents.scrollPageDown,
    for (final shortcut in store.getShortcuts('terminal-scroll-to-top'))
      shortcut: TerminalIntents.scrollToTop,
    for (final shortcut in store.getShortcuts('terminal-scroll-to-bottom'))
      shortcut: TerminalIntents.scrollToBottom,
    // focus
    for (final shortcut in store.getShortcuts('terminal-focus-up'))
      shortcut: TerminalIntents.moveFocusUp,
    for (final shortcut in store.getShortcuts('terminal-focus-down'))
      shortcut: TerminalIntents.moveFocusDown,
    for (final shortcut in store.getShortcuts('terminal-focus-left'))
      shortcut: TerminalIntents.moveFocusLeft,
    for (final shortcut in store.getShortcuts('terminal-focus-right'))
      shortcut: TerminalIntents.moveFocusRight,
  };
}
