library settings_store;

import 'dart:async';

import 'package:dbus/dbus.dart';
import 'package:flutter/widgets.dart';
import 'package:gsettings/gsettings.dart';

class SettingsStore extends ChangeNotifier {
  SettingsStore(String schemaId) : _gsettings = GSettings(schemaId);
  SettingsStore.of(this._gsettings);

  final GSettings _gsettings;
  StreamSubscription? _sub;
  final _values = <String, DBusValue>{};

  Future<void> load() async {
    _sub ??= _gsettings.keysChanged.listen((keys) async {
      for (final key in keys) {
        _values[key] = await _fetchValue(key);
      }
      notifyListeners();
    });

    var wasChanged = false;
    for (final id in await _gsettings.list()) {
      final value = await _fetchValue(id);
      if (_values[id] != value) {
        _values[id] = value;
        wasChanged = true;
      }
    }
    if (wasChanged) notifyListeners();
  }

  DBusValue? get(String id) => _values[id];
  Future<void> set(String id, DBusValue value) => _gsettings.set(id, value);
  Future<void> unset(String id) => _gsettings.unset(id);

  Future<DBusValue> _fetchValue(String id) => _gsettings.get(id);

  @override
  Future<void> dispose() async {
    await _sub?.cancel();
    await _gsettings.close();
    _sub = null;
    _values.clear();
    super.dispose();
  }
}
