import 'package:lxd/lxd.dart';
import 'package:lxd_x/lxd_x.dart';
import 'package:stdlibc/stdlibc.dart';

import 'factory.dart';

class LxdAudioFeature extends LxdFeatureFactory {
  const LxdAudioFeature(super.image);

  @override
  Future<void> initInstance(LxdClient client, LxdInstance instance) async {
    final username = image.properties['user']!;

    final uid = await client.runCommand(instance.name, ['id', '-u', username]);
    final gid = await client.runCommand(instance.name, ['id', '-u', username]);

    await client
        .runCommand(instance.name, ['mkdir', '-p', '/etc/pulse/client.conf.d']);
    await client.pushFile(
      instance.name,
      path: '/etc/pulse/client.conf.d/workshops-no-shm.conf',
      data: 'enable-shm=no',
    );

    await client.runCommand(instance.name, ['mkdir', '-p', '/etc/profile.d']);
    await client.pushFile(
      instance.name,
      path: '/etc/profile.d/workshops-audio.sh',
      data: '''
# Created by Workshops on ${DateTime.now().toIso8601String()}

export PULSE_SERVER=unix:/srv/pulse/native
''',
    );

    await client.runCommand(instance.name, ['mkdir', '-p', '/srv/pulse']);
    final op = await client.updateInstance(instance.copyWith(
      devices: {
        ...instance.devices,
        'pulse': {
          'type': 'proxy',
          'bind': 'instance',
          'listen': 'unix:/srv/pulse/native',
          'connect': 'unix:/run/user/${getuid()}/pulse/native',
          'gid': gid,
          'uid': uid,
          'mode': '0777',
          'security.gid': '${getgid()}',
          'security.uid': '${getuid()}',
        },
      },
    ));
    await client.waitOperation(op.id);
  }
}
