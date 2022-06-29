import 'package:lxd/lxd.dart';

abstract class LxdFeatureFactory {
  const LxdFeatureFactory(this.image);

  final LxdImage image;

  Future<void> initInstance(LxdClient client, LxdInstance instance);
}
