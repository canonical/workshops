import 'dart:async';

import 'package:async_value/async_value.dart';
import 'package:lxd/lxd.dart';
import 'package:lxd_service/lxd_service.dart';
import 'package:meta/meta.dart';
import 'package:safe_change_notifier/safe_change_notifier.dart';

typedef InstanceList = AsyncValue<List<String>>;

class InstanceStore extends SafeChangeNotifier {
  InstanceStore(this._service);

  final LxdService _service;
  List<StreamSubscription>? _subs;
  var _instances = const InstanceList.data([]);
  final _values = <String, LxdInstance>{};

  InstanceList get instances => _instances;

  LxdInstance? get(String instance) => _values[instance];

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
      final names = _service.instances ?? [];
      await Future.wait(names.map(_update));
      return names;
    });
  }

  Future<void> _update(String name) async {
    final value = await _service.getInstance(name);
    if (value != _values[name]) {
      _values[name] = value;
      notifyListeners();
    }
  }

  Future<void> _remove(String name) async {
    if (_values.remove(name) != null) {
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
