import 'dart:io';

import 'package:path/path.dart' as p;
import 'package:xdg_directories/xdg_directories.dart' as xdg;

class PathProvider {
  String getBundleFile(String name) => p.join(getBundleDirectory(), name);
  String getConfigFile(String name) => p.join(getConfigDirectory(), name);

  String? _bundleDirectory;
  String getBundleDirectory() => _bundleDirectory ??= _resolveBundleDirectory();

  String? _configDirectory;
  String getConfigDirectory() => _configDirectory ??= _resolveConfigDirectory();

  String _resolveBundleDirectory() => p.join(
      p.dirname(Platform.resolvedExecutable),
      'data',
      'flutter_assets',
      'assets');

  String _resolveConfigDirectory() =>
      p.join(xdg.configHome.path, p.basename(Platform.resolvedExecutable));
}
