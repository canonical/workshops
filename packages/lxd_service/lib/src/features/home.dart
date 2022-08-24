import 'package:lxd/lxd.dart';

import 'context.dart';
import 'mixin.dart';

class LxdHomeFeature with LxdFeatureMixin {
  const LxdHomeFeature();

  @override
  Future<void> updateInstance(
    LxdClient client,
    LxdInstance instance,
    LxdFeatureContext context,
  ) async {
    final home = context.image.properties['user.home']!;
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
