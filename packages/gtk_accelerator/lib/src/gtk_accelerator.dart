library gtk_accelerator;

import 'dart:ffi' as ffi;

import 'package:ffi/ffi.dart' as ffi;
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

import 'libgtk.dart';

/// See https://docs.gtk.org/gtk3/func.accelerator_parse.html
SingleActivator? parseGtkAccelerator(String accelerator) {
  return ffi.using((arena) {
    final cstr = accelerator.toNativeUtf8(allocator: arena);
    final key = arena<ffi.UnsignedInt>();
    final modifiers = arena<ffi.Int32>();
    lib.gtk_accelerator_parse(cstr.cast(), key, modifiers);

    final logicalKey = _findLogicalKey(key.value);
    if (logicalKey == null) return null;

    return SingleActivator(
      logicalKey,
      alt: modifiers.value & GdkModifierType.GDK_MOD1_MASK != 0,
      control: modifiers.value & GdkModifierType.GDK_CONTROL_MASK != 0,
      meta: modifiers.value & GdkModifierType.GDK_META_MASK != 0,
      shift: modifiers.value & GdkModifierType.GDK_SHIFT_MASK != 0,
    );
  });
}

/// See https://docs.gtk.org/gtk3/func.accelerator_name.html
String formatGtkAccelerator(SingleActivator shortcut) {
  final key = _findGtkKey(shortcut.trigger);
  final modifiers = shortcut.modifiers;
  final cstr = lib.gtk_accelerator_name(key, modifiers);
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

extension _SingleActivatorX on SingleActivator {
  int get modifiers {
    var value = 0;
    if (alt) value |= GdkModifierType.GDK_MOD1_MASK;
    if (control) value |= GdkModifierType.GDK_CONTROL_MASK;
    if (meta) value |= GdkModifierType.GDK_META_MASK;
    if (shift) value |= GdkModifierType.GDK_SHIFT_MASK;
    return value;
  }
}
