import 'dart:async';

import 'package:accel_key/accel_key.dart';
import 'package:collection/collection.dart';
import 'package:flutter/widgets.dart';
import 'package:settings_store/settings_store.dart';

import 'logical_key_set_x.dart';

class ShortcutStore with ChangeNotifier {
  factory ShortcutStore(String schemaId) =>
      ShortcutStore.of(SettingsStore(schemaId));

  ShortcutStore.of(this._settings) {
    _settings.addListener(notifyListeners);
  }

  final SettingsStore _settings;

  Future<void> init() => _settings.init();

  Iterable<String> get keys => _settings.keys;

  List<LogicalKeySet>? getShortcuts(String id) {
    return _settings.get<List<String>>(id)?.toLogicalKeySets();
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
    return _settings.set(id, shortcuts.toStringList());
  }

  Future<void> removeShortcuts(String id) => _settings.unset(id);

  @override
  void dispose() {
    _settings.removeListener(notifyListeners);
    super.dispose();
  }
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
