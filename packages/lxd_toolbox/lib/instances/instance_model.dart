import 'dart:async';

import 'package:async_value/async_value.dart';
import 'package:lxd/lxd.dart';
import 'package:lxd_service/lxd_service.dart';
import 'package:meta/meta.dart';
import 'package:safe_change_notifier/safe_change_notifier.dart';

typedef InstanceList = AsyncValue<List<String>>;
typedef InstanceValue = AsyncValue<LxdInstance?>;

class InstanceModel extends SafeChangeNotifier {
  InstanceModel(this._service);

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

  InstanceState createState(String name) => InstanceState(name, _service);
}

class InstanceState extends SafeChangeNotifier {
  InstanceState(this._name, this._service);

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
      instance =
          await InstanceList.guard(() => _service.client.getInstance(name));
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
}
