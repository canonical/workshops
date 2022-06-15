import 'package:flutter/material.dart';

typedef OnMovedCallback = void Function(int from, int to);

class MovableTabBar extends StatelessWidget implements PreferredSizeWidget {
  MovableTabBar({
    super.key,
    required this.count,
    required this.builder,
    required this.onMoved,
    double? preferredHeight,
    this.leading,
    this.trailing,
  }) : preferredSize = Size.fromHeight(preferredHeight ?? kToolbarHeight);

  final int count;
  final IndexedWidgetBuilder builder;
  final OnMovedCallback onMoved;
  final Widget? leading;
  final Widget? trailing;

  @override
  final Size preferredSize;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Theme.of(context).dividerColor),
        ),
      ),
      child: Row(
        children: [
          if (leading != null) leading!,
          Expanded(
            child: _ReorderableTabBar(
              count: count,
              builder: builder,
              onMoved: onMoved,
            ),
          ),
          if (trailing != null) trailing!,
        ],
      ),
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
        itemCount: count,
        itemBuilder: (context, index) {
          final isLast = index >= count - 1;
          return ReorderableDragStartListener(
            key: ValueKey(index),
            index: index,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  width: constraints.maxWidth / count - (!isLast ? 1 : 0),
                  child: builder(context, index),
                ),
                if (!isLast) const VerticalDivider(width: 1),
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
