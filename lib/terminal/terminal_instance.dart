import 'package:lxd/lxd.dart';
import 'package:lxd_terminal/lxd_terminal.dart';
import 'package:terminal_view/terminal_view.dart';

class TerminalInstance extends Terminal with LxdTerminal, TerminalMixin {
  TerminalInstance({
    required this.client,
    required this.controller,
    required super.maxLines,
  });

  @override
  final LxdClient client;

  @override
  final TerminalController controller;
}
