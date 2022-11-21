import 'package:flutter/foundation.dart';

import 'settings_notifier.dart';

class UserSettings extends SettingsNotifier {
  UserSettings(super.path);
}

class WorkspaceSettings extends SettingsNotifier {
  WorkspaceSettings(super.path, {SettingsNotifier? base}) : _base = base;

  SettingsNotifier? _base;

  @override
  Set<String> getKeys() => Set.of({...super.getKeys(), ...?_base?.getKeys()});

  @override
  bool hasValue(String key) {
    print('hasKey($key) ${getKeys()} ${describeIdentity(this)}');
    return super.getKeys().contains(key);
  }

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
