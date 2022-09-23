import 'package:flutter/material.dart';
import 'package:lxd_x/lxd_x.dart';
import 'package:provider/provider.dart';
import 'package:terminal_view/terminal_view.dart';

import 'terminal_controller.dart';
import 'terminal_progress.dart';
import 'terminal_settings.dart';

class TerminalPage extends StatelessWidget {
  const TerminalPage({super.key, required this.controller, this.onContextMenu});

  final TerminalController controller;
  final void Function(Offset position)? onContextMenu;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: controller,
      child: _TerminalPage(onContextMenu: onContextMenu),
    );
  }
}

class _TerminalPage extends StatelessWidget {
  const _TerminalPage({this.onContextMenu});

  final void Function(Offset position)? onContextMenu;

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
      running: (instance, terminal) => TerminalTheme(
        data: getTerminalTheme(instance.os),
        child: TerminalView(
          terminal: terminal,
          controller: terminal.controller,
          onContextMenu: onContextMenu,
        ),
      ),
      stop: (_, __) => TerminalProgress.create(context, controller.state),
      error: (error) => Text('TODO: $error'),
    );
  }
}
