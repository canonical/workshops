import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:terminal_view/terminal_view.dart';

import '../operations/operation_view.dart';
import 'terminal_controller.dart';
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
      create: (op) => OperationView.create(context, op.id),
      config: (name) => OperationView.config(context, name),
      start: (op) => OperationView.start(context, op.id),
      restart: (op) => OperationView.restart(context, op.id),
      running: (terminal) => TerminalTheme(
        data: terminalTheme,
        child: TerminalView(terminal: terminal),
      ),
      error: (error) => Text('TODO: $error'),
    );
  }
}
