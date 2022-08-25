import 'package:lxd/lxd.dart';

import 'context.dart';
import 'provider.dart';

class LxdServerFeature extends LxdFeatureProvider {
  const LxdServerFeature();

  // only containers can proxy unix domain sockets
  // https://linuxcontainers.org/lxd/docs/master/instances/#type-proxy
  @override
  Set<LxdImageType> get supportedTypes => const {LxdImageType.container};

  @override
  List<String> getDirectories(LxdFeatureContext context) {
    return const ['/srv/lxd', '/etc/profile.d'];
  }

  @override
  Map<String, String> getFiles(LxdFeatureContext context) {
    return {
      '/etc/profile.d/workshops-lxd.sh': '''
  # Created by Workshops on ${DateTime.now().toIso8601String()}
  
  export LXD_DIR=/srv/lxd
  '''
    };
  }

  @override
  Map<String, Map<String, String>> getDevices(LxdFeatureContext context) {
    final lxd = context.image.properties['user.lxd']!;
    return {
      'lxd': {
        'type': 'proxy',
        'bind': 'instance',
        'listen': 'unix:/srv/lxd/unix.socket',
        'connect': 'unix:$lxd',
        'gid': '${context.gid}',
        'uid': '${context.uid}',
      },
    };
  }
}
