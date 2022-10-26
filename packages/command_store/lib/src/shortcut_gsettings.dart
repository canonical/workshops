import 'dart:async';

import 'package:accel_key/accel_key.dart';
import 'package:collection/collection.dart';
import 'package:flutter/widgets.dart';
import 'package:gio_settings/gio_settings.dart';

import 'logical_key_set_x.dart';
import 'shortcut_settings.dart';

class ShortcutGSettings extends ShortcutSettings {
  ShortcutGSettings(String schemaId) : _gsettings = GioSettings(schemaId);
  ShortcutGSettings.of(this._gsettings);

  final GioSettings _gsettings;
  StreamSubscription? _sub;
  final _shortcuts = <String, List<LogicalKeySet>>{};

  @override
  Future<void> load() async {
    _sub ??= _gsettings.keysChanged.listen((ids) async {
      for (final id in ids) {
        _shortcuts[id] = await _fetchShortcuts(id);
      }
      notifyListeners();
    });

    var wasChanged = false;
    for (final id in await _gsettings.list()) {
      final shortcuts = await _fetchShortcuts(id);
      if (!logicalKeySetListEquals(_shortcuts[id], shortcuts)) {
        _shortcuts[id] = shortcuts;
        wasChanged = true;
      }
    }
    if (wasChanged) notifyListeners();
  }

  @override
  List<LogicalKeySet> get(String id) {
    return List.of(_shortcuts[id] ?? []);
  }

  @override
  Future<void> add(String id, LogicalKeySet shortcut) {
    final shortcuts = get(id);
    shortcuts.add(shortcut);
    return set(id, shortcuts);
  }

  @override
  Future<void> remove(String id, LogicalKeySet shortcut) {
    final shortcuts = get(id);
    shortcuts.removeWhere((s) => s.equals(shortcut));
    return set(id, shortcuts);
  }

  @override
  Future<void> set(String id, List<LogicalKeySet> shortcuts) {
    return _gsettings.set(id, shortcuts.toStringList());
  }

  @override
  Future<void> unset(String id) => _gsettings.unset(id);

  Future<List<LogicalKeySet>> _fetchShortcuts(String id) async {
    final value = await _gsettings.get<List>(id);
    return value.cast<String>().toLogicalKeySets();
  }

  @override
  Future<void> dispose() async {
    await _sub?.cancel();
    await _gsettings.close();
    _sub = null;
    _shortcuts.clear();
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
