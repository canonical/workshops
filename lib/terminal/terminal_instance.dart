import 'package:terminal_view/terminal_view.dart';

class TerminalInstance extends Terminal with TerminalMixin {
  TerminalInstance({
    required this.controller,
    required super.maxLines,
  });

  @override
  final TerminalController controller;
}
