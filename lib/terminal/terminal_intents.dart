import 'package:flutter/widgets.dart';

abstract class TerminalIntents {
  const TerminalIntents._();

  // edit
  static const copy = CopySelectionTextIntent.copy;
  static const paste = PasteTextIntent(SelectionChangedCause.keyboard);

  // scroll
  static const scrollUp = ScrollIntent(direction: AxisDirection.up);
  static const scrollDown = ScrollIntent(direction: AxisDirection.down);
  static const scrollPageUp =
      ScrollIntent(direction: AxisDirection.up, type: ScrollIncrementType.page);
  static const scrollPageDown = ScrollIntent(
      direction: AxisDirection.down, type: ScrollIncrementType.page);
  static const scrollToTop = ScrollToEndIntent(direction: AxisDirection.up);
  static const scrollToBottom =
      ScrollToEndIntent(direction: AxisDirection.down);

  // split
  static const splitAuto = SplitIntent(SplitDirection.auto);
  static const splitUp = SplitIntent(SplitDirection.up);
  static const splitDown = SplitIntent(SplitDirection.down);
  static const splitLeft = SplitIntent(SplitDirection.left);
  static const splitRight = SplitIntent(SplitDirection.right);

  // focus
  static const moveFocusUp = MoveFocusIntent(TraversalDirection.up);
  static const moveFocusDown = MoveFocusIntent(TraversalDirection.down);
  static const moveFocusLeft = MoveFocusIntent(TraversalDirection.left);
  static const moveFocusRight = MoveFocusIntent(TraversalDirection.right);
}

class ScrollToEndIntent extends ScrollIntent {
  const ScrollToEndIntent({required super.direction});
}

enum SplitDirection { auto, up, down, left, right }

class SplitIntent extends Intent {
  const SplitIntent(this.direction);

  final SplitDirection direction;
}

class MoveFocusIntent extends DirectionalFocusIntent {
  const MoveFocusIntent(super.direction);
}
