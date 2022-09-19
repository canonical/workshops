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
