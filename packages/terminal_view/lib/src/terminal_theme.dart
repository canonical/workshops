import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

class TerminalTheme extends InheritedTheme {
  const TerminalTheme({
    super.key,
    required this.data,
    required super.child,
  });

  final TerminalThemeData? data;

  static TerminalThemeData of(BuildContext context) => maybeOf(context)!;

  static TerminalThemeData? maybeOf(BuildContext context) {
    final theme = context.dependOnInheritedWidgetOfExactType<TerminalTheme>();
    return theme?.data;
  }

  @override
  bool updateShouldNotify(covariant TerminalTheme oldWidget) {
    return data != oldWidget.data;
  }

  @override
  Widget wrap(BuildContext context, Widget child) {
    return TerminalTheme(data: data, child: child);
  }
}

@immutable
class TerminalThemeData with Diagnosticable {
  const TerminalThemeData({
    required this.fontSize,
    required this.fontFamily,
    required this.palette,
  });

  final double fontSize;
  final String fontFamily;
  final TerminalPalette palette;

  TerminalThemeData copyWith({
    double? fontSize,
    String? fontFamily,
    TerminalPalette? palette,
  }) {
    return TerminalThemeData(
      fontSize: fontSize ?? this.fontSize,
      fontFamily: fontFamily ?? this.fontFamily,
      palette: palette ?? this.palette,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is TerminalThemeData &&
        other.fontSize == fontSize &&
        other.fontFamily == fontFamily &&
        other.palette == palette;
  }

  @override
  int get hashCode => Object.hash(fontSize, fontFamily, palette);
}

class TerminalPalette {
  const TerminalPalette({
    required this.cursor,
    required this.selection,
    required this.foreground,
    required this.background,
    required this.black,
    required this.white,
    required this.red,
    required this.green,
    required this.yellow,
    required this.blue,
    required this.magenta,
    required this.cyan,
    required this.brightBlack,
    required this.brightRed,
    required this.brightGreen,
    required this.brightYellow,
    required this.brightBlue,
    required this.brightMagenta,
    required this.brightCyan,
    required this.brightWhite,
    required this.searchHitBackground,
    required this.searchHitBackgroundCurrent,
    required this.searchHitForeground,
  });

  final Color cursor;
  final Color selection;

  final Color foreground;
  final Color background;
  final Color black;
  final Color red;
  final Color green;
  final Color yellow;
  final Color blue;
  final Color magenta;
  final Color cyan;
  final Color white;

  final Color brightBlack;
  final Color brightRed;
  final Color brightGreen;
  final Color brightYellow;
  final Color brightBlue;
  final Color brightMagenta;
  final Color brightCyan;
  final Color brightWhite;

  final Color searchHitBackground;
  final Color searchHitBackgroundCurrent;
  final Color searchHitForeground;
}
