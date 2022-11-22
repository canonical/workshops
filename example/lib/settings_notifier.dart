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
      notifyListeners();
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
