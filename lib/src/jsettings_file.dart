import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:path/path.dart' as p;
import 'package:watcher/watcher.dart';

class JSettingsFile {
  JSettingsFile(this.path);

  final String path;

  DateTime? _timestamp;
  StreamSubscription? _watcher;

  Future<void> init() async {
    final dir = Directory(p.dirname(path));
    if (!dir.existsSync()) {
      dir.createSync(recursive: true);
    }
  }

  Map<String, Object>? read() {
    final file = File(path);
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
    final file = File(path);
    if (!file.existsSync()) {
      file.createSync(recursive: true);
    }
    final str = jsonEncode(json);
    return file.writeAsString(str);
  }

  Future<void> watch(void Function() onChanged) async {
    _watcher ??= DirectoryWatcher(p.dirname(path)).events.listen((event) {
      if (!p.equals(path, event.path)) {
        return;
      }
      switch (event.type) {
        case ChangeType.ADD:
        case ChangeType.REMOVE:
          onChanged();
          break;
        case ChangeType.MODIFY:
          if (_timestamp == null ||
              File(path).lastModifiedSync().isAfter(_timestamp!)) {
            onChanged();
          }
          break;
      }
    });
  }

  Future<void> unwatch() async => _watcher?.cancel();
}
