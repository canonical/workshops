import 'dart:async';
import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:file/file.dart';
import 'package:file/local.dart';
import 'package:meta/meta.dart';
import 'package:path/path.dart' as path;
import 'package:watcher/watcher.dart';

class JSettings {
  JSettings(this._path, {@visibleForTesting FileSystem? fs})
      : _fs = fs ?? const LocalFileSystem();

  final String _path;
  final FileSystem _fs;
  bool? _invalid;
  DateTime? _timestamp;
  StreamSubscription? _watcher;
  Map<String, Object>? _values;
  final _added = StreamController<String>.broadcast();
  final _changed = StreamController<String>.broadcast();
  final _removed = StreamController<String>.broadcast();
  final _valueEquals = const DeepCollectionEquality().equals;

  Stream<String> get added => _added.stream;
  Stream<String> get changed => _changed.stream;
  Stream<String> get removed => _removed.stream;

  Future<void> init() async {
    final dir = _fs.directory(path.dirname(_path));
    if (!dir.existsSync()) {
      dir.createSync(recursive: true);
    }
    _watcher ??= _watchFile();
  }

  Future<void> close() {
    return Future.wait([
      if (_watcher != null) _watcher!.cancel(),
      _added.close(),
      _changed.close(),
      _removed.close(),
    ]);
  }

  Set<String> getKeys() => Set.of(getValues().keys);
  bool hasKey(String key) => getKeys().contains(key);
  Map<String, Object> getValues() => Map.of(_values ??= _readFile() ?? {});

  Object? getValue(String key) => getValues()[key];
  Future<void> setValue(String key, Object value) {
    final values = getValues();
    values[key] = value;
    return _writeFile(values);
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

  Future<void> reset(String key) async {
    final values = getValues();
    if (values.remove(key) != null) {
      return _writeFile(values);
    }
  }

  void _invalidateValues() {
    if (_invalid == true) return;
    _invalid = true;
    scheduleMicrotask(() {
      final values = _readFile();
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

  Map<String, Object>? _readFile() {
    final file = _fs.file(_path);
    try {
      if (file.existsSync()) {
        final str = file.readAsStringSync();
        if (str.isNotEmpty) {
          final json = jsonDecode(str);
          if (json is Map) {
            _timestamp = file.lastModifiedSync();
            return json.cast<String, Object>();
          }
        }
      }
    } on FormatException {
      return null;
    }
    return {};
  }

  Future<void> _writeFile(Map<String, Object> json) {
    final file = _fs.file(_path);
    if (!file.existsSync()) {
      file.createSync(recursive: true);
    }
    final str = jsonEncode(json);
    return file.writeAsString(str);
  }

  StreamSubscription _watchFile() {
    final watcher = DirectoryWatcher(path.dirname(_path));
    return watcher.events.listen((event) {
      if (!path.equals(_path, event.path)) {
        return;
      }
      switch (event.type) {
        case ChangeType.ADD:
        case ChangeType.REMOVE:
          _invalidateValues();
          break;
        case ChangeType.MODIFY:
          if (_timestamp == null ||
              _fs.file(_path).lastModifiedSync().isAfter(_timestamp!)) {
            _invalidateValues();
          }
          break;
      }
    });
  }
}
