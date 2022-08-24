import 'features/audio.dart';
import 'features/graphics.dart';
import 'features/home.dart';
import 'features/mixin.dart';
import 'features/server.dart';
import 'features/user.dart';

export 'features/context.dart';
export 'features/mixin.dart';

enum LxdFeature {
  user(LxdUserFeature.new),
  home(LxdHomeFeature.new),
  graphics(LxdGraphicsFeature.new),
  audio(LxdAudioFeature.new),
  lxd(LxdServerFeature.new);

  const LxdFeature(this._factory);
  final LxdFeatureMixin Function() _factory;

  static LxdFeatureMixin create(LxdFeature feature) {
    return feature._factory();
  }
}
