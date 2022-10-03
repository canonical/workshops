import 'dart:async';

import 'package:async_value/async_value.dart';
import 'package:lxd_service/lxd_service.dart';
import 'package:meta/meta.dart';
import 'package:safe_change_notifier/safe_change_notifier.dart';

typedef InstanceList = AsyncValue<List<String>>;

class InstanceStore extends SafeChangeNotifier {
  InstanceStore(this._service);

  final LxdService _service;
  StreamSubscription? _sub;
  var _instances = const InstanceList.data([]);

  InstanceList get instances => _instances;

  @protected
  set instances(InstanceList instances) {
    if (_instances == instances) return;
    _instances = instances;
    notifyListeners();
  }

  Future<void> init() async {
    _sub ??= _service.instanceStream.listen((value) {
      instances = InstanceList.data(value);
    });

    instances = const InstanceList.loading().copyWithPrevious(instances);

    instances = await InstanceList.guard(() async {
      await _service.init();
      return _service.instances ?? [];
    });
  }

  @override
  void dispose() {
    _sub?.cancel();
    super.dispose();
  }
}
