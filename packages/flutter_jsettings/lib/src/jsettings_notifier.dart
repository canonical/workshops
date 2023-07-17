import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:jsettings/jsettings.dart';

class JSettingsNotifier extends JSettings with ChangeNotifier {
  JSettingsNotifier(super.path);

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
    await _added?.cancel();
    await _changed?.cancel();
    await _removed?.cancel();
    await super.close();
    super.dispose();
  }
}
