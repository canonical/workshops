import 'dart:async';

import 'package:collection/collection.dart';
import 'package:dbus/dbus.dart';
import 'package:flutter/widgets.dart';
import 'package:gsettings/gsettings.dart';
import 'package:gtk_accelerator/gtk_accelerator.dart';

import 'shortcut_settings.dart';

class ShortcutGSettings extends ShortcutSettings {
  ShortcutGSettings(this._gsettings);

  final GSettings _gsettings;
  StreamSubscription? _sub;
  final _shortcuts = <String, List<SingleActivator>>{};

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
  List<SingleActivator> getShortcuts(String id) {
    return _shortcuts[id] ?? _updateShortcuts(id);
  }

  @override
  Future<void> addShortcut(String id, SingleActivator shortcut) async {
    final shortcuts = await _fetchShortcuts(id);
    shortcuts.add(shortcut);
    return setShortcuts(id, shortcuts);
  }

  @override
  Future<void> removeShortcut(String id, SingleActivator shortcut) async {
    final shortcuts = await _fetchShortcuts(id);
    shortcuts.removeWhere((s) => s.equals(shortcut));
    return setShortcuts(id, shortcuts);
  }

  @override
  Future<void> setShortcuts(String id, List<SingleActivator> shortcuts) async {
    return _gsettings.set(id, shortcuts.toDbusArray());
  }

  @override
  Future<void> removeShortcuts(String id) => _gsettings.unset(id);

  Future<List<SingleActivator>> _fetchShortcuts(String id) async {
    final value = await _gsettings.get(id) as DBusArray;
    return value.toSingleActivators();
  }

  List<SingleActivator> _updateShortcuts<T>(String id) {
    _fetchShortcuts(id).then((value) {
      if (!_SingleActivatorEquality.listEquals(_shortcuts[id], value)) {
        _shortcuts[id] = value;
        notifyListeners();
      }
    });
    return <SingleActivator>[];
  }

  @override
  Future<void> dispose() async {
    await _sub?.cancel();
    await _gsettings.close();
    super.dispose();
  }
}

extension _DBusArrayX on DBusArray {
  List<SingleActivator> toSingleActivators() {
    return children
        .map((k) => parseGtkAccelerator(k.asString()))
        .whereNotNull()
        .toList();
  }
}

extension _SingleActivatorListX on List<SingleActivator> {
  DBusArray toDbusArray() {
    return DBusArray.string(map(formatGtkAccelerator).toList());
  }
}

extension _SingleActivatorX on SingleActivator {
  bool equals(SingleActivator other) {
    return other.trigger == trigger &&
        other.alt == alt &&
        other.control == control &&
        other.meta == meta &&
        other.shift == shift;
  }
}

class _SingleActivatorEquality implements Equality<SingleActivator> {
  const _SingleActivatorEquality();

  static final listEquals =
      const ListEquality<SingleActivator>(_SingleActivatorEquality()).equals;

  @override
  bool isValidKey(Object? o) => o is SingleActivator;

  @override
  bool equals(SingleActivator e1, SingleActivator e2) {
    return identical(e1, e2) || e1.equals(e2);
  }

  @override
  int hash(SingleActivator e) {
    return Object.hash(e.trigger, e.alt, e.control, e.meta, e.shift);
  }
}
