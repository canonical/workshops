import 'dart:async';

import 'package:flutter/material.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:yaru/yaru.dart';

import 'settings_editor.dart';
import 'settings_notifier.dart';

class UserSettings extends SettingsNotifier {
  UserSettings(super.path);
}

class WorkspaceSettings extends SettingsNotifier {
  WorkspaceSettings(super.path, {SettingsNotifier? base}) : _base = base;

  SettingsNotifier? _base;

  @override
  Set<String> getKeys() => Set.of({...super.getKeys(), ...?_base?.getKeys()});

  @override
  bool hasValue(String key) => super.getKeys().contains(key);

  @override
  Object? getValue(String key) => super.getValue(key) ?? _base?.getValue(key);

  @override
  Future<void> init({SettingsNotifier? base}) {
    if (_base != base) {
      _base?.removeListener(notifyListeners);
      base?.addListener(notifyListeners);
      _base = base;
    }
    return super.init();
  }

  @override
  Future<void> dispose() async {
    _base?.removeListener(notifyListeners);
    super.dispose();
  }
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final dir = await getApplicationSupportDirectory();
  final user = path.join(dir.path, 'user.json');
  final workspace = path.join(dir.path, 'workspace.json');

  print('User: $user');
  print('Workspace: $workspace');

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => UserSettings(user)),
      ChangeNotifierProxyProvider<UserSettings, WorkspaceSettings>(
        create: (_) => WorkspaceSettings(workspace),
        update: (_, user, workspace) => workspace!..init(base: user),
      ),
    ],
    child: YaruTheme(builder: (context, yaru, child) {
      return MaterialApp(
        theme: yaru.theme,
        darkTheme: yaru.darkTheme,
        home: const HomePage(),
      );
    }),
  ));
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    context.read<UserSettings>().init();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: SettingsEditor(
            title: const Text('User'),
            settings: context.read<UserSettings>(),
          ),
        ),
        const VerticalDivider(width: 1),
        Expanded(
          child: SettingsEditor(
            title: const Text('Workspace'),
            settings: context.read<WorkspaceSettings>(),
          ),
        ),
      ],
    );
  }
}
