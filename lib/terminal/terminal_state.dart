import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:lxd/lxd.dart';
import 'package:terminal_view/terminal_view.dart';

part 'terminal_state.freezed.dart';

@freezed
class TerminalState with _$TerminalState {
  const factory TerminalState.none() = TerminalNone;
  const factory TerminalState.error([String? message]) = TerminalError;
  const factory TerminalState.create(LxdOperation op) = TerminalCreate;
  const factory TerminalState.config(String name) = TerminalConfig;
  const factory TerminalState.start(LxdOperation op) = TerminalStart;
  const factory TerminalState.restart(LxdOperation op) = TerminalRestart;
  const factory TerminalState.running(Terminal terminal) = TerminalRunning;
}
