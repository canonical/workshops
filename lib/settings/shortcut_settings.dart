import 'dart:async';

import 'package:collection/collection.dart';
import 'package:dbus/dbus.dart';
import 'package:flutter/widgets.dart';
import 'package:gsettings/gsettings.dart';
import 'package:gtk_accelerator/gtk_accelerator.dart';

abstract class ShortcutSettings extends ChangeNotifier {
  Future<void> init();

  SingleActivator? getShortcut(String id);
  Future<void> setShortcut(String id, SingleActivator? shortcut);
}

class ShortcutGSettings extends ShortcutSettings {
  ShortcutGSettings(this._gsettings);

  final GSettings _gsettings;
  StreamSubscription? _sub;
  final _shortcuts = <String, SingleActivator?>{};

  @override
  Future<void> init() async {
    _sub = _gsettings.keysChanged.listen((keys) {
      var wasRemoved = false;
      for (final key in keys) {
        wasRemoved |= _shortcuts.remove(key) != null;
      }
      if (wasRemoved) notifyListeners();
    });
  }

  @override
  SingleActivator? getShortcut(String id) {
    return _shortcuts[id] ?? _updateShortcut(id);
  }

  @override
  Future<void> setShortcut(String id, SingleActivator? shortcut) async {
    final value = shortcut?.toDbusArray();
    if (value != null) {
      return _gsettings.set(id, value);
    } else {
      return _gsettings.unset(id);
    }
  }

  SingleActivator? _updateShortcut<T>(String id) {
    SingleActivator? shortcut;
    _gsettings.get(id).then((v) {
      shortcut = (v as DBusArray?)?.toShortcut();
      if (_shortcuts[id] != shortcut) {
        _shortcuts[id] = shortcut;
        notifyListeners();
      }
    });
    return shortcut;
  }

  @override
  Future<void> dispose() async {
    await _sub?.cancel();
    await _gsettings.close();
    super.dispose();
  }
}

extension _DBusArrayX on DBusArray {
  SingleActivator? toShortcut() {
    return children
        .map((k) => parseGtkAccelerator(k.asString()))
        .whereNotNull()
        .firstOrNull;
  }
}

extension _SingleActivatorX on SingleActivator {
  DBusArray? toDbusArray() {
    return DBusArray.string([formatGtkAccelerator(this)]);
  }
}
