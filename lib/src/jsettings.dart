import 'dart:async';

import 'package:collection/collection.dart';

import 'jsettings_file.dart';

class JSettings {
  JSettings(String path) : _file = JSettingsFile(path);

  final JSettingsFile _file;
  bool? _invalid;
  Map<String, Object>? _values;
  final _added = StreamController<String>.broadcast();
  final _changed = StreamController<String>.broadcast();
  final _removed = StreamController<String>.broadcast();

  Stream<String> get added => _added.stream;
  Stream<String> get changed => _changed.stream;
  Stream<String> get removed => _removed.stream;

  Future<void> init() {
    return _file.init().then((_) => _file.watch(_invalidateValues));
  }

  Future<void> close() {
    return Future.wait<void>([
      _file.unwatch(),
      _added.close(),
      _changed.close(),
      _removed.close(),
    ]);
  }

  Set<String> getKeys() => Set.unmodifiable(_getValues().keys);

  bool hasValue(String key) => _getValues().containsKey(key);

  bool valueEquals(Object? a, Object? b) {
    return const DeepCollectionEquality().equals(a, b);
  }

  Map<String, Object> getValues() => Map.unmodifiable(_getValues());
  Map<String, Object> _getValues() => _values ??= _file.read() ?? {};

  Object? getValue(String key) => _getValues()[key];

  bool? getBool(String key) => getValue(key) as bool?;
  int? getInt(String key) => getValue(key) as int?;
  double? getDouble(String key) => getValue(key) as double?;
  String? getString(String key) => getValue(key) as String?;
  List? getList(String key) => getValue(key) as List?;
  Map? getMap(String key) => getValue(key) as Map?;

  Future<void> setValue(String key, Object value) {
    final values = Map.of(_getValues());
    values[key] = value;
    return _file.write(values);
  }

  Future<void> resetValue(String key) async {
    final values = Map.of(_getValues());
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
      if (oldValue != null && !valueEquals(oldValue, values[key])) {
        _changed.add(key);
      }
    }
    _values = values;
  }
}
