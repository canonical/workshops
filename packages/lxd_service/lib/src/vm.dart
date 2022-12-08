import 'dart:async';

import 'package:lxd/lxd.dart';

mixin LxdVmService on LxdClient {
  /// Waits for the VM agent to be ready, which is a pre-requisite for executing
  /// commands on the VM. The VM agent is up and running when the instance state
  /// reports that there are any running processes.
  Future<bool> waitVmAgent(
    LxdInstanceId id, {
    Duration? timeout,
    Duration? interval,
  }) async {
    interval ??= const Duration(seconds: 1);
    var future = Future.doWhile(() async {
      final state = await getInstanceState(id);
      if (state.processes > 0) return false;
      return Future.delayed(interval!, () => true);
    });
    if (timeout != null) {
      future = future.timeout(timeout, onTimeout: () => false);
    }
    final result = await future;
    return result is bool ? result : true;
  }
}
