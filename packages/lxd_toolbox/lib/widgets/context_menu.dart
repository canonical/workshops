import 'package:flutter/material.dart';

class ContextMenuArea extends StatelessWidget {
  const ContextMenuArea({
    super.key,
    this.builder,
    this.child,
  });

  final Widget? child;
  final List<PopupMenuEntry> Function(BuildContext context, Offset position)?
      builder;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onSecondaryTapDown: (details) {
        final items = builder?.call(context, details.globalPosition);
        if (items != null) {
          showContextMenu(
            context: context,
            position: details.globalPosition,
            items: items,
          );
        }
      },
      child: child,
    );
  }
}

Future showContextMenu({
  required BuildContext context,
  required Offset position,
  required List<PopupMenuEntry> items,
}) {
  return showMenu(
    context: context,
    position: RelativeRect.fromSize(
      position & Size.zero,
      MediaQuery.of(context).size,
    ),
    items: items,
  );
}
