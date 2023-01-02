import 'package:command_store/command_store.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:lxd/lxd.dart';
import 'package:lxd_service/lxd_service.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:simplestreams/simplestreams.dart';
import 'package:ubuntu_localizations/ubuntu_localizations.dart';
import 'package:ubuntu_logger/ubuntu_logger.dart';
import 'package:ubuntu_service/ubuntu_service.dart';
import 'package:yaru/yaru.dart';

import 'launcher/local_image_model.dart';
import 'launcher/remote_image_model.dart';
import 'path_provider.dart';
import 'remotes/remote_store.dart';
import 'settings.dart';
import 'splash.dart';

Future<void> main() async {
  Logger.setup(level: LogLevel.fromString(kDebugMode ? 'debug' : 'info'));

  registerService(LxdService.new);

  final preferences = await SharedPreferences.getInstance();
  registerServiceInstance<SharedPreferences>(preferences);

  final path = PathProvider();
  registerServiceInstance<PathProvider>(path);

  registerServiceFactory<LxdClient>(
    (url) => LxdClient.remote(url: Uri.parse(url as String)),
  );

  registerServiceFactory<SimpleStreamClient>(
    (url) => SimpleStreamClient(url as String),
  );

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => DefaultSettings(path.getBundleFile('settings.json')),
        ),
        ChangeNotifierProxyProvider<DefaultSettings, AppSettings>(
          create: (_) =>
              AppSettings(path.getConfigFile('settings.json'))..init(),
          update: (_, base, settings) => settings!..inherit(base),
        ),
        ChangeNotifierProvider(
          create: (_) => DefaultShortcuts(path.getBundleFile('shortcuts.json')),
        ),
        ChangeNotifierProxyProvider<DefaultShortcuts, ShortcutSettings>(
          create: (_) =>
              ShortcutSettings(path.getConfigFile('shortcuts.json'))..init(),
          update: (_, base, settings) => settings!..inherit(base),
        ),
        ChangeNotifierProxyProvider<ShortcutSettings, ShortcutStore>(
          create: (_) => ShortcutStore(),
          update: (_, settings, store) => store!..init(settings),
        ),
        ChangeNotifierProvider(
          create: (_) => RemoteStore(getService<SharedPreferences>())..init(),
        ),
        ChangeNotifierProxyProvider<RemoteStore, RemoteImageModel>(
          create: (_) => RemoteImageModel(),
          update: (_, store, model) {
            final url = store.current?.address;
            model ??= RemoteImageModel();
            if (model.client?.url != url) {
              final client = url?.isNotEmpty == true
                  ? createService<SimpleStreamClient>(url)
                  : null;
              model.init(client);
            }
            return model;
          },
        ),
        ChangeNotifierProxyProvider<RemoteStore, LocalImageModel>(
          create: (_) => LocalImageModel(),
          update: (_, store, model) {
            final url = store.current?.address;
            model ??= LocalImageModel();
            if (model.client?.url.toString() != url) {
              final client = url?.isNotEmpty == true
                  ? createService<LxdClient>(url)
                  : null;
              model.init(client);
            }
            return model;
          },
        ),
      ],
      child: YaruTheme(
        builder: (context, yaru, child) => MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: yaru.theme,
          darkTheme: yaru.darkTheme,
          highContrastTheme: yaruHighContrastLight,
          highContrastDarkTheme: yaruHighContrastDark,
          themeMode: context.themeMode,
          localizationsDelegates: const [
            ...AppLocalizations.localizationsDelegates,
            ...GlobalUbuntuLocalizations.delegates,
          ],
          supportedLocales: {
            const Locale('en'), // make sure 'en' comes first
            ...List.of(AppLocalizations.supportedLocales)
              ..remove(const Locale('en')),
          },
          onGenerateTitle: (context) => AppLocalizations.of(context).appTitle,
          routes: const {
            Navigator.defaultRouteName: Splash.create,
          },
        ),
      ),
    ),
  );
}
