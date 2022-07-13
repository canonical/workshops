import 'dart:async';

import 'package:async_value/async_value.dart';
import 'package:lxd/lxd.dart';
import 'package:lxd_service/lxd_service.dart';
import 'package:meta/meta.dart';
import 'package:safe_change_notifier/safe_change_notifier.dart';

typedef OperationValue = AsyncValue<LxdOperation?>;

class OperationModel extends SafeChangeNotifier {
  OperationModel(this._id, this._service);

  final String _id;
  final LxdService _service;
  StreamSubscription? _sub;
  var _operation = const OperationValue.data(null);

  OperationValue get operation => _operation;

  @protected
  set operation(OperationValue operation) {
    if (_operation == operation) return;
    _operation = operation;
    notifyListeners();
  }

  Future<void> init() async {
    operation = const OperationValue.loading().copyWithPrevious(operation);

    operation = await OperationValue.guard(() {
      return _service.getOperation(_id);
    });

    _sub = _service
        .getOperations(_id)
        .listen((event) => operation = OperationValue.data(event));
  }

  Future<void> cancel() => _service.cancelOperation(_id);

  @override
  void dispose() {
    _sub?.cancel();
    super.dispose();
  }
}
