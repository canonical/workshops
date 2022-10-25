library gtk_accelerator;

import 'dart:ffi' as ffi;

import 'package:ffi/ffi.dart' as ffi;
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

import 'libgtk.dart';

/// See https://docs.gtk.org/gtk3/func.accelerator_parse.html
LogicalKeySet? parseAccelKey(String label) {
  return ffi.using((arena) {
    final cstr = label.toNativeUtf8(allocator: arena);
    final key = arena<ffi.UnsignedInt>();
    final modifiers = arena<ffi.Int32>();
    lib.gtk_accelerator_parse(cstr.cast(), key, modifiers);

    final logicalKey = _findLogicalKey(key.value);
    if (logicalKey == null) return null;

    return LogicalKeySet.fromSet({
      logicalKey,
      if (modifiers.value & GdkModifierType.GDK_MOD1_MASK != 0)
        LogicalKeyboardKey.alt,
      if (modifiers.value & GdkModifierType.GDK_CONTROL_MASK != 0)
        LogicalKeyboardKey.control,
      if (modifiers.value & GdkModifierType.GDK_META_MASK != 0)
        LogicalKeyboardKey.meta,
      if (modifiers.value & GdkModifierType.GDK_SHIFT_MASK != 0)
        LogicalKeyboardKey.shift,
    });
  });
}

/// See https://docs.gtk.org/gtk3/func.accelerator_name.html
String? formatAccelKey(LogicalKeySet keyset) {
  final cstr = lib.gtk_accelerator_name(keyset.key, keyset.modifiers);
  if (cstr == ffi.nullptr) return null;
  final str = cstr.cast<ffi.Utf8>().toDartString();
  lib.g_free(cstr.cast());
  return str;
}

LogicalKeyboardKey? _findLogicalKey(int key) {
  return kGtkToLogicalKey[key] ??
      kGtkNumpadMap[key] ??
      LogicalKeyboardKey.findKeyByKeyId(key);
}

int _findGtkKey(LogicalKeyboardKey key) {
  return _logicalToGtkKey[key] ?? _numpadToGtkKey[key] ?? key.keyId;
}

Map<LogicalKeyboardKey, int>? __logicalToGtkKey;
Map<LogicalKeyboardKey, int> get _logicalToGtkKey =>
    __logicalToGtkKey ??= kGtkToLogicalKey.inverse(); // :(

Map<LogicalKeyboardKey, int>? __numpadToGtkKey;
Map<LogicalKeyboardKey, int> get _numpadToGtkKey =>
    __numpadToGtkKey ??= kGtkNumpadMap.inverse(); // :(

extension _MapX<K, V> on Map<K, V> {
  // invert {key: value} to {value: key}
  Map<V, K> inverse() => Map.fromIterables(values, keys);
}

extension _LogicalKeySetX on LogicalKeySet {
  bool get alt =>
      triggers.contains(LogicalKeyboardKey.alt) ||
      triggers.contains(LogicalKeyboardKey.altLeft) ||
      triggers.contains(LogicalKeyboardKey.altRight);
  bool get control =>
      triggers.contains(LogicalKeyboardKey.control) ||
      triggers.contains(LogicalKeyboardKey.controlLeft) ||
      triggers.contains(LogicalKeyboardKey.controlRight);
  bool get meta =>
      triggers.contains(LogicalKeyboardKey.meta) ||
      triggers.contains(LogicalKeyboardKey.metaLeft) ||
      triggers.contains(LogicalKeyboardKey.metaRight);
  bool get shift =>
      triggers.contains(LogicalKeyboardKey.shift) ||
      triggers.contains(LogicalKeyboardKey.shiftLeft) ||
      triggers.contains(LogicalKeyboardKey.shiftRight);

  int get key => _findGtkKey(triggers.singleWhere((t) => !t.isModifier));

  int get modifiers {
    var value = 0;
    if (alt) value |= GdkModifierType.GDK_MOD1_MASK;
    if (control) value |= GdkModifierType.GDK_CONTROL_MASK;
    if (meta) value |= GdkModifierType.GDK_META_MASK;
    if (shift) value |= GdkModifierType.GDK_SHIFT_MASK;
    return value;
  }
}

extension _LogicalKeyboardKeyX on LogicalKeyboardKey {
  bool get isModifier => synonyms.isNotEmpty || _modifiers.contains(this);
}

final Set<LogicalKeyboardKey> _modifiers = <LogicalKeyboardKey>{
  LogicalKeyboardKey.alt,
  LogicalKeyboardKey.control,
  LogicalKeyboardKey.meta,
  LogicalKeyboardKey.shift,
};
