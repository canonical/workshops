import 'package:flutter/widgets.dart';
import 'package:lxc_config/lxc_config.dart';
import 'package:lxd/lxd.dart';
import 'package:lxd_service/lxd_service.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:simplestreams/simplestreams.dart';
import 'package:ubuntu_service/ubuntu_service.dart';

import 'app.dart';
import 'instances/instance_model.dart';
import 'launcher/local_image_model.dart';
import 'launcher/remote_image_model.dart';
import 'remotes/remote_store.dart';

Future<void> main() async {
  final service = LxdService(LxdClient());
  registerServiceInstance<LxdService>(service);

  final config = await loadLxcConfig();
  registerServiceInstance<LxcConfig>(config);

  final preferences = await SharedPreferences.getInstance();
  registerServiceInstance<SharedPreferences>(preferences);

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
          create: (_) => InstanceModel(service),
        ),
        ChangeNotifierProvider(
          create: (_) => RemoteStore(preferences)..init(),
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
      child: const LxdApp(),
    ),
  );
}
