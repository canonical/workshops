import 'package:flutter/services.dart';
import 'package:xterm/xterm.dart';

mixin TerminalMixin {
  Terminal get terminal;
  TerminalController get controller;

  String? get selectedText => controller.selection != null
      ? terminal.buffer.getText(controller.selection)
      : null;

  bool get canCopy => selectedText?.isNotEmpty == true;

  Future<void> copy() async {
    final data = ClipboardData(text: selectedText!);
    return Clipboard.setData(data);
  }

  Future<void> paste() async {
    final text = await Clipboard.getData(Clipboard.kTextPlain)
        .then((data) => data?.text);
    terminal.paste(text ?? '');
  }

  void selectAll() {
    controller.setSelection(
      BufferRangeLine(
        CellOffset(0, terminal.buffer.height - terminal.viewHeight),
        CellOffset(terminal.viewWidth, terminal.buffer.height - 1),
      ),
    );
  }
}
