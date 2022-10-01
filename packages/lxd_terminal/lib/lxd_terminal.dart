library lxd_terminal;

import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:lxd/lxd.dart';
import 'package:xterm/xterm.dart';

mixin LxdTerminal on Terminal {
  LxdClient get client;

  WebSocket? _ws0;
  WebSocket? _wsc;
  StreamSubscription? _sub;

  Future<void> close() async {
    await _sub?.cancel();
    await _ws0?.close();
    await _wsc?.close();
  }

  Future<void> execute(LxdInstance instance) async {
    final user = instance.config['user.name'] ?? 'root';
    final op = await client.execInstance(
      instance.name,
      command: ['login', '-f', user],
      environment: {'TERM': 'xterm-256color'},
      interactive: true,
      waitForWebSocket: true,
    );

    Future<WebSocket> getWebSocket(String id) {
      final fd = op.metadata!['fds'][id] as String;
      return client.getOperationWebSocket(op.id, fd);
    }

    _wsc = await getWebSocket('control');
    onResize = (width, height, _, __) => _wsc?.sendTermSize(width, height);
    _wsc!.sendTermSize(viewWidth, viewHeight);

    _ws0 = await getWebSocket('0');
    onOutput = (data) => _ws0?.add(utf8.encode(data));

    _sub = _ws0!.listen((data) async {
      if (data is List<int>) {
        write(utf8.decode(data));
      } else if (data is String) {
        if (data.isEmpty) {
          // TODO: proper way to detect exit
          await close();
        } else {
          write('$data\r\n');
        }
      } else {
        throw UnsupportedError('$data');
      }
    });

    await client.waitOperation(op.id);
  }
}
