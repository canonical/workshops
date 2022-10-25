import 'package:collection/collection.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

extension LogicalKeySetX on LogicalKeySet {
  bool get hasAlt => triggers.any((t) => t.isAlt);
  bool get hasControl => triggers.any((t) => t.isControl);
  bool get hasMeta => triggers.any((t) => t.isMeta);
  bool get hasShift => triggers.any((t) => t.isShift);

  List<LogicalKeyboardKey> sorted() {
    return keys.sorted((a, b) {
      if (a.isModifier && b.isModifier) {
        return _modifiers.indexOf(a).compareTo(_modifiers.indexOf(b));
      } else if (a.isModifier) {
        return -1;
      } else if (b.isModifier) {
        return 1;
      } else {
        return a.keyLabel.compareTo(b.keyLabel);
      }
    });
  }
}

extension LogicalKeyboardKeyX on LogicalKeyboardKey {
  bool get isModifier => isAlt || isControl || isMeta || isShift;

  bool get isAlt =>
      this == LogicalKeyboardKey.alt ||
      this == LogicalKeyboardKey.altLeft ||
      this == LogicalKeyboardKey.altRight;

  bool get isControl =>
      this == LogicalKeyboardKey.control ||
      this == LogicalKeyboardKey.controlLeft ||
      this == LogicalKeyboardKey.controlRight;

  bool get isMeta =>
      this == LogicalKeyboardKey.meta ||
      this == LogicalKeyboardKey.metaLeft ||
      this == LogicalKeyboardKey.metaRight;

  bool get isShift =>
      this == LogicalKeyboardKey.shift ||
      this == LogicalKeyboardKey.shiftLeft ||
      this == LogicalKeyboardKey.shiftRight;
}

const _modifiers = [
  LogicalKeyboardKey.control,
  LogicalKeyboardKey.controlLeft,
  LogicalKeyboardKey.controlRight,
  LogicalKeyboardKey.shift,
  LogicalKeyboardKey.shiftLeft,
  LogicalKeyboardKey.shiftRight,
  LogicalKeyboardKey.alt,
  LogicalKeyboardKey.altLeft,
  LogicalKeyboardKey.altRight,
  LogicalKeyboardKey.meta,
  LogicalKeyboardKey.metaLeft,
  LogicalKeyboardKey.metaRight,
];
