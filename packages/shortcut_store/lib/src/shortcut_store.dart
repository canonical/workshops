import 'package:flutter/widgets.dart';

import 'shortcut_settings.dart';

class ShortcutStore extends StatefulWidget {
  const ShortcutStore({super.key, required this.child, required this.settings});

  final Widget child;
  final ShortcutSettings settings;

  static ShortcutSettings of(BuildContext context) {
    final store =
        context.dependOnInheritedWidgetOfExactType<_InheritedShortcutStore>();
    return store!.settings;
  }

  @override
  State<ShortcutStore> createState() => _ShortcutStoreState();
}

class _ShortcutStoreState extends State<ShortcutStore> {
  @override
  void initState() {
    widget.settings.init();
    super.initState();
  }

  @override
  void dispose() {
    widget.settings.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _InheritedShortcutStore(
      settings: widget.settings,
      child: widget.child,
    );
  }
}

class _InheritedShortcutStore extends InheritedNotifier<ShortcutSettings> {
  const _InheritedShortcutStore({
    required super.child,
    required ShortcutSettings settings,
  }) : super(notifier: settings);

  ShortcutSettings get settings => notifier!;
}
