import 'package:lxd/lxd.dart';

import 'features/audio.dart';
import 'features/factory.dart';
import 'features/graphics.dart';
import 'features/home.dart';
import 'features/server.dart';
import 'features/user.dart';

enum LxdFeature {
  user(LxdUserFeature.new),
  home(LxdHomeFeature.new),
  graphics(LxdGraphicsFeature.new),
  audio(LxdAudioFeature.new),
  lxd(LxdServerFeature.new);

  const LxdFeature(this._factory);
  final LxdFeatureFactory Function(LxdImage) _factory;

  static LxdFeatureFactory create(LxdFeature feature, LxdImage image) {
    return feature._factory(image);
  }
}
