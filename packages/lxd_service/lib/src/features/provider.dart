import 'package:lxd/lxd.dart';

abstract class LxdFeatureProvider {
  const LxdFeatureProvider();

  Set<LxdImageType> get supportedTypes => Set.of(LxdImageType.values);

  List<String> getDirectories(LxdImage image) => const [];
  Map<String, String> getFiles(LxdImage image) => const {};
  Map<String, String> getConfig(LxdImage image) => const {};
  Map<String, Map<String, String>> getDevices(LxdImage image) => const {};

  Future<LxdOperation?> init(
          LxdClient client, LxdInstance instance, LxdImage image) async =>
      null;
}
