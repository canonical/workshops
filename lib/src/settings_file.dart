import 'dart:async';
import 'dart:convert';

import 'package:file/file.dart';
import 'package:path/path.dart' as path;
import 'package:watcher/watcher.dart';

class JSettingsFile {
  JSettingsFile(this._path, this._fs);

  final String _path;
  final FileSystem _fs;

  DateTime? _timestamp;
  StreamSubscription? _watcher;

  Future<void> init() async {
    final dir = _fs.directory(path.dirname(_path));
    if (!dir.existsSync()) {
      dir.createSync(recursive: true);
    }
  }

  Map<String, Object>? read() {
    final file = _fs.file(_path);
    try {
      if (file.existsSync()) {
        final str = file.readAsStringSync();
        if (str.isNotEmpty) {
          final dynamic json = jsonDecode(str);
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

  Future<void> write(Map<String, Object> json) {
    final file = _fs.file(_path);
    if (!file.existsSync()) {
      file.createSync(recursive: true);
    }
    final str = jsonEncode(json);
    return file.writeAsString(str);
  }

  Future<void> watch(void Function() onChanged) async {
    _watcher ??= DirectoryWatcher(path.dirname(_path)).events.listen((event) {
      if (!path.equals(_path, event.path)) {
        return;
      }
      switch (event.type) {
        case ChangeType.ADD:
        case ChangeType.REMOVE:
          onChanged();
          break;
        case ChangeType.MODIFY:
          if (_timestamp == null ||
              _fs.file(_path).lastModifiedSync().isAfter(_timestamp!)) {
            onChanged();
          }
          break;
      }
    });
  }

  Future<void> unwatch() async => _watcher?.cancel();
}
