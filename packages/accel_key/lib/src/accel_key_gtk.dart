library gtk_accelerator;

import 'dart:ffi' as ffi;

import 'package:ffi/ffi.dart' as ffi;
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

import 'accel_key_x.dart';
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
  final cstr = lib.gtk_accelerator_name(keyset.gtkKey(), keyset.gtkModifiers());
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
  int gtkKey() => _findGtkKey(triggers.singleWhere((t) => !t.isModifier));
  int gtkModifiers() {
    var value = 0;
    if (hasAlt) value |= GdkModifierType.GDK_MOD1_MASK;
    if (hasControl) value |= GdkModifierType.GDK_CONTROL_MASK;
    if (hasMeta) value |= GdkModifierType.GDK_META_MASK;
    if (hasShift) value |= GdkModifierType.GDK_SHIFT_MASK;
    return value;
  }
}
