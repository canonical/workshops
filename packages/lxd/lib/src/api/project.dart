// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'project.freezed.dart';
part 'project.g.dart';

@freezed
class LxdProject with _$LxdProject {
  const factory LxdProject({
    required Map<String, String> config,
    required String description,
    required String name,
  }) = _LxdProject;

  factory LxdProject.fromJson(Map<String, dynamic> json) =>
      _$LxdProjectFromJson(json);
}
