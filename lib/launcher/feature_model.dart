import 'dart:io';

import 'package:lxd/lxd.dart';
import 'package:lxd_service/lxd_service.dart';
import 'package:lxd_x/lxd_x.dart';
import 'package:safe_change_notifier/safe_change_notifier.dart';

class FeatureModel extends SafeChangeNotifier {
  FeatureModel(this._image);

  final LxdImage _image;

  LxdImageType get type => _image.type;

  bool hasFeature(LxdFeature feature) => _features.contains(feature);
  bool hasFeatures(Set<LxdFeature> features) => _features.containsAll(features);
  var _features = <LxdFeature>{};
  void setFeature(LxdFeature feature, bool value) {
    if (value) {
      _features.add(feature);
    } else {
      _features.remove(feature);
    }
    notifyListeners();
  }

  String? get home =>
      Platform.environment['SNAP_REAL_HOME'] ?? Platform.environment['HOME'];
  String? get user =>
      Platform.environment['USERNAME'] ?? Platform.environment['USER'];

  Future<void> init() async {
    final features =
        Set.of(LxdFeature.values.where((f) => f.isSupported(type)));
    if (_features != features) {
      _features = features;
      notifyListeners();
    }
  }

  LxdImage save() {
    final user = hasFeature(LxdFeature.user) ? this.user : null;
    final home =
        hasFeatures({LxdFeature.user, LxdFeature.home}) ? this.home : null;

    return _image.copyWith(
      properties: {
        ..._image.properties,
        'user.features': _features.map((f) => f.name).join(','),
        'user.name': user ?? 'root',
        'user.shell': Platform.environment['SHELL'] ?? '',
        'user.home': home ?? '/root',
        'user.gpu': 'physical',
        'user.x11': Platform.environment['DISPLAY'] ?? ':0',
        'user.wayland': Platform.environment['WAYLAND_DISPLAY'] ?? 'wayland-0',
        'user.lxd': resolveLxdSocketPath(),
      },
    );
  }
}
