import 'context.dart';
import 'provider.dart';

class LxdHomeFeature extends LxdFeatureProvider {
  const LxdHomeFeature();

  @override
  Map<String, Map<String, String>> getDevices(LxdFeatureContext context) {
    final home = context.image.properties['user.home']!;
    return {
      'home': {
        'type': 'disk',
        'source': home,
        'path': home,
      },
    };
  }
}
