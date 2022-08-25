import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:lxd/lxd.dart';
import 'package:lxd_service/lxd_service.dart';
import 'package:terminal_view/terminal_view.dart';

part 'terminal_state.freezed.dart';

@freezed
class TerminalState with _$TerminalState {
  const factory TerminalState.none() = TerminalNone;
  const factory TerminalState.error([String? message]) = TerminalError;
  const factory TerminalState.create(String name, LxdOperation op) =
      TerminalCreate;
  const factory TerminalState.init(String name, LxdFeature feature) =
      TerminalInit;
  const factory TerminalState.config(String name, LxdFeature feature) =
      TerminalConfig;
  const factory TerminalState.stage(String name, LxdOperation op) =
      TerminalStage;
  const factory TerminalState.start(String name, LxdOperation op) =
      TerminalStart;
  const factory TerminalState.restart(String name, LxdOperation op) =
      TerminalRestart;
  const factory TerminalState.running(String name, Terminal terminal) =
      TerminalRunning;
  const factory TerminalState.stop(String name, LxdOperation op) = TerminalStop;
}
