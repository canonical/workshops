import 'package:flutter/services.dart';
import 'package:xterm/xterm.dart';

mixin TerminalMixin on Terminal {
  TerminalController get controller;

  String? get selectedText => controller.selection != null
      ? buffer.getText(controller.selection)
      : null;

  Future<void> copy() async {
    final data = ClipboardData(text: selectedText);
    return Clipboard.setData(data);
  }

  @override
  Future<void> paste([String? text]) async {
    text ??= await Clipboard.getData(Clipboard.kTextPlain)
        .then((data) => data?.text);
    super.paste(text ?? '');
  }

  void selectAll() {
    controller.setSelection(
      BufferRangeLine(
        CellOffset(0, buffer.height - viewHeight),
        CellOffset(viewWidth, buffer.height - 1),
      ),
    );
  }
}
