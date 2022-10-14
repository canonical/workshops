import 'dart:ffi';

import 'libgtk.g.dart';
export 'libgtk.g.dart';

LibGtk? _lib;
LibGtk get lib => _lib ??= LibGtk(DynamicLibrary.open('libgtk-3.so.0'));
