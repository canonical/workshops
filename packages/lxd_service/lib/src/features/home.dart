import 'package:lxd/lxd.dart';

import 'provider.dart';

class LxdHomeFeature extends LxdFeatureProvider {
  const LxdHomeFeature();

  @override
  Map<String, Map<String, String>> getDevices(LxdImage image) {
    final home = image.properties['user.workshops.home']!;

    return {
      'home': {
        'type': 'disk',
        'source': home,
        'path': home,
      },
    };
  }
}
