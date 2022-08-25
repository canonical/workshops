import 'package:lxd/lxd.dart';
import 'package:lxd_service/lxd_service.dart';
import 'package:lxd_x/lxd_x.dart';
import 'package:safe_change_notifier/safe_change_notifier.dart';
import 'package:terminal_view/terminal_view.dart';

import '../terminal/terminal_state.dart';

class TerminalController extends SafeChangeNotifier {
  TerminalController(this._service);

  final LxdService _service;
  var _state = const TerminalState.none();

  TerminalState get state => _state;

  void _setState(TerminalState state) {
    if (_state == state) return;
    _state = state;
    notifyListeners();
  }

  Future<String?> create(LxdImage image, {LxdRemote? remote}) async {
    final create = await _service.createInstance(image, remote: remote);
    _setState(TerminalState.create(create));

    final wait = await _service.waitOperation(create.id);
    if (wait.statusCode == LxdStatusCode.cancelled.value) {
      reset();
      return null;
    }
    return create.instances!.single;
  }

  Future<bool> configure(String name, LxdImage image) async {
    _setState(TerminalState.config(name));
    await _service.initInstance(name, image);
    return true;
  }

  Future<bool> restart(String name) async {
    final restart = await _service.restartInstance(name);
    _setState(TerminalState.restart(restart));

    final wait = await _service.waitOperation(restart.id);
    if (wait.statusCode == LxdStatusCode.cancelled.value) {
      reset();
      return false;
    }
    return true;
  }

  Future<bool> start(String name) async {
    final start = await _service.startInstance(name);
    _setState(TerminalState.start(start));

    final wait = await _service.waitOperation(start.id);
    if (wait.statusCode == LxdStatusCode.cancelled.value) {
      reset();
      return false;
    }
    return true;
  }

  Future<void> run(String name) async {
    final instance = await _service.getInstance(name);
    _setState(
      TerminalState.running(
        Terminal(
          client: _service.getClient(),
          instance: instance,
          onExit: reset,
        ),
      ),
    );
  }

  Future<void> stop(String name) => _service.stopInstance(name);

  Future<void> delete(String name) => _service.deleteInstance(name);

  void reset() => _setState(const TerminalState.none());
}
