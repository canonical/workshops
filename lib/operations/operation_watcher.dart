import 'dart:async';

import 'package:async_value/async_value.dart';
import 'package:lxd/lxd.dart';
import 'package:lxd_service/lxd_service.dart';
import 'package:meta/meta.dart';
import 'package:safe_change_notifier/safe_change_notifier.dart';

typedef OperationValue = AsyncValue<LxdOperation?>;

class OperationWatcher extends SafeChangeNotifier {
  OperationWatcher(this._id, this._service);

  final String _id;
  final LxdService _service;
  StreamSubscription? _sub;
  var _operation = const OperationValue.data(null);

  String get id => _id;
  OperationValue get operation => _operation;

  @protected
  set operation(OperationValue operation) {
    if (_operation == operation) return;
    _operation = operation;
    notifyListeners();
  }

  Future<void> init() async {
    operation = await load();
    _sub = watch();
  }

  Future<OperationValue> load() {
    operation = const OperationValue.loading().copyWithPrevious(operation);
    return OperationValue.guard(() => _service.getOperation(_id));
  }

  StreamSubscription<LxdOperation> watch() {
    return _service
        .watchOperation(_id)
        .listen((event) => operation = OperationValue.data(event));
  }

  Future<void> cancel() => _service.cancelOperation(_id);

  @override
  void dispose() {
    _sub?.cancel();
    super.dispose();
  }
}

class InstanceWatcher extends OperationWatcher {
  InstanceWatcher(super.name, super.service);

  @override
  Future<OperationValue> load() async {
    return const OperationValue.loading().copyWithPrevious(operation);
  }

  @override
  StreamSubscription<LxdOperation> watch() {
    return _service
        .watchInstance(id)
        .listen((event) => operation = OperationValue.data(event));
  }
}
