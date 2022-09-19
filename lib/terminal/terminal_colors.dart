import 'dart:ui';

import 'package:terminal_view/terminal_view.dart';

abstract class TerminalSchemes {
  const TerminalSchemes._();

  static const ubuntu = TerminalScheme(
    foreground: Color(0xffffffff),
    background: Color(0xff380c2a),
  );

  static const blackOnWhite = TerminalScheme(
    foreground: Color(0xff000000),
    background: Color(0xffffffff),
  );

  static const whiteOnBlack = TerminalScheme(
    foreground: Color(0xffffffff),
    background: Color(0xff000000),
  );
}

abstract class TerminalPalettes {
  const TerminalPalettes._();

  static const ubuntu = TerminalPalette(
    black: Color(0xFF000000),
    red: Color(0xFFCD3131),
    green: Color(0xFF0DBC79),
    yellow: Color(0xFFE5E510),
    blue: Color(0xFF2472C8),
    magenta: Color(0xFFBC3FBC),
    cyan: Color(0xFF11A8CD),
    white: Color(0xFFE5E5E5),
  );

  static const ubuntuBright = TerminalPalette(
    black: Color(0xFF666666),
    red: Color(0xFFF14C4C),
    green: Color(0xFF23D18B),
    yellow: Color(0xFFF5F543),
    blue: Color(0xFF3B8EEA),
    magenta: Color(0xFFD670D6),
    cyan: Color(0xFF29B8DB),
    white: Color(0xFFFFFFFF),
  );
}
