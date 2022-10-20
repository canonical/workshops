import 'package:flutter/widgets.dart';

import 'shortcut_settings.dart';

class CommandStore extends StatefulWidget {
  const CommandStore({super.key, required this.child, required this.shortcuts});

  final Widget child;
  final ShortcutSettings shortcuts;

  static ShortcutSettings shortcutsOf(BuildContext context) {
    final store =
        context.dependOnInheritedWidgetOfExactType<_InheritedCommandStore>();
    assert(store != null, 'CommandStore not found in context');
    return store!.shortcuts;
  }

  @override
  State<CommandStore> createState() => _CommandStoreState();
}

class _CommandStoreState extends State<CommandStore> {
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
    return _InheritedCommandStore(
      shortcuts: widget.shortcuts,
      child: widget.child,
    );
  }
}

class _InheritedCommandStore extends InheritedNotifier<ShortcutSettings> {
  const _InheritedCommandStore({
    required super.child,
    required ShortcutSettings shortcuts,
  }) : super(notifier: shortcuts);

  ShortcutSettings get shortcuts => notifier!;
}
