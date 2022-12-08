import 'package:lxd/lxd.dart';

import 'features.dart';
import 'instances.dart';
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
}
