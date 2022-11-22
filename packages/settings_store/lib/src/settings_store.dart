import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:jsettings/jsettings.dart';

class SettingsStore extends ChangeNotifier {
  SettingsStore(String path) : _jsettings = JSettings(path);
  SettingsStore.of(this._jsettings);

  final JSettings _jsettings;

  StreamSubscription? _added;
  StreamSubscription? _changed;
  StreamSubscription? _removed;

  Future<void> init() {
    return _jsettings.init().then((_) {
      _added ??= _jsettings.added.listen((_) => notifyListeners());
      _changed ??= _jsettings.changed.listen((_) => notifyListeners());
      _removed ??= _jsettings.removed.listen((_) => notifyListeners());
    });
  }

  @override
  Future<void> dispose() async {
    await _added?.cancel();
    await _changed?.cancel();
    await _removed?.cancel();
    await _jsettings.close();
    super.dispose();
  }

  Set<String> getKeys() => _jsettings.getKeys();
  bool hasValue(String key) => _jsettings.hasValue(key);
  Object? getValue(String key) => _jsettings.getValue(key);

  Future<void> setValue(String key, Object? value) {
    return _jsettings.setValue(key, value);
  }

  Future<void> resetValue(String key) {
    return _jsettings.resetValue(key);
  }
}
