// coverage:ignore-file
// AUTO GENERATED FILE, DO NOT EDIT.
//
// Generated by `package:ffigen`.
import 'dart:ffi' as ffi;

/// GTK+ 3.0
class LibGtk {
  /// Holds the symbol lookup function.
  final ffi.Pointer<T> Function<T extends ffi.NativeType>(String symbolName)
      _lookup;

  /// The symbols are looked up in [dynamicLibrary].
  LibGtk(ffi.DynamicLibrary dynamicLibrary) : _lookup = dynamicLibrary.lookup;

  /// The symbols are looked up with [lookup].
  LibGtk.fromLookup(
      ffi.Pointer<T> Function<T extends ffi.NativeType>(String symbolName)
          lookup)
      : _lookup = lookup;

  void g_free(
    ffi.Pointer<ffi.Void> mem,
  ) {
    return _g_free(
      mem,
    );
  }

  late final _g_freePtr =
      _lookup<ffi.NativeFunction<ffi.Void Function(ffi.Pointer<ffi.Void>)>>(
          'g_free');
  late final _g_free =
      _g_freePtr.asFunction<void Function(ffi.Pointer<ffi.Void>)>();

  void gtk_accelerator_parse(
    ffi.Pointer<ffi.Char> accelerator,
    ffi.Pointer<ffi.UnsignedInt> accelerator_key,
    ffi.Pointer<ffi.Int32> accelerator_mods,
  ) {
    return _gtk_accelerator_parse(
      accelerator,
      accelerator_key,
      accelerator_mods,
    );
  }

  late final _gtk_accelerator_parsePtr = _lookup<
      ffi.NativeFunction<
          ffi.Void Function(ffi.Pointer<ffi.Char>, ffi.Pointer<ffi.UnsignedInt>,
              ffi.Pointer<ffi.Int32>)>>('gtk_accelerator_parse');
  late final _gtk_accelerator_parse = _gtk_accelerator_parsePtr.asFunction<
      void Function(ffi.Pointer<ffi.Char>, ffi.Pointer<ffi.UnsignedInt>,
          ffi.Pointer<ffi.Int32>)>();

  ffi.Pointer<ffi.Char> gtk_accelerator_name(
    int accelerator_key,
    int accelerator_mods,
  ) {
    return _gtk_accelerator_name(
      accelerator_key,
      accelerator_mods,
    );
  }

  late final _gtk_accelerator_namePtr = _lookup<
      ffi.NativeFunction<
          ffi.Pointer<ffi.Char> Function(
              ffi.UnsignedInt, ffi.Int32)>>('gtk_accelerator_name');
  late final _gtk_accelerator_name = _gtk_accelerator_namePtr
      .asFunction<ffi.Pointer<ffi.Char> Function(int, int)>();
}

