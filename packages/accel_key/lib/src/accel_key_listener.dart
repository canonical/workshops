import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AccelKeyListener extends StatelessWidget {
  const AccelKeyListener({
    super.key,
    required this.child,
    required this.focusNode,
    this.autofocus = false,
    required this.onAccelKey,
  });

  final Widget child;
  final bool autofocus;
  final FocusNode focusNode;
  final ValueChanged<LogicalKeySet> onAccelKey;

  @override
  Widget build(BuildContext context) {
    return RawKeyboardListener(
      autofocus: autofocus,
      focusNode: focusNode,
      onKey: _handleKey,
      child: child,
    );
  }

  void _handleKey(RawKeyEvent event) {
    if (event is! RawKeyDownEvent || event.repeat) return;

    final isModifierPressed = event.isAltPressed ||
        event.isControlPressed ||
        event.isMetaPressed ||
        event.isShiftPressed;

    if (!isModifierPressed &&
        (event.logicalKey == LogicalKeyboardKey.escape ||
            event.logicalKey == LogicalKeyboardKey.enter)) {
      return;
    }

    onAccelKey(LogicalKeySet.fromSet({
      event.logicalKey,
      if (event.isAltPressed &&
          !event.logicalKey.synonyms.contains(LogicalKeyboardKey.alt))
        LogicalKeyboardKey.alt,
      if (event.isControlPressed &&
          !event.logicalKey.synonyms.contains(LogicalKeyboardKey.control))
        LogicalKeyboardKey.control,
      if (event.isMetaPressed &&
          !event.logicalKey.synonyms.contains(LogicalKeyboardKey.meta))
        LogicalKeyboardKey.meta,
      if (event.isShiftPressed &&
          !event.logicalKey.synonyms.contains(LogicalKeyboardKey.shift))
        LogicalKeyboardKey.shift,
    }));
  }
}
