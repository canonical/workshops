import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:lxd/lxd.dart';
import 'package:meta/meta.dart';

mixin LxdTerminalService on LxdClient {
  Future<LxdTerminal> execTerminal(LxdInstanceId id) async {
    final instance = await getInstance(id);
    final user = instance.config['user.workshops.name'] ??
        instance.config['user.name'] ??
        'root';
    final op = await execInstance(
      instance.id,
      command: ['login', '-f', user],
      environment: {'TERM': 'xterm-256color'},
      interactive: true,
      waitForWebSocket: true,
    );

    Future<WebSocket> getWebSocket(String id) {
      final fd = op.metadata!['fds'][id] as String;
      return getOperationWebSocket(op.id, fd);
    }

    final wsc = await getWebSocket('control');
    final ws0 = await getWebSocket('0');
    return LxdTerminal(op, wsc, ws0);
  }
}

class LxdTerminal {
  @visibleForTesting
  LxdTerminal(this._op, this._wsc, this._ws0);

  final LxdOperation _op;
  WebSocket? _ws0;
  WebSocket? _wsc;
  StreamSubscription? _sub;

  String get id => _op.id;
  LxdOperation get operation => _op;

  void write(String data) => _ws0?.add(utf8.encode(data));

  void listen(void Function(String data) onData) {
    _sub = _ws0!.listen((data) async {
      if (data is List<int>) {
        onData(utf8.decode(data));
      } else if (data is String) {
        if (data.isEmpty) {
          // TODO: proper way to detect exit
          await close();
        } else {
          onData('$data\r\n');
        }
      } else {
        throw UnsupportedError('$data');
      }
    });
  }

  void resize(int width, int height) => _wsc?.sendTermSize(width, height);

  Future<void> close() async {
    await _sub?.cancel();
    await _ws0?.close();
    await _wsc?.close();
    _sub = null;
    _ws0 = null;
    _wsc = null;
  }
}
