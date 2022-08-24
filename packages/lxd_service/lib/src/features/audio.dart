import 'package:lxd/lxd.dart';
import 'package:lxd_x/lxd_x.dart';
import 'package:stdlibc/stdlibc.dart';

import 'factory.dart';

class LxdAudioFeature extends LxdFeatureFactory {
  const LxdAudioFeature(super.image);

  @override
  Future<void> initInstance(LxdClient client, LxdInstance instance) async {
    final username = image.properties['user.username']!;

    final uid = await client.uid(instance.name, username);
    final gid = await client.gid(instance.name, username);

    await client.mkdir(instance.name, '/etc/pulse/client.conf.d');
    await client.pushFile(
      instance.name,
      path: '/etc/pulse/client.conf.d/workshops-no-shm.conf',
      data: 'enable-shm=no',
    );

    await client.mkdir(instance.name, '/etc/profile.d');
    await client.pushFile(
      instance.name,
      path: '/etc/profile.d/workshops-audio.sh',
      data: '''
# Created by Workshops on ${DateTime.now().toIso8601String()}

export PULSE_SERVER=unix:/srv/pulse/native
''',
    );

    await client.mkdir(instance.name, '/srv/pulse');
    final op = await client.updateInstance(instance.copyWith(
      devices: {
        ...instance.devices,
        'pulse': {
          'type': 'proxy',
          'bind': 'instance',
          'listen': 'unix:/srv/pulse/native',
          'connect': 'unix:/run/user/${getuid()}/pulse/native',
          'gid': gid.toString(),
          'uid': uid.toString(),
          'mode': '0777',
          'security.gid': '${getgid()}',
          'security.uid': '${getuid()}',
        },
      },
    ));
    await client.waitOperation(op.id);
  }
}
