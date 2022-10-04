import 'package:flutter/foundation.dart';
import 'package:lxd_service/lxd_service.dart';

import '../terminal/terminal_instance.dart';
import '../terminal/terminal_model.dart';
import '../terminal/terminal_state.dart';

class HomeModel extends ChangeNotifier {
  HomeModel(this._service) {
    addTab();
  }

  final LxdService _service;

  var _currentIndex = -1;
  final _models = <TerminalModel>[];

  int get tabCount => _models.length;

  TerminalState? state(int index) => model(index)?.state;
  TerminalState get currentState => state(_currentIndex)!;

  TerminalInstance? terminal(int index) =>
      state(index)?.whenOrNull(running: (instance, terminal) => terminal);
  TerminalInstance? get currentTerminal => terminal(_currentIndex);

  TerminalModel? model(int index) => _models.elementAtOrNull(index);
  TerminalModel get currentModel => model(_currentIndex)!;

  int get currentIndex => _currentIndex;
  set currentIndex(int index) {
    if (_currentIndex == index) return;
    _currentIndex = index;
    notifyListeners();
  }

  void addTab() {
    final model = TerminalModel(_service);
    model.addListener(notifyListeners);
    _models.add(model);
    currentIndex = _models.length - 1;
  }

  void closeTab([int? index]) {
    final model = _models.removeAt(index ?? _currentIndex);
    model.removeListener(notifyListeners);
    model.dispose();
    currentIndex = _currentIndex.clamp(0, _models.length - 1);
  }

  void moveTab(int from, int to) {
    _models.move(from, to);
    if (_currentIndex == to) {
      currentIndex = from;
    } else if (_currentIndex == from) {
      currentIndex = to;
    }
  }

  void nextTab() {
    currentIndex = (_currentIndex + 1) % _models.length;
  }

  void previousTab() {
    final index = currentIndex - 1;
    currentIndex = index < 0 ? _models.length - 1 : index;
  }

  @override
  void dispose() {
    for (final model in _models) {
      model.removeListener(notifyListeners);
      model.dispose();
    }
    super.dispose();
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
