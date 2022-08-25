import 'package:lxd/lxd.dart';

import 'context.dart';

abstract class LxdFeatureProvider {
  const LxdFeatureProvider();

  Set<LxdImageType> get supportedTypes => Set.of(LxdImageType.values);

  List<String> getDirectories(LxdFeatureContext context) => const [];
  Map<String, String> getFiles(LxdFeatureContext context) => const {};
  Map<String, String> getConfig(LxdFeatureContext context) => const {};
  Map<String, Map<String, String>> getDevices(LxdFeatureContext context) =>
      const {};

  Future<void> init(LxdClient client, LxdInstance instance,
      LxdFeatureContext context) async {}
}
