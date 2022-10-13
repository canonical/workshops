import 'package:accel_key/accel_key.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Future<LogicalKeySet?> showShortcutDialog({
  required BuildContext context,
  required LogicalKeySet? shortcut,
  Widget? title,
  Widget? label,
}) {
  return showDialog(
    context: context,
    builder: (context) => ShortcutDialog(
      shortcut: shortcut,
      title: title,
      label: label,
    ),
  );
}

class ShortcutDialog extends StatefulWidget {
  const ShortcutDialog({
    super.key,
    required this.shortcut,
    this.title,
    this.label,
  });

  final LogicalKeySet? shortcut;
  final Widget? title;
  final Widget? label;

  @override
  State<ShortcutDialog> createState() => _ShortcutDialogState();
}

class _ShortcutDialogState extends State<ShortcutDialog> {
  final _focusNode = FocusNode();
  late LogicalKeySet? _shortcut;

  @override
  void initState() {
    super.initState();
    _shortcut = widget.shortcut;
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CallbackShortcuts(
      bindings: {
        LogicalKeySet(LogicalKeyboardKey.enter): () =>
            Navigator.of(context).pop(_shortcut),
      },
      child: AccelKeyListener(
        autofocus: true,
        focusNode: _focusNode,
        onAccelKey: (value) => setState(() => _shortcut = value),
        child: AlertDialog(
          title: widget.title,
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (widget.label != null) widget.label!,
              const SizedBox(height: 16),
              Center(child: AccelKey(keys: _shortcut?.localize(context) ?? [])),
            ],
          ),
        ),
      ),
    );
  }
}
