import 'package:collection/collection.dart';
import 'package:lxd/lxd.dart';
import 'package:lxd_x/lxd_x.dart';
import 'package:stdlibc/stdlibc.dart';

import 'context.dart';
import 'mixin.dart';

class LxdUserFeature with LxdFeatureMixin {
  const LxdUserFeature();

  @override
  Future<void> initInstance(
    LxdClient client,
    LxdInstance instance,
    LxdFeatureContext context,
  ) async {
    final username = context.image.properties['user.username']!;
    final shell = context.image.properties['user.shell'];

    // sudo vs. wheel
    final group =
        await client.pullFile(instance.name, path: '/etc/group').then((data) {
      return data
          .split('\n')
          .firstWhereOrNull(
              (line) => line.startsWith('sudo:') || line.startsWith('wheel:'))
          ?.split(':')
          .firstOrNull;
    });

    // useradd
    final useradd = await client.execInstance(
      instance.name,
      command: [
        'useradd',
        '--create-home',
        if (group != null) '--groups=$group',
        if (shell != null) '--shell=$shell',
        username,
      ],
    );
    await client.waitOperation(useradd.id);

    // sudoers
    await client.mkdir(instance.name, '/etc/sudoers.d');
    await client.pushFile(
      instance.name,
      path: '/etc/sudoers.d/90-workshops',
      data: '''
# Created by Workshops on ${DateTime.now().toIso8601String()}

$username ALL=(ALL) NOPASSWD:ALL
Defaults:$username env_keep += \"LXD_DIR\"
''',
    );
  }

  @override
  Future<void> updateInstance(
    LxdClient client,
    LxdInstance instance,
    LxdFeatureContext context,
  ) async {
    final idmap = await client.updateInstance(instance.copyWith(
      config: {
        ...instance.config,
        'user.name': context.username,
        'raw.idmap': '''
uid ${getuid()} ${context.uid}
gid ${getgid()} ${context.gid}
''',
      },
    ));
    await client.waitOperation(idmap.id);
  }
}
