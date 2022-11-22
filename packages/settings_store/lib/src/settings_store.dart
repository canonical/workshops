import 'package:flutter/foundation.dart';

import 'gsettings_store.dart';

abstract class SettingsStore with ChangeNotifier {
  factory SettingsStore(String schemaId) => GSettingsStore(schemaId);

  Future<void> init();

  Iterable<String> get keys;
  T? get<T>(String key);
  Future<void> set<T>(String key, T value);
  Future<void> unset(String key);
}