/// GdkModifierType:
/// @GDK_SHIFT_MASK: the Shift key.
/// @GDK_LOCK_MASK: a Lock key (depending on the modifier mapping of the
/// X server this may either be CapsLock or ShiftLock).
/// @GDK_CONTROL_MASK: the Control key.
/// @GDK_MOD1_MASK: the fourth modifier key (it depends on the modifier
/// mapping of the X server which key is interpreted as this modifier, but
/// normally it is the Alt key).
/// @GDK_MOD2_MASK: the fifth modifier key (it depends on the modifier
/// mapping of the X server which key is interpreted as this modifier).
/// @GDK_MOD3_MASK: the sixth modifier key (it depends on the modifier
/// mapping of the X server which key is interpreted as this modifier).
/// @GDK_MOD4_MASK: the seventh modifier key (it depends on the modifier
/// mapping of the X server which key is interpreted as this modifier).
/// @GDK_MOD5_MASK: the eighth modifier key (it depends on the modifier
/// mapping of the X server which key is interpreted as this modifier).
/// @GDK_BUTTON1_MASK: the first mouse button.
/// @GDK_BUTTON2_MASK: the second mouse button.
/// @GDK_BUTTON3_MASK: the third mouse button.
/// @GDK_BUTTON4_MASK: the fourth mouse button.
/// @GDK_BUTTON5_MASK: the fifth mouse button.
/// @GDK_MODIFIER_RESERVED_13_MASK: A reserved bit flag; do not use in your own code
/// @GDK_MODIFIER_RESERVED_14_MASK: A reserved bit flag; do not use in your own code
/// @GDK_MODIFIER_RESERVED_15_MASK: A reserved bit flag; do not use in your own code
/// @GDK_MODIFIER_RESERVED_16_MASK: A reserved bit flag; do not use in your own code
/// @GDK_MODIFIER_RESERVED_17_MASK: A reserved bit flag; do not use in your own code
/// @GDK_MODIFIER_RESERVED_18_MASK: A reserved bit flag; do not use in your own code
/// @GDK_MODIFIER_RESERVED_19_MASK: A reserved bit flag; do not use in your own code
/// @GDK_MODIFIER_RESERVED_20_MASK: A reserved bit flag; do not use in your own code
/// @GDK_MODIFIER_RESERVED_21_MASK: A reserved bit flag; do not use in your own code
/// @GDK_MODIFIER_RESERVED_22_MASK: A reserved bit flag; do not use in your own code
/// @GDK_MODIFIER_RESERVED_23_MASK: A reserved bit flag; do not use in your own code
/// @GDK_MODIFIER_RESERVED_24_MASK: A reserved bit flag; do not use in your own code
/// @GDK_MODIFIER_RESERVED_25_MASK: A reserved bit flag; do not use in your own code
/// @GDK_SUPER_MASK: the Super modifier. Since 2.10
/// @GDK_HYPER_MASK: the Hyper modifier. Since 2.10
/// @GDK_META_MASK: the Meta modifier. Since 2.10
/// @GDK_MODIFIER_RESERVED_29_MASK: A reserved bit flag; do not use in your own code
/// @GDK_RELEASE_MASK: not used in GDK itself. GTK+ uses it to differentiate
/// between (keyval, modifiers) pairs from key press and release events.
/// @GDK_MODIFIER_MASK: a mask covering all modifier types.
///
/// A set of bit-flags to indicate the state of modifier keys and mouse buttons
/// in various event types. Typical modifier keys are Shift, Control, Meta,
/// Super, Hyper, Alt, Compose, Apple, CapsLock or ShiftLock.
///
/// Like the X Window System, GDK supports 8 modifier keys and 5 mouse buttons.
///
/// Since 2.10, GDK recognizes which of the Meta, Super or Hyper keys are mapped
/// to Mod2 - Mod5, and indicates this by setting %GDK_SUPER_MASK,
/// %GDK_HYPER_MASK or %GDK_META_MASK in the state field of key events.
///
/// Note that GDK may add internal values to events which include
/// reserved values such as %GDK_MODIFIER_RESERVED_13_MASK.  Your code
/// should preserve and ignore them.  You can use %GDK_MODIFIER_MASK to
/// remove all reserved values.
///
/// Also note that the GDK X backend interprets button press events for button
/// 4-7 as scroll events, so %GDK_BUTTON4_MASK and %GDK_BUTTON5_MASK will never
/// be set.
abstract class GdkModifierType {
  static const int GDK_SHIFT_MASK = 1;
  static const int GDK_LOCK_MASK = 2;
  static const int GDK_CONTROL_MASK = 4;
  static const int GDK_MOD1_MASK = 8;
  static const int GDK_MOD2_MASK = 16;
  static const int GDK_MOD3_MASK = 32;
  static const int GDK_MOD4_MASK = 64;
  static const int GDK_MOD5_MASK = 128;
  static const int GDK_BUTTON1_MASK = 256;
  static const int GDK_BUTTON2_MASK = 512;
  static const int GDK_BUTTON3_MASK = 1024;
  static const int GDK_BUTTON4_MASK = 2048;
  static const int GDK_BUTTON5_MASK = 4096;
  static const int GDK_MODIFIER_RESERVED_13_MASK = 8192;
  static const int GDK_MODIFIER_RESERVED_14_MASK = 16384;
  static const int GDK_MODIFIER_RESERVED_15_MASK = 32768;
  static const int GDK_MODIFIER_RESERVED_16_MASK = 65536;
  static const int GDK_MODIFIER_RESERVED_17_MASK = 131072;
  static const int GDK_MODIFIER_RESERVED_18_MASK = 262144;
  static const int GDK_MODIFIER_RESERVED_19_MASK = 524288;
  static const int GDK_MODIFIER_RESERVED_20_MASK = 1048576;
  static const int GDK_MODIFIER_RESERVED_21_MASK = 2097152;
  static const int GDK_MODIFIER_RESERVED_22_MASK = 4194304;
  static const int GDK_MODIFIER_RESERVED_23_MASK = 8388608;
  static const int GDK_MODIFIER_RESERVED_24_MASK = 16777216;
  static const int GDK_MODIFIER_RESERVED_25_MASK = 33554432;
  static const int GDK_SUPER_MASK = 67108864;
  static const int GDK_HYPER_MASK = 134217728;
  static const int GDK_META_MASK = 268435456;
  static const int GDK_MODIFIER_RESERVED_29_MASK = 536870912;
  static const int GDK_RELEASE_MASK = 1073741824;
  static const int GDK_MODIFIER_MASK = 1543512063;
}
