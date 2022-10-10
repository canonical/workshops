import 'package:flutter/widgets.dart';
import 'package:lxd/lxd.dart';

class TabItem extends ChangeNotifier {
  TabItem([this._instance]);

  LxdInstance? _instance;
  final focusScope = FocusScopeNode();

  LxdInstance? get instance => _instance;
  set instance(LxdInstance? instance) {
    if (_instance == instance) return;
    _instance = instance;
    notifyListeners();
  }

  @override
  void dispose() {
    focusScope.dispose();
    super.dispose();
  }
}
