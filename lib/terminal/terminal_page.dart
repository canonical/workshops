import 'package:flutter/material.dart';
import 'package:lxd/lxd.dart';
import 'package:lxd_service/lxd_service.dart';
import 'package:lxd_x/lxd_x.dart';
import 'package:nested_split_view/nested_split_view.dart';
import 'package:provider/provider.dart';
import 'package:terminal_view/terminal_view.dart';
import 'package:ubuntu_service/ubuntu_service.dart';

import '../tabs/tab_model.dart';
import 'terminal_manager.dart';
import 'terminal_pane.dart';
import 'terminal_settings.dart';

class TerminalPage extends StatelessWidget {
  const TerminalPage({super.key, required this.instance, required this.onExit});

  final LxdInstance instance;
  final VoidCallback onExit;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => TerminalManager(getService<LxdService>()),
      child: _TerminalPage(instance: instance, onExit: onExit),
    );
  }
}

class _TerminalPage extends StatefulWidget {
  const _TerminalPage({
    required this.instance,
    required this.onExit,
  });

  final LxdInstance instance;
  final VoidCallback onExit;

  @override
  State<_TerminalPage> createState() => _TerminalPageState();
}

class _TerminalPageState extends State<_TerminalPage> {
  final _splitter = NestedSplitController();

  @override
  void initState() {
    super.initState();

    final manager = context.read<TerminalManager>();
    manager.listen(
      onCreate: (key, terminal) {
        terminal.focusNode.requestFocus();
      },
      onClose: (key, terminal) {
        final node = key as NestedSplitNode;
        if (_splitter.length > 1) {
          _splitter.unsplit(node);
        } else {
          widget.onExit();
        }
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    _splitter.dispose();
  }

  Widget _buildPane(BuildContext context, NestedSplitNode node) {
    return OrientationBuilder(builder: (context, orientation) {
      final manager = context.watch<TerminalManager>();
      final terminal = manager.get(node, widget.instance);
      return ChangeNotifierProvider.value(
        value: terminal,
        child: TerminalPane(
          onSplit: () => _splitter.split(node, orientation.toAxis()),
          onUnsplit: _splitter.length > 1 ? terminal.close : null,
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final tabs = context.read<TabModel>();
    return FocusScope(
      child: Stack(
        children: [
          TerminalTheme(
            data: getTerminalTheme(widget.instance.os),
            child: NestedSplitView(
              controller: _splitter,
              builder: _buildPane,
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
        ],
      ),
    );
  }
}

extension OrientationX on Orientation {
  Axis toAxis() {
    switch (this) {
      case Orientation.portrait:
        return Axis.vertical;
      case Orientation.landscape:
        return Axis.horizontal;
    }
  }
}
