library window_title_bar;

import 'package:flutter/material.dart';
import 'package:window_manager/window_manager.dart';
import 'package:yaru_icons/yaru_icons.dart';

const _kTitleBarHeight = 46.0;

class WindowTitleBar extends PreferredSize {
  WindowTitleBar({
    super.key,
    this.icon,
    this.title,
    this.centerTitle,
    this.titleSpacing,
  }) : super(
          preferredSize: const Size(0, _kTitleBarHeight),
          child: _TitleBarLayout(
            icon: icon,
            title: title,
            centerTitle: centerTitle,
            titleSpacing: titleSpacing,
          ),
        );

  final Widget? icon;
  final Widget? title;
  final bool? centerTitle;
  final double? titleSpacing;
}

class _TitleBarLayout extends StatefulWidget {
  const _TitleBarLayout({
    this.icon,
    this.title,
    this.centerTitle,
    this.titleSpacing,
  });

  final Widget? icon;
  final Widget? title;
  final bool? centerTitle;
  final double? titleSpacing;

  @override
  State<_TitleBarLayout> createState() => _TitleBarLayoutState();
}

class _TitleBarLayoutState extends State<_TitleBarLayout> {
  var _isClosable = true;

  @override
  void initState() {
    super.initState();
    _syncWindowState();
  }

  @override
  void didUpdateWidget(_TitleBarLayout oldWidget) {
    super.didUpdateWidget(oldWidget);
    _syncWindowState();
  }

  Future<void> _syncWindowState() {
    return windowManager
        .isClosable()
        .then((value) => setState(() => _isClosable = value));
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onPanStart: (details) => windowManager.startDragging(),
      onDoubleTap: () async {
        if (await windowManager.isMaximized()) {
          await windowManager.unmaximize();
        } else {
          await windowManager.maximize();
        }
      },
      onSecondaryTap: windowManager.popUpWindowMenu,
      child: AppBar(
        leading: widget.icon != null
            ? IconTheme(
                data: IconTheme.of(context).copyWith(opacity: 0.8),
                child: widget.icon!,
              )
            : null,
        title: SizedBox(height: _kTitleBarHeight, child: widget.title),
        centerTitle: widget.centerTitle ?? true,
        titleSpacing: widget.titleSpacing,
        backgroundColor: Theme.of(context).brightness == Brightness.light
            ? const Color(0xffebebeb)
            : const Color(0xff222222),
        actions: [
          if (_isClosable)
            _TitleBarButton(
              icon: const Icon(YaruIcons.window_close),
              onPressed: windowManager.close,
            ),
        ],
      ),
    );
  }
}

class _TitleBarButton extends StatelessWidget {
  const _TitleBarButton({
    required this.icon,
    required this.onPressed,
  });

  final Widget icon;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.all(6),
      child: Center(
        child: IconButton(
          icon: icon,
          padding: EdgeInsets.zero,
          iconSize: 16,
          splashRadius: 16,
          onPressed: onPressed,
        ),
      ),
    );
  }
}
