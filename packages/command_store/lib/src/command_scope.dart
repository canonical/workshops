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
  final _focusNode = FocusNode();

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

  void _updateCommands() {
    if (_focusNode.hasFocus) {
      _addCommands(widget.commands);
    } else {
      _removeCommands(widget.commands);
    }
  }

  @override
  void initState() {
    super.initState();
    _store = CommandStore.of(context);
    _focusNode.addListener(_updateCommands);
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
    _focusNode.removeListener(_updateCommands);
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Focus(
      focusNode: _focusNode,
      child: widget.child,
    );
  }
}
