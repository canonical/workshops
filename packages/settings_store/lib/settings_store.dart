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

  T? get<T>(String key) => _fromDbusValue<T>(_values[key]) as T?;

  Future<void> set<T>(String key, T value) {
    return _gsettings.set(key, _toDbusValue<T>(value));
  }

  Future<void> unset(String key) => _gsettings.unset(key);

  Future<DBusValue> _getValue<T>(String key) {
    return _gsettings.get(key).then((v) => v);
  }

  dynamic _fromDbusValue<T>(DBusValue? value) {
    switch (T) {
      case bool:
        return value?.asBoolean();
      case int:
        return value?.asInt32();
      case double:
        return value?.asDouble();
      case String:
        return value?.asString();
      case List<String>:
        return value?.asStringArray().toList();
      default:
        return value?.toNative();
    }
  }

  DBusValue _toDbusValue<T>(T value) {
    switch (T) {
      case bool:
        return DBusBoolean(value as bool);
      case int:
        return DBusInt32(value as int);
      case double:
        return DBusDouble(value as double);
      case String:
        return DBusString(value as String);
      case List<String>:
        return DBusArray.string(value as List<String>);
      default:
        throw UnsupportedError('$T');
    }
  }

  @override
  Future<void> dispose() async {
    await _sub?.cancel();
    await _gsettings.close();
    _sub = null;
    _values.clear();
    super.dispose();
  }
}
