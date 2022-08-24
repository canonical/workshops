import 'package:lxd/lxd.dart';
import 'package:lxd_x/lxd_x.dart';
import 'package:stdlibc/stdlibc.dart';

import 'context.dart';
import 'mixin.dart';

class LxdAudioFeature with LxdFeatureMixin {
  const LxdAudioFeature();

  @override
  Future<void> configureInstance(
    LxdClient client,
    LxdInstance instance,
    LxdFeatureContext context,
  ) async {
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
  }

  @override
  Future<void> updateInstance(
    LxdClient client,
    LxdInstance instance,
    LxdFeatureContext context,
  ) async {
    final op = await client.updateInstance(instance.copyWith(
      devices: {
        ...instance.devices,
        'pulse': {
          'type': 'proxy',
          'bind': 'instance',
          'listen': 'unix:/srv/pulse/native',
          'connect': 'unix:/run/user/${getuid()}/pulse/native',
          'gid': '${context.gid}',
          'uid': '${context.uid}',
          'mode': '0777',
          'security.gid': '${getgid()}',
          'security.uid': '${getuid()}',
        },
      },
    ));
    await client.waitOperation(op.id);
  }
}
