import 'dart:ui';

import 'package:settings_store/settings_store.dart';
import 'package:terminal_view/terminal_view.dart';

import 'terminal_colors.dart';

const _kFontSize = 'terminal-font-size';
const _kFontFamily = 'terminal-font-family';

extension TerminalSettings on SettingsStore {
  double? get fontSize => getValue(_kFontSize) as double?;
  set fontSize(double? value) =>
      value != null ? setValue(_kFontSize, value) : resetValue(_kFontSize);

  String? get fontFamily => getValue(_kFontFamily) as String?;
  set fontFamily(String? value) =>
      value != null ? setValue(_kFontFamily, value) : resetValue(_kFontFamily);

  TerminalThemeData getTheme(String? os) {
    return defaultTheme(os).copyWith(
      fontSize: fontSize,
      fontFamily: fontFamily,
    );
  }

  TerminalThemeData defaultTheme(String? os) {
    switch (os?.toLowerCase()) {
      case 'ubuntu':
        return TerminalThemes.ubuntu;
      default:
        return TerminalThemes.fallback;
    }
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
