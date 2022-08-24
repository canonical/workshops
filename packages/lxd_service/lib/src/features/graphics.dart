import 'package:lxd/lxd.dart';
import 'package:lxd_x/lxd_x.dart';
import 'package:stdlibc/stdlibc.dart';

import 'context.dart';
import 'mixin.dart';

class LxdGraphicsFeature with LxdFeatureMixin {
  const LxdGraphicsFeature();

  @override
  Future<void> configureInstance(
    LxdClient client,
    LxdInstance instance,
    LxdFeatureContext context,
  ) async {
    final x11 = context.image.properties['user.x11']!;
    final wayland = context.image.properties['user.wayland']!;

    await client.mkdir(instance.name, '/tmp/.X11-unix/');
    // await client.mkdir(instance.name, '/run/user/${context.uid}');

    await client.pushFile(
      instance.name,
      path: '/etc/profile.d/workshops-graphics.sh',
      data: '''
# Created by Workshops on ${DateTime.now().toIso8601String()}

export DISPLAY=$x11
# export WAYLAND_DISPLAY=$wayland
''',
    );
  }

  @override
  Future<void> updateInstance(
    LxdClient client,
    LxdInstance instance,
    LxdFeatureContext context,
  ) async {
    final gpu = context.image.properties['user.gpu']!;
    final x11 = context.image.properties['user.x11']!;

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
          'gid': '${context.gid}',
          'uid': '${context.uid}',
          'security.gid': '${getgid()}',
          'security.uid': '${getuid()}',
        },
        // 'wayland': {
        //   'type': 'proxy',
        //   'bind': 'instance',
        //   'listen': 'unix:/run/user/$uid/$wayland',
        //   'connect': 'unix:/run/user/${getuid()}/$wayland',
        //   'gid': gid.toString(),
        //   'uid': uid.toString(),
        //   'security.gid': '${getgid()}',
        //   'security.uid': '${getuid()}',
        // },
      },
    ));
    await client.waitOperation(op.id);
  }
}
