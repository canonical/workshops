import 'dart:async';

import 'package:async_value/async_value.dart';
import 'package:lxd/lxd.dart';
import 'package:lxd_service/lxd_service.dart';
import 'package:meta/meta.dart';
import 'package:safe_change_notifier/safe_change_notifier.dart';

typedef InstanceList = AsyncValue<List<LxdInstanceId>>;

class InstanceStore extends SafeChangeNotifier {
  InstanceStore(this._service);

  final LxdService _service;
  List<StreamSubscription>? _subs;
  var _instances = const InstanceList.data([]);
  final _values = <LxdInstanceId, LxdInstance>{};

  InstanceList get instances => _instances;

  LxdInstance? getInstance(LxdInstanceId id) => _values[id];

  @protected
  set instances(InstanceList instances) {
    if (_instances == instances) return;
    _instances = instances;
    notifyListeners();
  }

  Future<void> init() async {
    _subs ??= [
      _service.instanceAdded.listen(_update),
      _service.instanceUpdated.listen(_update),
      _service.instanceRemoved.listen(_remove),
      _service.instanceStream
          .listen((value) => instances = InstanceList.data(value)),
    ];

    instances = const InstanceList.loading().copyWithPrevious(instances);

    instances = await InstanceList.guard(() async {
      final ids = _service.instances ?? [];
      await Future.wait(ids.map(_update));
      return ids;
    });
  }

  Future<void> updateConfig(
      LxdInstanceId id, Map<String, String> config) async {
    final operation = await _service.updateInstanceConfig(id, config);
    final result = await _service.waitOperation(operation.id);
    if (result.statusCode != 200) {
      throw Exception(result.error);
    }
  }

  Future<void> _update(LxdInstanceId id) async {
    final value = await _service.getInstance(id);
    if (value != _values[id]) {
      _values[id] = value;
      notifyListeners();
    }
  }

  Future<void> _remove(LxdInstanceId id) async {
    if (_values.remove(id) != null) {
      notifyListeners();
    }
  }

  @override
  Future<void> dispose() async {
    for (final sub in _subs ?? []) {
      await sub.cancel();
    }
    _subs = null;
    super.dispose();
  }
}
