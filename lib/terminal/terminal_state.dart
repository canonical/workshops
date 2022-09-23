import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:lxd/lxd.dart';
import 'package:lxd_service/lxd_service.dart';
import 'package:lxd_terminal/lxd_terminal.dart';

part 'terminal_state.freezed.dart';

@freezed
class TerminalState with _$TerminalState {
  const TerminalState._();
  const factory TerminalState.none() = TerminalNone;
  const factory TerminalState.error([String? message]) = TerminalError;
  const factory TerminalState.create(String name, LxdOperation op) =
      TerminalCreate;
  const factory TerminalState.init(LxdInstance instance, LxdFeature feature) =
      TerminalInit;
  const factory TerminalState.config(LxdInstance instance, LxdFeature feature) =
      TerminalConfig;
  const factory TerminalState.stage(LxdInstance instance, LxdOperation op) =
      TerminalStage;
  const factory TerminalState.start(LxdInstance instance, LxdOperation op) =
      TerminalStart;
  const factory TerminalState.restart(LxdInstance instance, LxdOperation op) =
      TerminalRestart;
  const factory TerminalState.running(
      LxdInstance instance, LxdTerminal terminal) = TerminalRunning;
  const factory TerminalState.stop(LxdInstance instance, LxdOperation op) =
      TerminalStop;

  LxdInstance? get instance {
    return when(
      none: () => null,
      error: (message) => null,
      create: (name, op) => null,
      init: (instance, feature) => instance,
      config: (instance, feature) => instance,
      stage: (instance, op) => instance,
      start: (instance, op) => instance,
      restart: (instance, op) => instance,
      running: (instance, terminal) => instance,
      stop: (instance, op) => instance,
    );
  }
}
