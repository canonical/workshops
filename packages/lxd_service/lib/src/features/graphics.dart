import 'package:lxd/lxd.dart';
import 'package:lxd_x/lxd_x.dart';
import 'package:stdlibc/stdlibc.dart';

import 'factory.dart';

class LxdGraphicsFeature extends LxdFeatureFactory {
  const LxdGraphicsFeature(super.image);

  @override
  Future<void> initInstance(LxdClient client, LxdInstance instance) async {
    final gpu = image.properties['user.gpu']!;
    final x11 = image.properties['user.x11']!;
    final wayland = image.properties['user.wayland']!;
    final username = image.properties['user.username']!;

    final uid = await client.runCommand(instance.name, ['id', '-u', username]);
    final gid = await client.runCommand(instance.name, ['id', '-u', username]);

    await client.runCommand(instance.name, ['mkdir', '-p', '/tmp/.X11-unix/']);
    // await client.runCommand(instance.name, ['mkdir', '-p', '/run/user/$uid']);

    await client.pushFile(
      instance.name,
      path: '/etc/profile.d/workshops-graphics.sh',
      data: '''
# Created by Workshops on ${DateTime.now().toIso8601String()}

export DISPLAY=$x11
# export WAYLAND_DISPLAY=$wayland
''',
    );

    final op = await client.updateInstance(instance.copyWith(
      devices: {
        ...instance.devices,
        'gpu': {
          'type': 'gpu',
          'gputype': gpu,
        },
        'x11': {
          'type': 'proxy',
          'bind': 'instance',
          'listen': 'unix:/tmp/.X11-unix/X${x11.split(':').last}',
          'connect': 'unix:/tmp/.X11-unix/X${x11.split(':').last}',
          'gid': gid,
          'uid': uid,
          'security.gid': '${getgid()}',
          'security.uid': '${getuid()}',
        },
        // 'wayland': {
        //   'type': 'proxy',
        //   'bind': 'instance',
        //   'listen': 'unix:/run/user/$uid/$wayland',
        //   'connect': 'unix:/run/user/${getuid()}/$wayland',
        //   'gid': gid,
        //   'uid': uid,
        //   'security.gid': '${getgid()}',
        //   'security.uid': '${getuid()}',
        // },
      },
    ));
    await client.waitOperation(op.id);
  }
}
