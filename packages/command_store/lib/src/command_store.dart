import 'package:collection/collection.dart';
import 'package:flutter/widgets.dart';

import 'command.dart';
import 'shortcut_store.dart';

class CommandStore extends StatefulWidget {
  const CommandStore({super.key, required this.child, required this.shortcuts});

  final Widget child;
  final ShortcutStore shortcuts;

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
        if (command.intent != null)
          for (final shortcut in command.shortcuts ?? const <LogicalKeySet>[])
            MapEntry(shortcut, command.intent!),
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
  final _mru = <String, int>{};

  List<Command> get commands => _commands;

  void add(Command command) {
    final ref = _refs.update(command.id, (value) => ++value, ifAbsent: () => 1);
    if (ref == 1) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted) {
          setState(() {
            _commands = List.of(_commands)..add(command);
            _sort();
          });
        }
      });
    }
  }

  void remove(Command command) {
    final ref = _refs.update(command.id, (value) => --value, ifAbsent: () => 0);
    if (ref == 0) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted) {
          setState(() {
            _commands = List.of(_commands)
              ..removeWhere((c) => c.id == command.id);
          });
        }
      });
    }
  }

  void execute(Command command) {
    setState(() {
      _mru[command.id] = (_mru[command.id] ?? 0) + 1;
      _sort();
    });

    void dispatchIntent() {
      final primaryContext = primaryFocus!.context;
      if (primaryContext != null && command.intent != null) {
        Actions.maybeInvoke(primaryContext, command.intent!);
      }
      FocusManager.instance.removeListener(dispatchIntent);
    }

    FocusManager.instance.addListener(dispatchIntent);
  }

  void _sort() {
    _commands.sort((c1, c2) {
      final i1 = _mru[c1.id];
      final i2 = _mru[c2.id];
      if (i1 != null && i2 != null) {
        return i2.compareTo(i1);
      } else if (i1 != null) {
        return -1;
      } else if (i2 != null) {
        return 1;
      } else {
        return c2.priority.compareTo(c1.priority);
      }
    });
  }

  @override
  void initState() {
    super.initState();
    widget.shortcuts.init();
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
          commands: commands
              .map((c) =>
                  c.copyWith(shortcuts: widget.shortcuts.getShortcuts(c.id)))
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
