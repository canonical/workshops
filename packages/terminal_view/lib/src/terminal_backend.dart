import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:ui';

import 'package:lxd/lxd.dart';
import 'package:xterm/xterm.dart';

class LxdTerminalBackend implements TerminalBackend {
  LxdTerminalBackend({
    required this.client,
    required this.instance,
    this.command,
    this.onExit,
  });

  final LxdClient client;
  final String instance;
  final String? command;
  final VoidCallback? onExit;

  final _exitCode = Completer<int>();
  final _out = StreamController<String>();

  WebSocket? _ws0;
  WebSocket? _wsc;

  @override
  Stream<String> get out => _out.stream;

  @override
  Future<int> get exitCode => _exitCode.future;

  @override
  void init() => execute(instance);

  @override
  void resize(int width, int height, int pixelWidth, int pixelHeight) {
    _wsc?.sendTermSize(width, height);
  }

  @override
  void write(String input) => _ws0?.add(utf8.encode(input));

  @override
  void ackProcessed() {}

  @override
  void terminate() {
    _ws0?.close();
    _wsc = null;
    _wsc?.close();
    _wsc = null;
  }

  Future<void> execute(String name) async {
    final op = await client.execInstance(
      name,
      command: [command ?? Platform.environment['SHELL'] ?? '/bin/bash'],
      environment: {
        'TERM': 'xterm-256color',
        'HOME': Platform.environment['SNAP_REAL_HOME'] ??
            Platform.environment['HOME'] ??
            '/root',
        'USER': Platform.environment['USER'] ?? 'root',
        'USERNAME': Platform.environment['USERNAME'] ?? 'root',
      },
      // TODO: map IDs
      group: 1000,
      user: 1000,
      interactive: true,
      waitForWebSocket: true,
    );

    final control = op.metadata!['fds']['control'] as String;
    _wsc = await client.getOperationWebSocket(op.id, control);

    final fd0 = op.metadata!['fds']['0'] as String;
    _ws0 = await client.getOperationWebSocket(op.id, fd0);
    _ws0!.listen(_receiveData);
  }

  void _receiveData(dynamic data) {
    if (data is List<int>) {
      _out.sink.add(utf8.decode(data));
    } else if (data is String) {
      if (data.isEmpty) {
        // TODO: proper way to detect exit
        onExit?.call();
      } else {
        _out.sink.add('$data\r\n');
      }
    } else {
      throw UnsupportedError('$data');
    }
  }
}
