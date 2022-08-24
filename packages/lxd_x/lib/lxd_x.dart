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
  Future<void> mkdir(String instance, String path) async {
    final op = await execInstance(instance, command: ['mkdir', '-p', path]);
    await waitOperation(op.id);
  }

  Future<int> uid(String instance, String username) async {
    final id = await _exec(instance, ['id', '-u', username]);
    return int.parse(id);
  }

  Future<int> gid(String instance, String username) async {
    final id = await _exec(instance, ['id', '-g', username]);
    return int.parse(id);
  }

  Future<String> _exec(String instance, List<String> command) async {
    final exec = await execInstance(
      instance,
      command: command,
      waitForWebSocket: true,
    );

    Future<WebSocket> getWebSocket(String id) {
      final fd = exec.metadata!['fds'][id] as String;
      return getOperationWebSocket(exec.id, fd);
    }

    final webSockets = [
      await getWebSocket('0'),
      await getWebSocket('1'),
      await getWebSocket('2'),
      await getWebSocket('control'),
    ];

    final out = <String>[];
    final sub = webSockets[1].listen((data) {
      if (data is List<int>) {
        out.add(utf8.decode(data).trim());
      }
    });

    await waitOperation(exec.id);
    await sub.cancel();
    await Future.wait(webSockets.map((ws) => ws.close()));
    return out.join();
  }
}

extension LxdEventX on LxdEvent {
  bool get isOperation => type == LxdEventType.operation;
  LxdOperation toOperation() {
    return LxdOperation.fromJson(metadata ?? <String, dynamic>{});
  }
}

extension LxdInstanceX on LxdInstance {
  bool get isBusy => isStarting || isStopping;
  bool get isStarting => statusCode == LxdStatusCode.starting.value;
  bool get isStarted => statusCode == LxdStatusCode.started.value;
  bool get isRunning => statusCode == LxdStatusCode.running.value;
  bool get isStopping => statusCode == LxdStatusCode.stopping.value;
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

  bool get isRunning => statusCode == LxdStatusCode.running.value;
  bool get isPending => statusCode == LxdStatusCode.pending.value;
}
