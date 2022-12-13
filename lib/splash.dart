import 'package:flutter/material.dart';
import 'package:title_bar/title_bar.dart';
import 'package:yaru/yaru.dart';

class Splash extends StatelessWidget {
  const Splash({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: yaruLight,
      darkTheme: yaruDark,
      highContrastTheme: yaruHighContrastLight,
      highContrastDarkTheme: yaruHighContrastDark,
      home: Scaffold(
        appBar: WindowTitleBar(),
      ),
    );
  }
}
