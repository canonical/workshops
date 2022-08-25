import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:terminal_view/terminal_view.dart';

import 'terminal_controller.dart';
import 'terminal_progress.dart';
import 'terminal_settings.dart';

class TerminalPage extends StatelessWidget {
  const TerminalPage({super.key});

  static Widget create(BuildContext context, TerminalController controller) {
    return ChangeNotifierProvider.value(
      value: controller,
      child: const TerminalPage(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<TerminalController>();
    return controller.state.when(
      none: () => const SizedBox.shrink(),
      create: (_, __) => TerminalProgress.create(context, controller.state),
      init: (_, __) => TerminalProgress.create(context, controller.state),
      config: (_, __) => TerminalProgress.create(context, controller.state),
      stage: (_, __) => TerminalProgress.create(context, controller.state),
      start: (_, __) => TerminalProgress.create(context, controller.state),
      restart: (_, __) => TerminalProgress.create(context, controller.state),
      running: (name, terminal) => TerminalTheme(
        data: terminalTheme,
        child: TerminalView(terminal: terminal),
      ),
      stop: (_, __) => TerminalProgress.create(context, controller.state),
      error: (error) => Text('TODO: $error'),
    );
  }
}
