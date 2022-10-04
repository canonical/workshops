import 'package:context_menu/context_menu.dart';
import 'package:flutter/material.dart';
import 'package:lxd/lxd.dart';
import 'package:lxd_service/lxd_service.dart';
import 'package:lxd_x/lxd_x.dart';
import 'package:provider/provider.dart';
import 'package:terminal_view/terminal_view.dart';
import 'package:ubuntu_service/ubuntu_service.dart';

import '../tabs/tab_menu.dart';
import '../tabs/tab_model.dart';
import 'terminal_model.dart';
import 'terminal_settings.dart';

class TerminalPage extends StatelessWidget {
  const TerminalPage({super.key, required this.instance, required this.onExit});

  final LxdInstance instance;
  final VoidCallback onExit;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => TerminalModel(getService<LxdService>()),
      child: _TerminalPage(
        instance: instance,
        onExit: onExit,
      ),
    );
  }
}

class _TerminalPage extends StatefulWidget {
  const _TerminalPage({required this.instance, required this.onExit});

  final LxdInstance instance;
  final VoidCallback onExit;

  @override
  State<_TerminalPage> createState() => _TerminalPageState();
}

class _TerminalPageState extends State<_TerminalPage> {
  @override
  void initState() {
    super.initState();

    final model = context.read<TerminalModel>();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await model.execute(widget.instance);
      if (mounted) widget.onExit();
    });
  }

  @override
  Widget build(BuildContext context) {
    final model = context.watch<TerminalModel>();
    final tabs = context.read<TabModel>();
    return Stack(
      children: [
        TerminalTheme(
          data: getTerminalTheme(widget.instance.os),
          child: TerminalView(
            terminal: model.terminal,
            controller: model.terminal.controller,
            onContextMenu: (position) {
              showContextMenu(
                context: context,
                position: position,
                items: buildContextMenu(
                  context: context,
                  terminal: model.terminal,
                  tabCount: tabs.length,
                  onAddTab: tabs.addTab,
                  onCloseTab: tabs.closeTab,
                ),
              );
            },
          ),
        ),
        if (tabs.length == 1)
          Positioned.directional(
            textDirection: Directionality.of(context),
            top: 8,
            end: 0,
            child: Material(
              color: Colors.transparent,
              child: IconButton(
                icon: const Icon(Icons.add),
                color: Colors.white,
                splashRadius: 16,
                iconSize: 16,
                onPressed: tabs.addTab,
              ),
            ),
          ),
        if (model.state == TerminalState.starting)
          const Center(child: CircularProgressIndicator())
      ],
    );
  }
}
