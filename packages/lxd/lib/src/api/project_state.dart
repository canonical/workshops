// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'project_state.freezed.dart';
part 'project_state.g.dart';

@freezed
class LxdProjectStateResource with _$LxdProjectStateResource {
  const factory LxdProjectStateResource({
    @JsonKey(name: 'Limit') required int limit,
    @JsonKey(name: 'Usage') required int usage,
  }) = _LxdProjectStateResource;

  factory LxdProjectStateResource.fromJson(Map<String, dynamic> json) =>
      _$LxdProjectStateResourceFromJson(json);
}

@freezed
class LxdProjectState with _$LxdProjectState {
  const factory LxdProjectState({
    required Map<String, LxdProjectStateResource> resources,
  }) = _LxdProjectState;

  factory LxdProjectState.fromJson(Map<String, dynamic> json) =>
      _$LxdProjectStateFromJson(json);
}
