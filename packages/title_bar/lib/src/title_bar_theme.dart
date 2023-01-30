import 'package:flutter/material.dart';

extension ThemeDataX on ThemeData {
  Color titleBarColor({bool active = true}) {
    return colorScheme.background.darken(active ? 0.04 : 0.01);
  }

  Border titleBarBorder() {
    return Border(
      bottom: BorderSide(color: colorScheme.background.darken(0.1)),
    );
  }
}

extension _ColorX on Color {
  Color darken(double amount) {
    final hsl = HSLColor.fromColor(this);
    return hsl
        .withLightness((hsl.lightness - amount).clamp(0.0, 1.0))
        .toColor();
  }
}
