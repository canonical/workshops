library lxc_config;

import 'dart:io';

import 'package:meta/meta.dart';
import 'package:path/path.dart' as p;
import 'package:yaml/yaml.dart';

class LxcRemote {
  const LxcRemote(this._data);
  final YamlMap _data;
  String? get address => _data['addr'] as String?;
  String? get protocol => _data['protocol'] as String?;
  bool? get isPublic => _data['public'] as bool?;
}

class LxcConfig {
  const LxcConfig([this._data]);
  final YamlMap? _data;
  String? get defaultRemote => _data?['default-remote'] as String?;
  Map<String, LxcRemote>? get remotes {
    final remotes = _data?['remotes'] as YamlMap?;
    if (remotes == null) return null;
    return remotes
        .map((k, v) => MapEntry(k as String, LxcRemote(v as YamlMap)));
  }
}

Future<LxcConfig> loadLxcConfig([String? path]) async {
  try {
    final file = File(path ?? await locateLxcConfig() ?? '');
    final content = await file.readAsString();
    final yaml = loadYaml(content) as YamlMap;
    return LxcConfig(yaml);
  } on FileSystemException catch (_) {
    return const LxcConfig();
  } on YamlException catch (_) {
    return const LxcConfig();
  }
}

Future<String?> locateLxcConfig({
  @visibleForTesting Map<String, String>? environment,
}) async {
  final env = environment ?? Platform.environment;
  final dirs = [
    env['LXD_CONF'],
    p.join(env['HOME']!, 'snap', 'lxd', 'common', 'config'),
    p.join(env['HOME']!, '.config', 'lxc'),
  ].whereType<String>();
  for (final dir in dirs) {
    final file = File(p.join(dir, 'config.yml'));
    if (await file.exists()) return file.path;
  }
  return null;
}
