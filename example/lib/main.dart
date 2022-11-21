import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yaru/yaru.dart';

import 'path_provider.dart';
import 'settings.dart';
import 'settings_editor.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final path = PathProvider();
  await path.init();

  runApp(ChangeNotifierProvider.value(
    value: path,
    child: YaruTheme(
      builder: (context, yaru, child) => MaterialApp(
        theme: yaru.theme,
        darkTheme: yaru.darkTheme,
        home: const HomePage(),
      ),
    ),
  ));
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final path = context.watch<PathProvider>();
    return Scaffold(
      body: ChangeNotifierProvider(
        create: (_) => GlobalSettings(path.getBundle('global'))..init(),
        builder: (context, child) => Row(
          children: [
            Expanded(
              child: SettingsEditor(
                title: const Text('Global (read-only)'),
                settings: context.watch<GlobalSettings>(),
                readOnly: true,
              ),
            ),
            for (var i = 1; i <= 2; ++i) ...[
              const VerticalDivider(width: 1),
              Expanded(
                child:
                    ChangeNotifierProxyProvider<GlobalSettings, UserSettings>(
                  create: (_) => UserSettings(path.getConfig('user$i')),
                  update: (_, global, user) => user!..init(base: global),
                  builder: (context, child) => Column(
                    children: [
                      Expanded(
                        child: SettingsEditor(
                          title: Text('User $i'),
                          settings: context.watch<UserSettings>(),
                        ),
                      ),
                      Expanded(
                        child: ChangeNotifierProxyProvider<UserSettings,
                            WorkspaceSettings>(
                          create: (_) => WorkspaceSettings(
                              path.getConfig('user$i/workspace$i')),
                          update: (_, user, workspace) =>
                              workspace!..init(base: user),
                          builder: (context, child) => SettingsEditor(
                            title: Text('Workspace $i'),
                            settings: context.watch<WorkspaceSettings>(),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
      floatingActionButton: const FloatingActionButton(
        onPressed: null,
        child: Icon(Icons.add),
      ),
    );
  }
}
