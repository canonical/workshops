import 'package:command_store/command_store.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:lxd/lxd.dart';
import 'package:lxd_service/lxd_service.dart';
import 'package:provider/provider.dart';
import 'package:settings_store/settings_store.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:simplestreams/simplestreams.dart';
import 'package:ubuntu_logger/ubuntu_logger.dart';
import 'package:ubuntu_service/ubuntu_service.dart';

import 'app.dart';
import 'home/instance_store.dart';
import 'launcher/local_image_model.dart';
import 'launcher/remote_image_model.dart';
import 'remotes/remote_store.dart';

Future<void> main() async {
  Logger.setup(level: LogLevel.fromString(kDebugMode ? 'debug' : 'info'));

  final service = LxdService(LxdClient());
  await service.init();
  registerServiceInstance<LxdService>(service);

  final preferences = await SharedPreferences.getInstance();
  registerServiceInstance<SharedPreferences>(preferences);

  registerServiceFactory<LxdClient>(
    (url) => LxdClient.remote(url: Uri.parse(url as String)),
  );

  registerServiceFactory<SimpleStreamClient>(
    (url) => SimpleStreamClient(url as String),
  );

  final shortcuts = ShortcutStore('com.canonical.workshops.shortcuts');
  await shortcuts.init();

  final settings = SettingsStore('com.canonical.workshops');
  await settings.init();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => InstanceStore(service)..init(),
        ),
        ChangeNotifierProvider(
          create: (_) => RemoteStore(preferences)..init(),
        ),
        ChangeNotifierProvider<ShortcutStore>.value(value: shortcuts),
        ChangeNotifierProvider<SettingsStore>.value(value: settings),
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
      child: const Workshops(),
    ),
  );
}
