import 'package:lxd/lxd.dart';

import 'factory.dart';

class LxdHomeFeature extends LxdFeatureFactory {
  const LxdHomeFeature(super.image);

  @override
  Future<void> initInstance(LxdClient client, LxdInstance instance) async {
    final home = image.properties['user.home']!;
    final op = await client.updateInstance(instance.copyWith(
      devices: {
        ...instance.devices,
        'home': {
          'type': 'disk',
          'source': home,
          'path': home,
        },
      },
    ));
    await client.waitOperation(op.id);
  }
}
