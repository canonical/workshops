import 'dart:async';

import 'package:flutter/widgets.dart';

abstract class ShortcutSettings extends ChangeNotifier {
  Future<void> load();
  List<SingleActivator> get(String id);
  Future<void> add(String id, SingleActivator shortcut);
  Future<void> remove(String id, SingleActivator shortcut);
  Future<void> set(String id, List<SingleActivator> shortcuts);
  Future<void> unset(String id);
}
