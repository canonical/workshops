import 'package:collection/collection.dart';
import 'package:meta/meta.dart';

import 'api/instance.dart';
import 'constants.dart';

/// Identifies an LXD instance
@immutable
class LxdInstanceId {
  const LxdInstanceId(this.name, {this.project = kLxdDefaultProject});

  /// Name associated with the instance
  final String name;

  /// Project associated with the instance
  final String project;

  factory LxdInstanceId.fromPath(String path) {
    final uri = Uri.tryParse(path);
    return LxdInstanceId(
      uri?.pathSegments.lastOrNull ?? path.split('/').last,
      project: uri?.queryParameters['project'] ?? kLxdDefaultProject,
    );
  }

  @override
  int get hashCode => Object.hash(name, project);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is LxdInstanceId &&
        other.name == name &&
        other.project == project;
  }

  @override
  String toString() {
    return Uri(
      path: name,
      queryParameters: {'project': project},
    ).toString();
  }
}

extension LxdInstanceIdX on LxdInstance {
  LxdInstanceId get id => LxdInstanceId(name, project: project);
}
