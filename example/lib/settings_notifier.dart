import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:jsettings/jsettings.dart';

class SettingsNotifier extends JSettings with ChangeNotifier {
  SettingsNotifier(super.path);

  StreamSubscription? _added;
  StreamSubscription? _changed;
  StreamSubscription? _removed;

  @override
  Future<void> init() {
    return super.init().then((_) {
      _added ??= added.listen((_) => notifyListeners());
      _changed ??= changed.listen((_) => notifyListeners());
      _removed ??= removed.listen((_) => notifyListeners());
    });
  }

  @override
  Future<void> dispose() async {
    await Future.wait([
      if (_added != null) _added!.cancel(),
      if (_changed != null) _changed!.cancel(),
      if (_removed != null) _removed!.cancel(),
      close(),
    ]);
    super.dispose();
  }
}

mixin ReadOnlySettings on SettingsNotifier {
  @override
  Future<void> setValue(String key, Object? value) {
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
