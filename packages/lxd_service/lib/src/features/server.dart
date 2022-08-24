import 'context.dart';
import 'feature.dart';

class LxdServerFeature extends LxdImageFeature {
  const LxdServerFeature();

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
