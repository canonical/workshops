import 'package:command_store/command_store.dart';
import 'package:flutter/material.dart';
import 'package:lxd/lxd.dart';
import 'package:lxd_service/lxd_service.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:simplestreams/simplestreams.dart';
import 'package:ubuntu_service/ubuntu_service.dart';

import 'command_palette/command_palette_page.dart';
import 'home/instance_store.dart';
import 'launcher/local_image_model.dart';
import 'launcher/remote_image_model.dart';
import 'remotes/remote_store.dart';
import 'tabs/tab_page.dart';

class Workshops extends StatelessWidget {
  const Workshops({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => InstanceStore(getService<LxdService>())..init(),
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
      builder: (context, child) => CommandStore(
        shortcuts: context.watch<ShortcutStore>(),
        child: const CommandPalettePage(child: TabPage()),
      ),
    );
  }
}
