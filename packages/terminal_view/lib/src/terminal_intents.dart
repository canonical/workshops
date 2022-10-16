import 'package:flutter/widgets.dart';

abstract class TerminalIntents {
  const TerminalIntents._();

  // edit
  static const copy = CopySelectionTextIntent.copy;
  static const paste = PasteTextIntent(SelectionChangedCause.keyboard);

  // scroll
  static const scrollUp = ScrollUpIntent();
  static const scrollDown = ScrollDownIntent();
  static const scrollPageUp = ScrollPageUpIntent();
  static const scrollPageDown = ScrollPageDownIntent();
  static const scrollToTop = ScrollToTopIntent();
  static const scrollToBottom = ScrollToBottomIntent();

  // split
  static const splitAuto = SplitAutoIntent();

  // focus
  static const moveFocusUp = MoveFocusIntent(TraversalDirection.up);
  static const moveFocusDown = MoveFocusIntent(TraversalDirection.down);
  static const moveFocusLeft = MoveFocusIntent(TraversalDirection.left);
  static const moveFocusRight = MoveFocusIntent(TraversalDirection.right);
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

class SplitAutoIntent extends Intent {
  const SplitAutoIntent();
}

class MoveFocusIntent extends DirectionalFocusIntent {
  const MoveFocusIntent(super.direction);
}
