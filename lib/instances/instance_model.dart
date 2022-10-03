import 'dart:async';

import 'package:async_value/async_value.dart';
import 'package:lxd/lxd.dart';
import 'package:lxd_service/lxd_service.dart';
import 'package:meta/meta.dart';
import 'package:safe_change_notifier/safe_change_notifier.dart';

typedef InstanceValue = AsyncValue<LxdInstance?>;

class InstanceModel extends SafeChangeNotifier {
  InstanceModel(this._name, this._service);

  final String _name;
  final LxdService _service;
  StreamSubscription? _sub;
  var _instance = const InstanceValue.data(null);

  InstanceValue get instance => _instance;

  @protected
  set instance(InstanceValue instance) {
    if (_instance == instance) return;
    _instance = instance;
    notifyListeners();
  }

  Future<void> init() async {
    Future<void> fetch(String name) async {
      instance = const InstanceValue.loading().copyWithPrevious(instance);
      instance = await InstanceValue.guard(() => _service.getInstance(name));
    }

    _sub ??= _service.instanceUpdated
        .where((instance) => instance == _name)
        .listen(fetch);

    return fetch(_name);
  }

  @override
  void dispose() {
    _sub?.cancel();
    super.dispose();
  }

  Future<void> stop() => _service.stopInstance(_name);

  Future<void> delete() => _service.deleteInstance(_name);
}
