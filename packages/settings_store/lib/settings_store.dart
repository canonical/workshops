library settings_store;

import 'dart:async';

import 'package:dbus/dbus.dart';
import 'package:flutter/foundation.dart';
import 'package:gsettings/gsettings.dart';

class SettingsStore extends ChangeNotifier {
  SettingsStore(String schemaId) : _gsettings = GSettings(schemaId);
  SettingsStore.of(this._gsettings);

  final GSettings _gsettings;
  StreamSubscription? _sub;
  final _values = <String, DBusValue>{};

  Future<void> init() async {
    _sub ??= _gsettings.keysChanged.listen((keys) async {
      for (final key in keys) {
        // TODO: https: //github.com/canonical/gsettings.dart/issues/48
        if (key.contains('/')) continue;
        _values[key] = await _getValue(key);
      }
      notifyListeners();
    });

    var wasChanged = false;
    for (final key in await _gsettings.list()) {
      final value = await _getValue(key);
      if (_values[key] != value) {
        _values[key] = value;
        wasChanged = true;
      }
    }
    if (wasChanged) notifyListeners();
  }

  Iterable<String> get keys => _values.keys;
  DBusValue? get(String key) => _values[key];
  Future<void> set(String key, DBusValue value) => _gsettings.set(key, value);
  Future<void> unset(String key) => _gsettings.unset(key);

  Future<DBusValue> _getValue(String key) => _gsettings.get(key);

  @override
  Future<void> dispose() async {
    await _sub?.cancel();
    await _gsettings.close();
    _sub = null;
    _values.clear();
    super.dispose();
  }
}
