import 'package:collection/collection.dart';
import 'package:safe_change_notifier/safe_change_notifier.dart';

import 'config_schema.dart';

class ConfigEditorModel extends SafeChangeNotifier {
  ConfigEditorModel({
    required Map<String, String> config,
    required Map<String, ConfigSchemaEntry> configSchema,
    required this.onSaved,
  })  : _config = Map.from(config),
        _configSchema = configSchema;
  final Map<String, String> _config;
  final Map<String, ConfigSchemaEntry> _configSchema;
  Future<void> Function(Map<String, String> config) onSaved;

  UnmodifiableMapView<String, String> get config =>
      UnmodifiableMapView(_config);

  UnmodifiableListView<String> get keys {
    final parsedKeys = <String>[];
    for (final schemaKey in _configSchema.keys) {
      if (schemaKey.endsWith('*')) {
        for (final configKey in config.keys) {
          if (_matchesSchema(configKey, schemaKey)) {
            parsedKeys.add(configKey);
          }
        }
      } else {
        parsedKeys.add(schemaKey);
      }
    }
    return UnmodifiableListView(parsedKeys);
  }

  UnmodifiableListView<String> get wildcardKeys =>
      UnmodifiableListView(_configSchema.keys.where((k) => k.contains('*')));

  ConfigSchemaEntry getSchemaEntry(String key) {
    if (_configSchema.keys.contains(key)) {
      return _configSchema[key]!;
    }
    for (final wildcardKey in wildcardKeys) {
      if (_matchesSchema(key, wildcardKey)) {
        return _configSchema[wildcardKey]!;
      }
    }
    throw Exception('Invalid key: $key');
  }

  bool _matchesSchema(String key, String schemaKey) =>
      key.startsWith(schemaKey.substring(0, schemaKey.length - 1));

  void addOption(String key, String value) {
    if (_config.keys.contains(key)) return;
    _config[key] = value;
    notifyListeners();
  }

  void updateValue(String key, String value) {
    if (_config[key] == value) return;
    _config[key] = value;
    notifyListeners();
  }

  void resetValue(String key) {
    _config.remove(key);
    notifyListeners();
  }

  Future<void> save() => onSaved(config);
}
