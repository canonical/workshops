import 'package:command_palette/command_palette.dart';
import 'package:flutter/widgets.dart';

import 'command_palette_intents.dart';

abstract class _CommandPaletteAction<T extends Intent>
    extends ContextAction<T> {
  @override
  void invoke(T intent, [BuildContext? context]) {
    if (context != null) {
      invokeCommandPalette(CommandPalette.of(context));
    }
  }

  void invokeCommandPalette(CommandPalette palette);
}

class CommandPaletteOpenAction
    extends _CommandPaletteAction<CommandPaletteOpenIntent> {
  @override
  void invokeCommandPalette(CommandPalette palette) => palette.open();
}

class CommandPaletteCloseAction
    extends _CommandPaletteAction<CommandPaletteCloseIntent> {
  @override
  void invokeCommandPalette(CommandPalette palette) => palette.close();
}
