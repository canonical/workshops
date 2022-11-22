import 'package:flutter/material.dart';
import 'package:window_manager/window_manager.dart';
import 'package:yaru_widgets/yaru_widgets.dart';

class DialogTitleBar extends StatelessWidget {
  const DialogTitleBar({super.key, this.title, this.leading, this.trailing});

  final Widget? title;
  final Widget? leading;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanStart: (_) => windowManager.startDragging(),
      child: Theme(
        data: Theme.of(context).copyWith(
          appBarTheme: AppBarTheme(
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
          trailing: trailing,
        ),
      ),
    );
  }
}
