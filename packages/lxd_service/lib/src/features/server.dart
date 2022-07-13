import 'package:lxd/lxd.dart';
import 'package:lxd_x/lxd_x.dart';

import 'factory.dart';

class LxdServerFeature extends LxdFeatureFactory {
  const LxdServerFeature(super.image);

  @override
  Future<void> initInstance(LxdClient client, LxdInstance instance) async {
    final socketPath = image.properties['lxd']!;

    final username = image.properties['user']!;
    final uid = await client.runCommand(instance.name, ['id', '-u', username]);
    final gid = await client.runCommand(instance.name, ['id', '-u', username]);

    await client.runCommand(instance.name, ['mkdir', '-p', '/srv/lxd']);

    await client.pushFile(
      instance.name,
      path: '/etc/profile.d/workshops-lxd.sh',
      data: '''
# Created by Workshops on ${DateTime.now().toIso8601String()}

export LXD_DIR=/srv/lxd
''',
    );

    final op = await client.updateInstance(instance.copyWith(
      devices: {
        ...instance.devices,
        'lxd': {
          'type': 'proxy',
          'bind': 'instance',
          'listen': 'unix:/srv/lxd/unix.socket',
          'connect': 'unix:$socketPath',
          'gid': gid,
          'uid': uid,
        },
      },
    ));
    await client.waitOperation(op.id);
  }
}
