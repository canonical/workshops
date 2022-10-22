import 'package:flutter/material.dart';
import 'package:lxd/lxd.dart';
import 'package:lxd_service/lxd_service.dart';
import 'package:lxd_x/lxd_x.dart';
import 'package:nested_split_view/nested_split_view.dart';
import 'package:provider/provider.dart';
import 'package:terminal_view/terminal_view.dart';
import 'package:ubuntu_service/ubuntu_service.dart';

import '../tabs/tab_intents.dart';
import 'terminal_commands.dart';
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
      child: _TerminalPage(
        instance: instance,
        onExit: onExit,
      ),
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

class _TerminalPageState extends State<_TerminalPage>
    with AutomaticKeepAliveClientMixin {
  final _splitter = NestedSplitController();

  @override
  bool get wantKeepAlive => true;

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
    _splitter.dispose();
    super.dispose();
  }

  Widget _buildPane(BuildContext context, NestedSplitNode node) {
    return OrientationBuilder(builder: (context, orientation) {
      final manager = context.watch<TerminalManager>();
      final terminal = manager.get(node, widget.instance);
      return ChangeNotifierProvider.value(
        value: terminal,
        child: TerminalPane(
          onSplit: (direction) {
            switch (direction) {
              case SplitDirection.auto:
                _splitter.split(node, orientation.toAxisDirection(context));
                break;
              case SplitDirection.up:
                _splitter.split(node, AxisDirection.up);
                break;
              case SplitDirection.down:
                _splitter.split(node, AxisDirection.down);
                break;
              case SplitDirection.left:
                _splitter.split(node, AxisDirection.left);
                break;
              case SplitDirection.right:
                _splitter.split(node, AxisDirection.right);
                break;
            }
          },
          onUnsplit: _splitter.length > 1 ? terminal.close : null,
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Stack(
      children: [
        TerminalCommands(
          child: TerminalTheme(
            data: getTerminalTheme(widget.instance.os),
            child: NestedSplitView(
              controller: _splitter,
              builder: _buildPane,
            ),
          ),
        ),
        if (Actions.find<NewTabIntent>(context).isActionEnabled)
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
                onPressed: () => Actions.invoke(context, const NewTabIntent()),
              ),
            ),
          ),
      ],
    );
  }
}

extension OrientationX on Orientation {
  AxisDirection toAxisDirection(BuildContext context) {
    switch (this) {
      case Orientation.portrait:
        return AxisDirection.down;
      case Orientation.landscape:
        if (Directionality.of(context) == TextDirection.ltr) {
          return AxisDirection.right;
        } else {
          return AxisDirection.left;
        }
    }
  }
}
