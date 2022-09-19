import 'dart:ui';

import 'package:terminal_view/terminal_view.dart';

import 'terminal_colors.dart';

// TODO: configurable
TerminalThemeData getTerminalTheme(String? os) {
  switch (os?.toLowerCase()) {
    case 'ubuntu':
      return TerminalThemes.ubuntu;
    default:
      return TerminalThemes.fallback;
  }
}

abstract class TerminalThemes {
  const TerminalThemes._();

  static const ubuntu = TerminalThemeData(
    fontSize: 16,
    fontFamily: 'Ubuntu Mono',
    scheme: TerminalSchemes.ubuntu,
    palette: TerminalPalettes.ubuntu,
    brightPalette: TerminalPalettes.ubuntuBright,
    searchHitBackground: Color(0XFFFFFF2B),
    searchHitBackgroundCurrent: Color(0XFF31FF26),
    searchHitForeground: Color(0XFF000000),
  );

  static const fallback = TerminalThemeData(
    fontSize: 16,
    fontFamily: 'Monospace',
    scheme: TerminalSchemes.whiteOnBlack,
    palette: TerminalPalettes.ubuntu,
    brightPalette: TerminalPalettes.ubuntuBright,
    searchHitBackground: Color(0XFFFFFF2B),
    searchHitBackgroundCurrent: Color(0XFF31FF26),
    searchHitForeground: Color(0XFF000000),
  );
}
