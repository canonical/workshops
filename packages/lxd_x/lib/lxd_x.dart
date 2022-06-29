library lxd_x;

import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:collection/collection.dart';
import 'package:lxd/lxd.dart';

String resolveLxdSocketPath([String? socketPath]) {
  final lxdDir = Platform.environment['LXD_DIR'];
  final paths = [
    if (socketPath != null) socketPath,
    if (lxdDir != null) '$lxdDir/unix.socket',
    '/var/snap/lxd/common/lxd/unix.socket',
  ];
  return paths.firstWhereOrNull((path) => File(path).existsSync()) ??
      '/var/lib/lxd/unix.socket';
}

extension LxdClientX on LxdClient {
  Future<String> runCommand(String instance, List<String> command) async {
    final exec = await execInstance(
      instance,
      command: command,
      interactive: true,
      waitForWebSocket: true,
    );

    final fdc = exec.metadata!['fds']['control'] as String;
    final wsc = await getOperationWebSocket(exec.id, fdc);

    final fd0 = exec.metadata!['fds']['0'] as String;
    final ws0 = await getOperationWebSocket(exec.id, fd0);

    final controller = StreamController<String>();
    ws0.listen((data) {
      if (data is List<int>) {
        controller.add(utf8.decode(data));
      } else if (data == '') {
        ws0.close();
        wsc.close();
        controller.close();
      }
    });

    await waitOperation(exec.id);
    return controller.stream.join().then((value) => value.trim());
  }
}

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
  List<String>? get instances =>
      resources?['instances']?.map((path) => path.split('/').last).toList();
}
