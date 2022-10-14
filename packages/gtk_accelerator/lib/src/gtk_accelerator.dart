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

    return SingleActivator(
      LogicalKeyboardKey(key.value),
      alt: modifiers.value & GdkModifierType.GDK_MOD1_MASK != 0,
      control: modifiers.value & GdkModifierType.GDK_CONTROL_MASK != 0,
      meta: modifiers.value & GdkModifierType.GDK_META_MASK != 0,
      shift: modifiers.value & GdkModifierType.GDK_SHIFT_MASK != 0,
    );
  });
}

/// See https://docs.gtk.org/gtk3/func.accelerator_name.html
String formatGtkAccelerator(SingleActivator shortcut) {
  final key = shortcut.trigger.keyId;
  final modifiers = shortcut.modifiers;
  final cstr = lib.gtk_accelerator_name(key, modifiers);
  final str = cstr.cast<ffi.Utf8>().toDartString();
  lib.g_free(cstr.cast());
  return str;
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
