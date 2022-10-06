import 'package:lxd/lxd.dart';
import 'package:lxd_service/lxd_service.dart';
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

  TerminalState get state => _state;

  @override
  Terminal get terminal => _terminal;

  @override
  TerminalController get controller => _controller;

  void _setState(TerminalState state) {
    if (_state == state) return;
    _state = state;
    notifyListeners();
  }

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
