import 'dart:async';

import 'package:flutter/widgets.dart';

abstract class ShortcutSettings extends ChangeNotifier {
  Future<void> load();
  List<LogicalKeySet> get(String id);
  Future<void> add(String id, LogicalKeySet shortcut);
  Future<void> remove(String id, LogicalKeySet shortcut);
  Future<void> set(String id, List<LogicalKeySet> shortcuts);
  Future<void> unset(String id);
}
