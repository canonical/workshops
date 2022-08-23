import 'package:collection/collection.dart';
import 'package:lxd/lxd.dart';
import 'package:lxd_x/lxd_x.dart';
import 'package:stdlibc/stdlibc.dart';

import 'factory.dart';

class LxdUserFeature extends LxdFeatureFactory {
  const LxdUserFeature(super.image);

  @override
  Future<void> initInstance(LxdClient client, LxdInstance instance) async {
    final username = image.properties['user.username']!;
    final shell = image.properties['user.shell'];

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
    await client.runCommand(instance.name, ['mkdir', '-p', '/etc/sudoers.d']);
    await client.pushFile(
      instance.name,
      path: '/etc/sudoers.d/90-workshops',
      data: '''
# Created by Workshops on ${DateTime.now().toIso8601String()}

$username ALL=(ALL) NOPASSWD:ALL
Defaults:$username env_keep += \"LXD_DIR\"
''',
    );

    // idmap
    final uid = await client.runCommand(instance.name, ['id', '-u', username]);
    final gid = await client.runCommand(instance.name, ['id', '-g', username]);
    final idmap = await client.updateInstance(instance.copyWith(
      config: {
        ...instance.config,
        'user.name': username,
        'raw.idmap': '''
uid ${getuid()} $uid
gid ${getgid()} $gid
''',
      },
    ));
    await client.waitOperation(idmap.id);

    final restart = await client.restartInstance(instance.name);
    await client.waitOperation(restart.id);
  }
}
