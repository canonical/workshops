import 'package:lxd/lxd.dart';

import 'context.dart';

mixin LxdFeatureMixin {
  Future<void> initInstance(
    LxdClient client,
    LxdInstance instance,
    LxdFeatureContext context,
  ) async {}

  Future<void> configureInstance(
    LxdClient client,
    LxdInstance instance,
    LxdFeatureContext context,
  ) async {}

  Future<void> updateInstance(
    LxdClient client,
    LxdInstance instance,
    LxdFeatureContext context,
  ) async {}
}
