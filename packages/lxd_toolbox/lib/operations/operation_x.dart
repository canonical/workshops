import 'package:lxd/lxd.dart';

extension LxdOperationX on LxdOperation {
  double? get progressValue =>
      (metadata?['progress']?['percentage'] as int?).asProgressValue;
  String? get downloadProgress => metadata?['download_progress'] as String?;
  String? get unpackProgress =>
      metadata?['create_instance_from_image_unpack_progress'] as String?;
}

extension _Percentage on int? {
  double? get asProgressValue => this != null ? this! / 100.0 : null;
}
