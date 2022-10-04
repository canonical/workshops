import 'package:lxd/lxd.dart';
import 'package:lxd_service/lxd_service.dart';
import 'package:safe_change_notifier/safe_change_notifier.dart';
import 'package:terminal_view/terminal_view.dart';

import 'terminal_instance.dart';
import 'terminal_state.dart';

const kTimeout = Duration(seconds: 10);

class TerminalModel extends SafeChangeNotifier {
  TerminalModel(this._service);

  final LxdService _service;
  var _state = const TerminalState.none();

  TerminalState get state => _state;

  void _setState(TerminalState state) {
    if (_state == state) return;
    _state = state;
    notifyListeners();
  }

  Future<void> start(LxdInstance instance) async {
    final start = await _service.startInstance(instance.name);
    await _service.waitOperation(start.id);
    await _service.waitVmAgent(instance.name);
    return run(instance);
  }

  Future<void> run(LxdInstance instance) async {
    // TODO: configurable max lines
    final terminal = TerminalInstance(
      controller: TerminalController(),
      maxLines: 10000,
    );
    _setState(TerminalState.running(instance, terminal));

    final socket = await _service.execTerminal(instance);
    socket.resize(terminal.viewWidth, terminal.viewHeight);
    socket.listen(terminal.write);
    terminal.onOutput = socket.write;
    terminal.onResize = (width, height, _, __) => socket.resize(width, height);
    return _service.waitOperation(socket.operation.id).then((_) => reset());
  }

  void reset() => _setState(const TerminalState.none());
}
