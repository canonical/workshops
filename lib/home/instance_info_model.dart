import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:lxd/lxd.dart';
import 'package:lxd_service/lxd_service.dart';
import 'package:safe_change_notifier/safe_change_notifier.dart';
import 'package:ubuntu_service/ubuntu_service.dart';

class InstanceInfoModel extends SafeChangeNotifier {
  InstanceInfoModel(
      {required this.instanceName, @visibleForTesting LxdService? service})
      : _service = service ?? getService<LxdService>();
  final String instanceName;

  final LxdService _service;
  late LxdInstanceState _instanceState;
  late final LxdInstance _instance;
  Timer? _timer;
  final Duration _updateInterval = const Duration(seconds: 1);

  LxdInstance get instance => _instance;
  LxdInstanceState get instanceState => _instanceState;

  Future<void> init() async {
    _instance = await _service.getInstance(instanceName);
    await _updateInstanceState();
    _timer = Timer.periodic(
      _updateInterval,
      (_) => _updateInstanceState(),
    );
  }

  Future<void> _updateInstanceState() async {
    _instanceState = await _service.getInstanceState(instanceName);
    notifyListeners();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}
