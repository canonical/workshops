import 'package:flutter/foundation.dart';
import 'package:lxd/lxd.dart';
import 'package:lxd_service/lxd_service.dart';
import 'package:lxd_x/lxd_x.dart';
import 'package:terminal_view/terminal_view.dart';

import '../remotes/remote.dart';
import '../terminal/terminal_state.dart';

class HomeModel extends ChangeNotifier {
  HomeModel(this._service);

  final LxdService _service;

  var _currentIndex = 0;
  final _terminals = <TerminalState>[const TerminalState.none()];

  int get length => _terminals.length;
  List<TerminalState> get terminals => _terminals;

  TerminalState? terminal(int index) => _terminals.elementAtOrNull(index);
  TerminalState get currentTerminal => terminal(_currentIndex)!;

  Terminal? running(int index) =>
      terminal(index)?.whenOrNull(running: (terminal) => terminal);
  Terminal? get currentRunning => running(_currentIndex);

  int get currentIndex => _currentIndex;
  set currentIndex(int index) {
    if (_currentIndex == index) return;
    _currentIndex = index;
    notifyListeners();
  }

  void add([TerminalState terminal = const TerminalState.none()]) {
    _terminals.add(terminal);
    currentIndex = _terminals.length - 1;
  }

  void close() => closeAt(_currentIndex);

  void closeAt(int index) {
    _terminals.removeAt(index);
    currentIndex = _currentIndex.clamp(0, _terminals.length - 1);
  }

  void move(int from, int to) {
    _terminals.move(from, to);
    if (_currentIndex == to) {
      currentIndex = from;
    } else if (_currentIndex == from) {
      currentIndex = to;
    }
  }

  void next() {
    currentIndex = _currentIndex % _terminals.length;
  }

  void prev() {
    final index = currentIndex - 1;
    currentIndex = index < 0 ? _terminals.length - 1 : index;
  }

  Future<void> create(LxdImage image, {String? name, Remote? remote}) async {
    final create = await _service.client.createInstance(
      source: image,
      name: name,
      server: remote?.isLocal == false ? remote!.address : null,
    );
    _setState(_currentIndex, TerminalState.loading(create));

    final wait = await _service.client.waitOperation(create.id);
    if (wait.statusCode == LxdStatusCode.cancelled.value) {
      reset();
    } else {
      name = create.instances!.single.split('/').last;
      return start(name);
    }
  }

  Future<void> start(String name) async {
    final start = await _service.client.startInstance(name);
    _setState(_currentIndex, TerminalState.loading(start));

    final wait = await _service.client.waitOperation(start.id);
    if (wait.statusCode == LxdStatusCode.cancelled.value) {
      reset();
    } else {
      return run(name);
    }
  }

  Future<void> run(String name) async {
    final instance = await _service.client.getInstance(name);
    _setState(
      _currentIndex,
      TerminalState.running(
        Terminal(
          client: _service.client,
          instance: instance.name,
          onExit: reset,
        ),
      ),
    );
  }

  Future<void> stop(String name) => _service.client.stopInstance(name);

  Future<void> delete(String name) => _service.client.deleteInstance(name);

  void reset() => _setState(_currentIndex, const TerminalState.none());

  void _setState(int index, TerminalState terminal) {
    if (_terminals[index] == terminal) return;
    _terminals[index] = terminal;
    notifyListeners();
  }
}

extension ListX<T> on List<T> {
  T? elementAtOrNull(int index) {
    if (index < 0 || index >= length) return null;
    return this[index];
  }

  void move(int from, int to) {
    final tmp = this[from];
    this[from] = this[to];
    this[to] = tmp;
  }
}
