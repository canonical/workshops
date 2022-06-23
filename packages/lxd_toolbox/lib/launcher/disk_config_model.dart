import 'dart:convert';
import 'dart:io';

import 'package:lxd/lxd.dart';
import 'package:lxd_service/lxd_service.dart';
import 'package:safe_change_notifier/safe_change_notifier.dart';

class DiskConfigModel extends SafeChangeNotifier {
  DiskConfigModel(this._image);

  final LxdImage _image;
  var _disks = <String, LxdDiskConfig>{};

  bool hasDisk(String name) => _disks.containsKey(name);
  List<String> get disks => _disks.keys.toList();
  LxdDiskConfig getDisk(String name) => _disks[name]!;

  void load() {
    final devices = _image.properties['devices'] as Map<String, dynamic>? ?? {};
    final entries = {
      for (final entry in devices.entries)
        entry.key: LxdDeviceConfig.fromJson(entry.value as Map<String, dynamic>)
    };
    entries.removeWhere((key, value) => value is! LxdDiskConfig);
    _disks = entries.cast<String, LxdDiskConfig>();
    if (_disks.isEmpty) {
      // TODO: resolve SNAP_REAL_HOME vs. HOME in one place
      final home = Platform.environment['SNAP_REAL_HOME'] ??
          Platform.environment['HOME'];
      if (home != null) {
        _disks['home'] = LxdDiskConfig(path: home, source: home);
      }
    }
  }

  void addDisk(String name, LxdDiskConfig disk) {
    _disks[name] = disk;
    notifyListeners();
  }

  void removeDisk(String name) {
    _disks.remove(name);
    notifyListeners();
  }

  LxdImage save() {
    final devices = _image.properties['devices'] as Map<String, dynamic>? ?? {};
    for (final entry in _disks.entries) {
      devices.putIfAbsent(entry.key, entry.value.toJson);
    }
    return _image.copyWith(properties: {
      ..._image.properties,
      'devices': jsonEncode(devices),
    });
  }
}
