import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:lxd/lxd.dart';
import 'package:lxd_service/lxd_service.dart';

part 'progress_state.freezed.dart';

@freezed
class ProgressState with _$ProgressState {
  const ProgressState._();
  const factory ProgressState.none() = ProgressNone;
  const factory ProgressState.error([String? message]) = ProgressError;
  const factory ProgressState.create(String name, LxdOperation op) =
      ProgressCreate;
  const factory ProgressState.init(LxdInstance instance, LxdFeature feature) =
      ProgressInit;
  const factory ProgressState.config(LxdInstance instance, LxdFeature feature) =
      ProgressConfig;
  const factory ProgressState.stage(LxdInstance instance, LxdOperation op) =
      ProgressStage;
  const factory ProgressState.start(LxdInstance instance, LxdOperation op) =
      ProgressStart;
  const factory ProgressState.stop(LxdInstance instance, LxdOperation op) =
      ProgressStop;
  const factory ProgressState.delete(LxdInstance instance, LxdOperation op) =
      ProgressDelete;

  LxdInstance? get instance {
    return when(
      none: () => null,
      error: (message) => null,
      create: (name, op) => null,
      init: (instance, feature) => instance,
      config: (instance, feature) => instance,
      stage: (instance, op) => instance,
      start: (instance, op) => instance,
      stop: (instance, op) => instance,
      delete: (instance, op) => instance,
    );
  }

  LxdOperation? get operation {
    return when(
      none: () => null,
      error: (message) => null,
      create: (name, op) => op,
      init: (instance, feature) => null,
      config: (instance, feature) => null,
      stage: (instance, op) => op,
      start: (instance, op) => op,
      stop: (instance, op) => op,
      delete: (instance, op) => op,
    );
  }

  LxdFeature? get feature {
    return when(
      none: () => null,
      error: (message) => null,
      create: (name, op) => null,
      init: (instance, feature) => feature,
      config: (instance, feature) => feature,
      stage: (instance, op) => null,
      start: (instance, op) => null,
      stop: (instance, op) => null,
      delete: (instance, op) => null,
    );
  }
}
