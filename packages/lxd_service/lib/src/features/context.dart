import 'package:lxd/lxd.dart';

class LxdFeatureContext {
  const LxdFeatureContext({
    required this.image,
    required this.username,
    this.uid,
    this.gid,
  });

  final LxdImage image;
  final String username;
  final int? uid;
  final int? gid;

  LxdFeatureContext copyWith({
    LxdImage? image,
    String? username,
    int? uid,
    int? gid,
  }) {
    return LxdFeatureContext(
      image: image ?? this.image,
      username: username ?? this.username,
      uid: uid ?? this.uid,
      gid: gid ?? this.gid,
    );
  }
}
