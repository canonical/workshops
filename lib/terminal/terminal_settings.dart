import 'dart:ui';

import 'package:terminal_view/terminal_view.dart';

// TODO: configurable
const terminalTheme = TerminalThemeData(
  fontSize: 16,
  fontFamily: 'Ubuntu Mono',
  scheme: TerminalScheme(
    foreground: Color(0xffffffff),
    background: Color(0xff380c2a),
  ),
  palette: TerminalPalette(
    black: Color(0XFF000000),
    red: Color(0XFFCD3131),
    green: Color(0XFF0DBC79),
    yellow: Color(0XFFE5E510),
    blue: Color(0XFF2472C8),
    magenta: Color(0XFFBC3FBC),
    cyan: Color(0XFF11A8CD),
    white: Color(0XFFE5E5E5),
  ),
  brightPalette: TerminalPalette(
    black: Color(0XFF666666),
    red: Color(0XFFF14C4C),
    green: Color(0XFF23D18B),
    yellow: Color(0XFFF5F543),
    blue: Color(0XFF3B8EEA),
    magenta: Color(0XFFD670D6),
    cyan: Color(0XFF29B8DB),
    white: Color(0XFFFFFFFF),
  ),
  searchHitBackground: Color(0XFFFFFF2B),
  searchHitBackgroundCurrent: Color(0XFF31FF26),
  searchHitForeground: Color(0XFF000000),
);
