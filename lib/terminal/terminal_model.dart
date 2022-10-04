import 'package:lxd/lxd.dart';
import 'package:lxd_service/lxd_service.dart';
import 'package:safe_change_notifier/safe_change_notifier.dart';
import 'package:terminal_view/terminal_view.dart';

import 'terminal_instance.dart';

const kTimeout = Duration(seconds: 10);

enum TerminalState {
  none,
  error, // TODO: error handling
  starting,
  running,
}

class TerminalModel extends SafeChangeNotifier {
  TerminalModel(this._service);

  final LxdService _service;
  var _state = TerminalState.none;

  TerminalState get state => _state;

  void _setState(TerminalState state) {
    if (_state == state) return;
    _state = state;
    notifyListeners();
  }

  // TODO: configurable max lines
  final terminal = TerminalInstance(
    controller: TerminalController(),
    maxLines: 10000,
  );

  Future<void> execute(LxdInstance instance) async {
    _setState(TerminalState.starting);

    final start = await _service.startInstance(instance.name);
    await _service.waitOperation(start.id);
    await _service.waitVmAgent(instance.name);

    _setState(TerminalState.running);

    final socket = await _service.execTerminal(instance.name);
    socket.resize(terminal.viewWidth, terminal.viewHeight);
    socket.listen(terminal.write);
    terminal.onOutput = socket.write;
    terminal.onResize = (width, height, _, __) => socket.resize(width, height);
    await _service.waitOperation(socket.operation.id);
  }
}
