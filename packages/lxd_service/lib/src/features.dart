import 'features/audio.dart';
import 'features/feature.dart';
import 'features/graphics.dart';
import 'features/home.dart';
import 'features/server.dart';
import 'features/user.dart';

export 'features/context.dart';
export 'features/feature.dart';

enum LxdFeature {
  user(LxdUserFeature.new),
  home(LxdHomeFeature.new),
  graphics(LxdGraphicsFeature.new),
  audio(LxdAudioFeature.new),
  lxd(LxdServerFeature.new);

  const LxdFeature(this._factory);
  final LxdImageFeature Function() _factory;

  static LxdImageFeature create(LxdFeature feature) {
    return feature._factory();
  }
}
