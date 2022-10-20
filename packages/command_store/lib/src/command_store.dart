import 'package:collection/collection.dart';
import 'package:flutter/widgets.dart';

import 'command.dart';
import 'shortcut_settings.dart';

class CommandStore extends StatefulWidget {
  const CommandStore({super.key, required this.child, required this.shortcuts});

  final Widget child;
  final ShortcutSettings shortcuts;

  static List<Command> commandsOf(BuildContext context) {
    final store =
        context.dependOnInheritedWidgetOfExactType<_InheritedCommandStore>();
    assert(store != null, 'CommandStore not found in context');
    return store!.commands;
  }

  static Map<ShortcutActivator, Intent> shortcutsOf(BuildContext context) {
    final commands = CommandStore.commandsOf(context);
    return Map.fromEntries([
      for (final command in commands)
        for (final shortcut in command.shortcuts ?? const <LogicalKeySet>[])
          MapEntry(shortcut, command.intent),
    ]);
  }

  static CommandStoreState of(BuildContext context) {
    final state = context.findAncestorStateOfType<CommandStoreState>();
    assert(state != null, 'CommandStore not found in context');
    return state!;
  }

  @override
  State<CommandStore> createState() => CommandStoreState();
}

class CommandStoreState extends State<CommandStore> {
  var _commands = <Command>[];
  final _refs = <String, int>{};

  List<Command> get commands => _commands;

  void add(Command command) {
    final ref = _refs.update(command.id, (value) => ++value, ifAbsent: () => 1);
    if (ref == 1) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        setState(() => _commands = List.of(_commands)..add(command));
      });
    }
  }

  void remove(Command command) {
    final ref = _refs.update(command.id, (value) => --value, ifAbsent: () => 0);
    if (ref == 0) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        setState(() => _commands = List.of(_commands)..remove(command));
      });
    }
  }

  @override
  void initState() {
    widget.shortcuts.load();
    super.initState();
  }

  @override
  void dispose() {
    widget.shortcuts.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: widget.shortcuts,
      builder: (context, child) {
        return _InheritedCommandStore(
          commands: _commands
              .map((c) => c.copyWith(shortcuts: widget.shortcuts.get(c.id)))
              .toList(),
          child: child!,
        );
      },
      child: widget.child,
    );
  }
}

class _InheritedCommandStore extends InheritedWidget {
  const _InheritedCommandStore({required super.child, required this.commands});

  final List<Command> commands;

  @override
  bool updateShouldNotify(covariant _InheritedCommandStore oldWidget) {
    final listEquals = const ListEquality().equals;
    return !listEquals(commands, oldWidget.commands);
  }
}
