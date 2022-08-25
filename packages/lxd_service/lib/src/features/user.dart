import 'package:collection/collection.dart';
import 'package:lxd/lxd.dart';
import 'package:stdlibc/stdlibc.dart';

import 'context.dart';
import 'provider.dart';

class LxdUserFeature extends LxdFeatureProvider {
  const LxdUserFeature();

  @override
  List<String> getDirectories(LxdFeatureContext context) =>
      const ['/etc/sudoers.d'];

  @override
  Map<String, String> getFiles(LxdFeatureContext context) {
    return {
      '/etc/sudoers.d/90-workshops': '''
  # Created by Workshops on ${DateTime.now().toIso8601String()}
  
  ${context.username} ALL=(ALL) NOPASSWD:ALL
  Defaults:${context.username} env_keep += \"LXD_DIR\"
  '''
    };
  }

  @override
  Map<String, String> getConfig(LxdFeatureContext context) {
    return {
      'user.name': context.username,
      'raw.idmap': '''
uid ${getuid()} ${context.uid}
gid ${getgid()} ${context.gid}
''',
    };
  }

  @override
  Future<void> init(
      LxdClient client, LxdInstance instance, LxdFeatureContext context) async {
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
        context.username,
      ],
    );
    await client.waitOperation(useradd.id);
  }
}
