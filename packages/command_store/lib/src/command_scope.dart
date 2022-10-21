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

  void _onFocusChange(bool hasFocus) {
    if (hasFocus) {
      _addCommands(widget.commands);
    } else {
      _removeCommands(widget.commands);
    }
  }

  @override
  void initState() {
    super.initState();
    _store = CommandStore.of(context);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _store = CommandStore.of(context);
  }

  @override
  void didUpdateWidget(covariant CommandScope oldWidget) {
    super.didUpdateWidget(oldWidget);

    final listEquals = const ListEquality<Command>().equals;
    if (!listEquals(widget.commands, oldWidget.commands)) {
      _addCommands(widget.commands);
      _removeCommands(oldWidget.commands);
    }
  }

  @override
  void dispose() {
    _removeCommands(widget.commands);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Focus(
      canRequestFocus: false,
      onFocusChange: _onFocusChange,
      child: widget.child,
    );
  }
}
