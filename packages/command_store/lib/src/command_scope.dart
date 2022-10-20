import 'package:collection/collection.dart';
import 'package:flutter/widgets.dart';

import 'command.dart';
import 'command_store.dart';

class CommandScope extends StatefulWidget {
  const CommandScope({super.key, required this.commands, required this.child});

  final List<Command> commands;
  final Widget child;

  @override
  State<CommandScope> createState() => _CommandScopeState();
}

class _CommandScopeState extends State<CommandScope> {
  late CommandStoreState _store;

  void _addCommands(List<Command> commands) {
    for (final command in commands) {
      _store.add(command);
    }
  }

  void _removeCommands(List<Command> commands) {
    for (final command in commands) {
      _store.remove(command);
    }
  }

  @override
  void initState() {
    super.initState();
    _store = CommandStore.of(context);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _addCommands(widget.commands);
    });
  }

  @override
  void didUpdateWidget(covariant CommandScope oldWidget) {
    super.didUpdateWidget(oldWidget);

    final listEquals = const ListEquality<Command>().equals;
    if (!listEquals(widget.commands, oldWidget.commands)) {
      _removeCommands(oldWidget.commands);
      _addCommands(widget.commands);
    }
  }

  @override
  void dispose() {
    super.dispose();
    _removeCommands(widget.commands);
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
