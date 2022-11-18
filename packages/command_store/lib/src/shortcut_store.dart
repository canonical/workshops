import 'dart:async';

import 'package:accel_key/accel_key.dart';
import 'package:collection/collection.dart';
import 'package:flutter/widgets.dart';
import 'package:settings_store/settings_store.dart';

import 'logical_key_set_x.dart';

class ShortcutStore extends SettingsStore {
  ShortcutStore(super.schemaId);
  ShortcutStore.of(super.gsettings);

  List<LogicalKeySet>? getShortcuts(String id) {
    return get<List<String>>(id)?.toLogicalKeySets();
  }

  Future<void> addShortcut(String id, LogicalKeySet shortcut) {
    final shortcuts = getShortcuts(id) ?? [];
    shortcuts.add(shortcut);
    return setShortcuts(id, shortcuts);
  }

  Future<void> removeShortcut(String id, LogicalKeySet shortcut) {
    final shortcuts = getShortcuts(id) ?? [];
    shortcuts.removeWhere((s) => s.equals(shortcut));
    return setShortcuts(id, shortcuts);
  }

  Future<void> setShortcuts(String id, List<LogicalKeySet> shortcuts) {
    return set(id, shortcuts.toStringList());
  }

  Future<void> removeShortcuts(String id) => unset(id);
}

extension _StringListX on List<String> {
  List<LogicalKeySet> toLogicalKeySets() {
    return map(parseAccelKey).whereNotNull().toList();
  }
}

extension _LogicalKeySetListX on List<LogicalKeySet> {
  List<String> toStringList() {
    return map(formatAccelKey).whereNotNull().toList();
  }
}
