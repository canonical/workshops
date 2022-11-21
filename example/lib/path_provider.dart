import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

class PathProvider extends ChangeNotifier {
  String _bundlePath = '';
  String _configPath = '';

  String getBundle(String name) => p.join(_bundlePath, '$name.json');
  String getConfig(String name) => p.join(_configPath, '$name.json');

  Future<void> init() async {
    final exePath = p.dirname(Platform.resolvedExecutable);
    _bundlePath = p.join(exePath, 'data', 'flutter_assets', 'assets');

    return getApplicationSupportDirectory().then((dir) {
      _configPath = dir.path;
      notifyListeners();
    });
  }
}
