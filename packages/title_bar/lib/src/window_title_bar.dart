import 'package:flutter/material.dart';
import 'package:window_manager/window_manager.dart';
import 'package:yaru_icons/yaru_icons.dart';
import 'package:yaru_widgets/yaru_widgets.dart';

import 'title_bar_theme.dart';

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

class _TitleBarLayoutState extends State<_TitleBarLayout> with WindowListener {
  var _isClosable = true;
  var _isActive = true;

  @override
  void initState() {
    super.initState();
    _syncWindowState();
    windowManager.addListener(this);
  }

  @override
  void didUpdateWidget(_TitleBarLayout oldWidget) {
    super.didUpdateWidget(oldWidget);
    _syncWindowState();
  }

  @override
  void dispose() {
    windowManager.removeListener(this);
    super.dispose();
  }

  @override
  void onWindowBlur() => setState(() => _isActive = false);

  @override
  void onWindowFocus() => setState(() => _isActive = true);

  Future<void> _syncWindowState() {
    return Future.wait([
      windowManager
          .isClosable()
          .then((value) => setState(() => _isClosable = value)),
      windowManager
          .isFocused()
          .then((value) => setState(() => _isActive = value)),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
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
      child: Theme(
        data: theme.copyWith(
          appBarTheme: theme.appBarTheme.copyWith(
            shape: theme.titleBarBorder(),
          ),
        ),
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
          toolbarHeight: _kTitleBarHeight,
          backgroundColor: theme.titleBarColor(active: _isActive),
          actions: [
            if (_isClosable)
              Padding(
                padding: const EdgeInsets.all(8),
                child: YaruWindowControl(
                  type: YaruWindowControlType.close,
                  onTap: windowManager.close,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
