import 'package:collection/collection.dart';
import 'package:safe_change_notifier/safe_change_notifier.dart';

import 'config_schema.dart';

class ConfigEditorModel extends SafeChangeNotifier {
  ConfigEditorModel({
    required Map<String, String> config,
    required this.configSchema,
    required this.onSaved,
  }) : _config = Map.from(config);
  final Map<String, String> _config;
  final Map<String, ConfigSchemaEntry> configSchema;
  Future<void> Function(Map<String, String> config) onSaved;

  UnmodifiableMapView<String, String> get config =>
      UnmodifiableMapView(_config);

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
