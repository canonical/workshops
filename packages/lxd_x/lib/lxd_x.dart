library lxd_x;

import 'package:lxd/lxd.dart';

extension LxdEventX on LxdEvent {
  bool get isOperation => type == LxdEventType.operation;
  LxdOperation toOperation() {
    return LxdOperation.fromJson(metadata ?? <String, dynamic>{});
  }
}

extension LxdInstanceX on LxdInstance {
  bool get isStarted => statusCode == LxdStatusCode.started.value;
  bool get isRunning => statusCode == LxdStatusCode.running.value;
  bool get isStopped => statusCode == LxdStatusCode.stopped.value;
}

extension LxdNetworkAddressX on LxdNetworkAddress {
  bool get isIPv4 => family == 'inet' && !isLinkLocal;
  bool get isIPv6 => family == 'inet6' && !isLinkLocal;
  bool get isLinkLocal => scope == 'link' || scope == 'local';
}

extension LxdNetworkStateX on LxdNetworkState {
  bool get isLoopback => type == 'loopback';

  List<LxdNetworkAddress> get ipv4s {
    return addresses.where((address) => address.isIPv4).toList();
  }

  List<LxdNetworkAddress> get ipv6s {
    return addresses.where((address) => address.isIPv6).toList();
  }
}

extension LxdOperationX on LxdOperation {
  List<String>? get instances => (resources?['instances'] as List?)
      ?.cast<String>()
      .map((path) => path.split('/').last)
      .toList();
}
