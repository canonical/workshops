import 'package:lxc_config/lxc_config.dart';
import 'package:test/test.dart';
import 'package:yaml/yaml.dart';

void main() {
  test('yaml', () async {
    final yaml = loadYaml(
      '''
default-remote: local
remotes:
  images:
    addr: https://images.linuxcontainers.org
    protocol: simplestreams
    public: true
  local:
    addr: unix://
    public: false
aliases: {}
''',
    ) as YamlMap;

    final config = LxcConfig(yaml);
    expect(config.defaultRemote, 'local');
    expect(config.remotes, isNotNull);
    expect(config.remotes!.keys, ['images', 'local']);

    final images = config.remotes!['images'];
    expect(images, isNotNull);
    expect(images!.address, 'https://images.linuxcontainers.org');
    expect(images.protocol, 'simplestreams');
    expect(images.isPublic, true);

    final local = config.remotes!['local'];
    expect(local, isNotNull);
    expect(local!.address, 'unix://');
    expect(local.protocol, null);
    expect(local.isPublic, false);
  });
}
