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
import 'launcher/simple_stream_model.dart';
import 'remotes/remote_store.dart';

Future<void> main() async {
  final service = LxdService(LxdClient());
  registerServiceInstance<LxdService>(service);

  final config = await loadLxcConfig();
  registerServiceInstance<LxcConfig>(config);

  final preferences = await SharedPreferences.getInstance();
  registerServiceInstance<SharedPreferences>(preferences);

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
        ChangeNotifierProxyProvider<RemoteStore, SimpleStreamModel>(
          create: (_) => SimpleStreamModel(),
          update: (_, store, model) {
            final url = store.current?.address;
            model ??= SimpleStreamModel();
            if (model.client?.url != url) {
              final client = url?.isNotEmpty == true
                  ? createService<SimpleStreamClient>(url)
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
