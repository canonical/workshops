import 'package:flutter/widgets.dart';

abstract class TerminalIntents {
  const TerminalIntents._();

  static const copy = CopySelectionTextIntent.copy;
  static const paste = PasteTextIntent(SelectionChangedCause.keyboard);
  static const scrollUp = ScrollUpIntent();
  static const scrollDown = ScrollDownIntent();
  static const scrollPageUp = ScrollPageUpIntent();
  static const scrollPageDown = ScrollPageDownIntent();
  static const scrollToTop = ScrollToTopIntent();
  static const scrollToBottom = ScrollToBottomIntent();
}

class ScrollUpIntent extends Intent {
  const ScrollUpIntent();
}

class ScrollDownIntent extends Intent {
  const ScrollDownIntent();
}

class ScrollPageUpIntent extends Intent {
  const ScrollPageUpIntent();
}

class ScrollPageDownIntent extends Intent {
  const ScrollPageDownIntent();
}

class ScrollToTopIntent extends Intent {
  const ScrollToTopIntent();
}

class ScrollToBottomIntent extends Intent {
  const ScrollToBottomIntent();
}
