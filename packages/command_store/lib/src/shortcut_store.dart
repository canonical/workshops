import 'dart:async';

import 'package:accel_key/accel_key.dart';
import 'package:collection/collection.dart';
import 'package:dbus/dbus.dart';
import 'package:flutter/widgets.dart';
import 'package:settings_store/settings_store.dart';

import 'logical_key_set_x.dart';

class ShortcutStore extends SettingsStore {
  ShortcutStore(super.schemaId);
  ShortcutStore.of(super.gsettings);

  List<LogicalKeySet> getShortcuts(String id) {
    return get(id)?.toLogicalKeySets() ?? [];
  }

  Future<void> addShortcut(String id, LogicalKeySet shortcut) {
    final shortcuts = getShortcuts(id);
    shortcuts.add(shortcut);
    return setShortcuts(id, shortcuts);
  }

  Future<void> removeShortcut(String id, LogicalKeySet shortcut) {
    final shortcuts = getShortcuts(id);
    shortcuts.removeWhere((s) => s.equals(shortcut));
    return setShortcuts(id, shortcuts);
  }

  Future<void> setShortcuts(String id, List<LogicalKeySet> shortcuts) {
    return set(id, shortcuts.toDbusArray());
  }

  Future<void> removeShortcuts(String id) => unset(id);
}

extension _DBusValueX on DBusValue {
  List<LogicalKeySet> toLogicalKeySets() {
    return asArray()
        .map((k) => parseAccelKey(k.asString()))
        .whereNotNull()
        .toList();
  }
}

extension _LogicalKeySetListX on List<LogicalKeySet> {
  DBusArray toDbusArray() {
    return DBusArray.string(map(formatAccelKey).whereNotNull().toList());
  }
}
