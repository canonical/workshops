import 'settings_notifier.dart';

class GlobalSettings extends SettingsNotifier with ReadOnlySettings {
  GlobalSettings(super.path);
}

class UserSettings extends SettingsNotifier with InheritedSettings {
  UserSettings(super.path);
}

class WorkspaceSettings extends SettingsNotifier with InheritedSettings {
  WorkspaceSettings(super.path);
}

mixin ReadOnlySettings on SettingsNotifier {
  @override
  Future<void> setValue(String key, Object value) {
    throw UnsupportedError('Read-only');
  }

  @override
  Future<void> resetValue(String key) {
    throw UnsupportedError('Read-only');
  }
}

mixin InheritedSettings on SettingsNotifier {
  SettingsNotifier? _base;

  @override
  Set<String> getKeys() => Set.of({...super.getKeys(), ...?_base?.getKeys()});

  @override
  bool hasValue(String key) => super.getKeys().contains(key);

  @override
  Object? getValue(String key) => super.getValue(key) ?? _base?.getValue(key);

  @override
  Future<void> init({SettingsNotifier? base}) {
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
