import 'dart:io';

import 'package:lxd/lxd.dart';

import 'features.dart';
import 'instances.dart';
import 'log.dart';
import 'projects.dart';
import 'terminal.dart';
import 'vm.dart';
import 'watch.dart';

class LxdService extends LxdClient
    with
        LxdFeatureService,
        LxdInstanceService,
        LxdProjectService,
        LxdTerminalService,
        LxdVmService,
        LxdWatchService {
  LxdService({super.socketPath, super.client});

  @override
  Future<void> init() async {
    try {
      await super.init();
    } on SocketException catch (e) {
      log.error('Failed to initialize LXD', e);
    }
  }
}
