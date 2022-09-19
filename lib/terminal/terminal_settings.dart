import 'dart:ui';

import 'package:terminal_view/terminal_view.dart';

import 'terminal_colors.dart';

// TODO: configurable
const terminalTheme = TerminalThemeData(
  fontSize: 16,
  fontFamily: 'Ubuntu Mono',
  scheme: TerminalSchemes.ubuntu,
  palette: TerminalPalettes.ubuntu,
  brightPalette: TerminalPalettes.ubuntuBright,
  searchHitBackground: Color(0XFFFFFF2B),
  searchHitBackgroundCurrent: Color(0XFF31FF26),
  searchHitForeground: Color(0XFF000000),
);
