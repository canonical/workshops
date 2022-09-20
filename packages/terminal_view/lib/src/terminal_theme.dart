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
    required this.scheme,
    required this.palette,
    required this.brightPalette,
    required this.searchHitBackground,
    required this.searchHitBackgroundCurrent,
    required this.searchHitForeground,
  });

  final double fontSize;
  final String fontFamily;
  final TerminalScheme scheme;
  final TerminalPalette palette;
  final TerminalPalette brightPalette;
  final Color searchHitBackground;
  final Color searchHitBackgroundCurrent;
  final Color searchHitForeground;

  TerminalThemeData copyWith({
    double? fontSize,
    String? fontFamily,
    TerminalScheme? scheme,
    TerminalPalette? palette,
    TerminalPalette? brightPalette,
    Color? searchHitBackground,
    Color? searchHitBackgroundCurrent,
    Color? searchHitForeground,
  }) {
    return TerminalThemeData(
      fontSize: fontSize ?? this.fontSize,
      fontFamily: fontFamily ?? this.fontFamily,
      scheme: scheme ?? this.scheme,
      palette: palette ?? this.palette,
      brightPalette: brightPalette ?? this.brightPalette,
      searchHitBackground: searchHitBackground ?? this.searchHitBackground,
      searchHitBackgroundCurrent:
          searchHitBackgroundCurrent ?? this.searchHitBackgroundCurrent,
      searchHitForeground: searchHitForeground ?? this.searchHitForeground,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is TerminalThemeData &&
        other.fontSize == fontSize &&
        other.fontFamily == fontFamily &&
        other.scheme == scheme &&
        other.palette == palette &&
        other.brightPalette == brightPalette &&
        other.searchHitBackground == searchHitBackground &&
        other.searchHitBackgroundCurrent == searchHitBackgroundCurrent &&
        other.searchHitForeground == searchHitForeground;
  }

  @override
  int get hashCode {
    return Object.hash(
      fontSize,
      fontFamily,
      scheme,
      palette,
      brightPalette,
      searchHitBackground,
      searchHitBackgroundCurrent,
      searchHitForeground,
    );
  }
}

@immutable
class TerminalScheme {
  const TerminalScheme({
    required this.foreground,
    required this.background,
  });

  final Color foreground;
  final Color background;

  TerminalScheme copyWith({
    Color? foreground,
    Color? background,
  }) {
    return TerminalScheme(
      foreground: foreground ?? this.foreground,
      background: background ?? this.background,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is TerminalScheme &&
        other.foreground == foreground &&
        other.background == background;
  }

  @override
  int get hashCode => Object.hash(foreground.hashCode, background.hashCode);
}

@immutable
class TerminalPalette {
  const TerminalPalette({
    required this.black,
    required this.red,
    required this.green,
    required this.yellow,
    required this.blue,
    required this.magenta,
    required this.cyan,
    required this.white,
  });

  final Color black;
  final Color red;
  final Color green;
  final Color yellow;
  final Color blue;
  final Color magenta;
  final Color cyan;
  final Color white;

  TerminalPalette copyWith({
    Color? black,
    Color? red,
    Color? green,
    Color? yellow,
    Color? blue,
    Color? magenta,
    Color? cyan,
    Color? white,
  }) {
    return TerminalPalette(
      black: black ?? this.black,
      red: red ?? this.red,
      green: green ?? this.green,
      yellow: yellow ?? this.yellow,
      blue: blue ?? this.blue,
      magenta: magenta ?? this.magenta,
      cyan: cyan ?? this.cyan,
      white: white ?? this.white,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is TerminalPalette &&
        other.black == black &&
        other.red == red &&
        other.green == green &&
        other.yellow == yellow &&
        other.blue == blue &&
        other.magenta == magenta &&
        other.cyan == cyan &&
        other.white == white;
  }

  @override
  int get hashCode {
    return Object.hash(black, red, green, yellow, blue, magenta, cyan, white);
  }
}
