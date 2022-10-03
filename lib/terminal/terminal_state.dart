import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:lxd/lxd.dart';

import 'terminal_instance.dart';

part 'terminal_state.freezed.dart';

@freezed
class TerminalState with _$TerminalState {
  const TerminalState._();
  const factory TerminalState.none() = TerminalNone;
  const factory TerminalState.error([String? message]) = TerminalError;
  const factory TerminalState.running(
      LxdInstance instance, TerminalInstance terminal) = TerminalRunning;

  LxdInstance? get instance {
    return when(
      none: () => null,
      error: (message) => null,
      running: (instance, terminal) => instance,
    );
  }
}
