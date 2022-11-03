import 'dart:math' as math;

import 'package:flutter/material.dart';

typedef OnMovedCallback = void Function(int from, int to);

class MovableTabBar extends StatelessWidget {
  const MovableTabBar({
    super.key,
    required this.count,
    required this.builder,
    required this.onMoved,
    this.leading,
    this.trailing,
  });

  final int count;
  final IndexedWidgetBuilder builder;
  final OnMovedCallback onMoved;
  final Widget? leading;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (leading != null)
          Padding(
            padding: const EdgeInsets.all(4),
            child: leading!,
          ),
        Flexible(
          child: _ReorderableTabBar(
            count: count,
            builder: builder,
            onMoved: onMoved,
          ),
        ),
        if (trailing != null)
          Padding(
            padding: const EdgeInsets.all(4),
            child: trailing!,
          ),
      ],
    );
  }
}

class _ReorderableTabBar extends StatelessWidget {
  const _ReorderableTabBar({
    required this.count,
    required this.builder,
    required this.onMoved,
  });

  final int count;
  final IndexedWidgetBuilder builder;
  final OnMovedCallback onMoved;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return ReorderableListView.builder(
        shrinkWrap: true,
        itemCount: count,
        itemBuilder: (context, index) {
          return ReorderableDragStartListener(
            key: ValueKey(index),
            index: index,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  width: math.min(240, constraints.maxWidth / count - 1),
                  child: builder(context, index),
                ),
                const VerticalDivider(width: 1),
              ],
            ),
          );
        },
        buildDefaultDragHandles: false,
        onReorder: (from, to) {
          final newIndex = to > from ? to - 1 : to;
          onMoved.call(from, newIndex);
        },
        physics: const NeverScrollableScrollPhysics(),
        scrollDirection: Axis.horizontal,
      );
    });
  }
}
