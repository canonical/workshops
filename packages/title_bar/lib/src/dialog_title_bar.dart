import 'package:flutter/material.dart';
import 'package:window_manager/window_manager.dart';
import 'package:yaru_widgets/yaru_widgets.dart';

import 'title_bar_theme.dart';

class DialogTitleBar extends StatelessWidget {
  const DialogTitleBar({super.key, this.title, this.leading, this.trailing});

  final Widget? title;
  final Widget? leading;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return GestureDetector(
      onPanStart: (_) => windowManager.startDragging(),
      onSecondaryTap: windowManager.popUpWindowMenu,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: theme.titleBarColor(),
        ),
        child: Theme(
          data: theme.copyWith(
            appBarTheme: theme.appBarTheme.copyWith(
              shape: const Border(),
              titleSpacing: leading != null ? 8 : 24,
            ),
          ),
          child: YaruTitleBar(
            title: title,
            centerTitle: false,
            leading: leading != null
                ? Padding(
                    padding: const EdgeInsetsDirectional.only(start: 16),
                    child: Center(child: leading!),
                  )
                : null,
            actions: [
              Padding(
                padding: const EdgeInsets.all(8),
                child: trailing ??
                    YaruWindowControl(
                      type: YaruWindowControlType.close,
                      onTap: () => Navigator.maybePop(context),
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
