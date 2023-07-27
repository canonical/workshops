import 'package:flutter/widgets.dart';
import 'package:lxd/lxd.dart';
import 'package:lxd_service/lxd_service.dart';
import 'package:lxd_x/lxd_x.dart';
import 'package:safe_change_notifier/safe_change_notifier.dart';
import 'package:terminal_view/terminal_view.dart';

const kTimeout = Duration(seconds: 10);

enum TerminalState {
  none,
  error, // TODO: error handling
  starting,
  running,
}

class TerminalModel extends SafeChangeNotifier with TerminalMixin {
  TerminalModel(this._service);

  final LxdService _service;
  var _state = TerminalState.none;
  // TODO: configurable max lines
  final _terminal = Terminal(maxLines: 10000);
  final _controller = TerminalController();
  final _focusNode = FocusNode();
  LxdTerminal? _op;

  TerminalState get state => _state;

  @override
  Terminal get terminal => _terminal;

  @override
  TerminalController get controller => _controller;

  FocusNode get focusNode => _focusNode;

  void _setState(TerminalState state) {
    if (_state == state) return;
    _state = state;
    notifyListeners();
  }

  Future<void> execute(LxdInstance instance) async {
    final state = await _service.getInstance(instance.id);
    if (!state.isRunning) {
      _setState(TerminalState.starting);

      final start = await _service.startInstance(instance.id);
      await _service.waitOperation(start.id);
      await _service.waitVmAgent(instance.id);
    }

    _setState(TerminalState.running);

    _op = await _service.execTerminal(instance.id);
    _op!.resize(terminal.viewWidth, terminal.viewHeight);
    _op!.listen(terminal.write);
    terminal.onOutput = (data) => _op?.write(data);
    terminal.onResize = (width, height, _, __) => _op?.resize(width, height);
    await _service.waitOperation(_op!.id);
  }

  Future<void> close() async {
    await _op?.close();
    _op = null;
    _setState(TerminalState.none);
  }

  @override
  Future<void> dispose() async {
    await close();
    _focusNode.dispose();
    super.dispose();
  }
}
