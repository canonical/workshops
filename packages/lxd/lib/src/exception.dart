import 'package:meta/meta.dart';

@immutable
class LxdException implements Exception {
  const LxdException(this.errorCode, {required this.error});

  final int errorCode;
  final String error;

  @override
  String toString() => '$errorCode: $error';

  @override
  int get hashCode => Object.hash(errorCode, error);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is LxdException &&
        other.errorCode == errorCode &&
        other.error == error;
  }
}
