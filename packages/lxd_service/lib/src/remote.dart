import 'package:freezed_annotation/freezed_annotation.dart';

part 'remote.freezed.dart';
part 'remote.g.dart';

@freezed
class LxdRemote with _$LxdRemote {
  const factory LxdRemote({
    required String name,
    required String address,
    @Default(false) isStatic,
    @Default(true) isPublic,
    String? protocol,
  }) = _LxdRemote;
  const LxdRemote._();

  bool get isLocal => protocol == 'lxd';

  factory LxdRemote.fromJson(Map<String, dynamic> json) =>
      _$LxdRemoteFromJson(json);
}
