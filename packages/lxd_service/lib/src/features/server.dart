import 'package:lxd/lxd.dart';
import 'package:lxd_x/lxd_x.dart';

import 'context.dart';
import 'mixin.dart';

class LxdServerFeature with LxdFeatureMixin {
  const LxdServerFeature();

  @override
  Future<void> configureInstance(
    LxdClient client,
    LxdInstance instance,
    LxdFeatureContext context,
  ) async {
    await client.mkdir(instance.name, '/srv/lxd');

    await client.pushFile(
      instance.name,
      path: '/etc/profile.d/workshops-lxd.sh',
      data: '''
# Created by Workshops on ${DateTime.now().toIso8601String()}

export LXD_DIR=/srv/lxd
''',
    );
  }

  @override
  Future<void> updateInstance(
    LxdClient client,
    LxdInstance instance,
    LxdFeatureContext context,
  ) async {
    final socketPath = context.image.properties['user.lxd']!;

    final op = await client.updateInstance(instance.copyWith(
      devices: {
        ...instance.devices,
        'lxd': {
          'type': 'proxy',
          'bind': 'instance',
          'listen': 'unix:/srv/lxd/unix.socket',
          'connect': 'unix:$socketPath',
          'gid': context.gid.toString(),
          'uid': context.uid.toString(),
        },
      },
    ));
    await client.waitOperation(op.id);
  }
}
