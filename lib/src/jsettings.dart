import 'dart:async';

import 'package:collection/collection.dart';
import 'package:file/file.dart';
import 'package:file/local.dart';
import 'package:jsettings/src/settings_file.dart';
import 'package:meta/meta.dart';

class JSettings {
  JSettings(String path, {@visibleForTesting FileSystem? fs})
      : _file = JSettingsFile(path, fs ?? const LocalFileSystem());

  final JSettingsFile _file;
  bool? _invalid;
  Map<String, Object>? _values;
  final _added = StreamController<String>.broadcast();
  final _changed = StreamController<String>.broadcast();
  final _removed = StreamController<String>.broadcast();
  final _valueEquals = const DeepCollectionEquality().equals;

  Stream<String> get added => _added.stream;
  Stream<String> get changed => _changed.stream;
  Stream<String> get removed => _removed.stream;

  Future<void> init() {
    return _file.init().then((_) => _file.watch(_invalidateValues));
  }

  Future<void> close() {
    return Future.wait([
      _file.unwatch(),
      _added.close(),
      _changed.close(),
      _removed.close(),
    ]);
  }

  Set<String> getKeys() => Set.of(getValues().keys);
  bool hasValue(String key) => getKeys().contains(key);
  Map<String, Object> getValues() => Map.of(_values ??= _file.read() ?? {});

  Object? getValue(String key) => getValues()[key];
  Future<void> setValue(String key, Object value) {
    final values = getValues();
    values[key] = value;
    return _file.write(values);
  }

  bool? getBool(String key) => getValue(key) as bool?;
  Future<void> setBool(String key, bool value) {
    return setValue(key, value);
  }

  int? getInt(String key) => getValue(key) as int?;
  Future<void> setInt(String key, int value) {
    return setValue(key, value);
  }

  double? getDouble(String key) => getValue(key) as double?;
  Future<void> setDouble(String key, double value) {
    return setValue(key, value);
  }

  String? getString(String key) => getValue(key) as String?;
  Future<void> setString(String key, String value) {
    return setValue(key, value);
  }

  List<String>? getStringList(String key) => getValue(key) as List<String>?;
  Future<void> setStringList(String key, List<String> value) {
    return setValue(key, value);
  }

  Future<void> resetValue(String key) async {
    final values = getValues();
    if (values.remove(key) != null) {
      return _file.write(values);
    }
  }

  void _invalidateValues() {
    if (_invalid == true) return;
    _invalid = true;
    scheduleMicrotask(() {
      final values = _file.read();
      if (values != null) {
        _updateValues(values);
      }
      _invalid = false;
    });
  }

  void _updateValues(Map<String, Object> values) {
    final newKeys = Set.of(values.keys);
    final oldKeys = Set.of(_values?.keys ?? const <String>[]);
    for (final key in newKeys.difference(oldKeys)) {
      _added.add(key);
    }
    for (final key in oldKeys.difference(newKeys)) {
      _removed.add(key);
    }
    for (final key in newKeys) {
      final oldValue = _values?[key];
      if (oldValue != null && !_valueEquals(oldValue, values[key])) {
        _changed.add(key);
      }
    }
    _values = values;
  }
}
