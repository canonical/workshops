import 'package:freezed_annotation/freezed_annotation.dart';

part 'remote.freezed.dart';
part 'remote.g.dart';

@freezed
class Remote with _$Remote {
  const factory Remote({
    required String name,
    required String address,
    @Default(false) isStatic,
    @Default(true) isPublic,
    String? protocol,
  }) = _Remote;

  factory Remote.fromJson(Map<String, dynamic> json) => _$RemoteFromJson(json);
}
