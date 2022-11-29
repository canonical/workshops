// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'response.freezed.dart';
part 'response.g.dart';

@Freezed(unionKey: 'type')
class LxdResponse with _$LxdResponse {
  // Response retuned when a sync request is completed.
  @FreezedUnionValue('sync')
  const factory LxdResponse.sync({
    required String status,
    required int statusCode,
    required dynamic metadata,
  }) = LxdSyncResponse;

  // Response retuned when an async request has been started.
  @FreezedUnionValue('async')
  const factory LxdResponse.async({
    required String status,
    required int statusCode,
    required String operation,
    required Map<String, dynamic> metadata,
  }) = LxdAsyncResponse;

  // Response retuned when an error occurred.
  @FreezedUnionValue('error')
  const factory LxdResponse.error({
    required String error,
    required int errorCode,
    required Map<String, dynamic>? metadata,
  }) = LxdErrorResponse;

  factory LxdResponse.fromJson(Map<String, dynamic> json) =>
      _$LxdResponseFromJson(json);
}
