import 'package:lxd/lxd.dart';
import 'package:lxd_service/lxd_service.dart';
import 'package:safe_change_notifier/safe_change_notifier.dart';

import 'terminal_model.dart';

typedef TerminalListener = void Function(Object key, TerminalModel terminal);

class TerminalManager extends SafeChangeNotifier {
  TerminalManager(this._service);

  final LxdService _service;

  final _terminals = <Object, TerminalModel>{};
  TerminalListener? _onCreate;
  TerminalListener? _onClose;

  void listen({TerminalListener? onCreate, TerminalListener? onClose}) {
    _onCreate = onCreate;
    _onClose = onClose;
  }

  TerminalModel get(Object key, LxdInstance instance) {
    return _terminals[key] ??= create(key, instance);
  }

  TerminalModel create(Object key, LxdInstance instance) {
    final terminal = TerminalModel(_service);
    _onCreate?.call(key, terminal);
    terminal.execute(instance).then((_) => close(key));
    return terminal;
  }

  void close(Object key) {
    final terminal = _terminals.remove(key);
    if (terminal != null) {
      _onClose?.call(key, terminal);
      terminal.dispose();
    }
    notifyListeners();
  }

  @override
  void dispose() {
    for (final terminal in _terminals.values) {
      terminal.dispose();
    }
    _terminals.clear();
    super.dispose();
  }
}
