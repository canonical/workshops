import 'package:flutter/material.dart';
import 'package:yaru/yaru.dart';

import 'home/home_page.dart';

class LxdApp extends StatelessWidget {
  const LxdApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: YaruTheme(
        child: HomePage.create(context),
      ),
    );
  }
}
