import 'settings_store.dart';

mixin ReadOnlySettings on SettingsStore {
  @override
  Future<void> setValue(String key, Object? value) {
    throw UnsupportedError('Read-only');
  }

  @override
  Future<void> resetValue(String key) {
    throw UnsupportedError('Read-only');
  }
}

mixin InheritedSettings on SettingsStore {
  SettingsStore? _base;

  @override
  Set<String> getKeys() => Set.of({...super.getKeys(), ...?_base?.getKeys()});

  @override
  bool hasValue(String key) => super.getKeys().contains(key);

  @override
  Object? getValue(String key) => super.getValue(key) ?? _base?.getValue(key);

  @override
  Future<void> init({SettingsStore? base}) {
    if (_base != base) {
      _base?.removeListener(notifyListeners);
      base?.addListener(notifyListeners);
      _base = base;
    }
    return super.init();
  }

  @override
  Future<void> dispose() {
    _base?.removeListener(notifyListeners);
    return super.dispose();
  }
}
