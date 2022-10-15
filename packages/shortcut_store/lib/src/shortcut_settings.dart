import 'dart:async';

import 'package:flutter/widgets.dart';

abstract class ShortcutSettings extends ChangeNotifier {
  Future<void> init();

  List<SingleActivator> getShortcuts(String id);
  Future<void> addShortcut(String id, SingleActivator shortcut);
  Future<void> removeShortcut(String id, SingleActivator shortcut);
  Future<void> setShortcuts(String id, List<SingleActivator> shortcuts);
  Future<void> removeShortcuts(String id);
}
