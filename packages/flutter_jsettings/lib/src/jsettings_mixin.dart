import 'jsettings_notifier.dart';

mixin JSettingsReadOnlyMixin on JSettingsNotifier {
  @override
  Future<void> setValue(String key, Object? value) {
    throw UnsupportedError('Read-only');
  }

  @override
  Future<void> resetValue(String key) {
    throw UnsupportedError('Read-only');
  }
}

mixin JSettingsInheritedMixin on JSettingsNotifier {
  JSettingsNotifier? _base;

  void inherit(JSettingsNotifier? base) {
    if (_base == base) return;
    _base?.removeListener(notifyListeners);
    base?.addListener(notifyListeners);
    _base = base;
  }

  @override
  Set<String> getKeys() => Set.of({...super.getKeys(), ...?_base?.getKeys()});

  @override
  bool hasValue(String key) => super.getKeys().contains(key);

  @override
  Object? getValue(String key) => super.getValue(key) ?? _base?.getValue(key);

  @override
  Future<void> dispose() {
    _base?.removeListener(notifyListeners);
    return super.dispose();
  }
}
