import 'package:flutter/material.dart';
import 'package:yaru/yaru.dart';

import 'home/home_page.dart';

class LxdApp extends StatelessWidget {
  const LxdApp({super.key});

  @override
  Widget build(BuildContext context) {
    return YaruTheme(builder: (context, yaru, child) {
      return MaterialApp(
        theme: yaru.variant?.theme ?? yaruLight,
        darkTheme: yaru.variant?.darkTheme ?? yaruDark,
        highContrastTheme: yaruHighContrastLight,
        highContrastDarkTheme: yaruHighContrastDark,
        home: HomePage.create(context),
      );
    });
  }
}
