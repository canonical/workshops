import 'package:flutter/foundation.dart';
import 'package:lxd/lxd.dart';
import 'package:lxd_service/lxd_service.dart';
import 'package:lxd_terminal/lxd_terminal.dart';

import '../terminal/terminal_controller.dart';
import '../terminal/terminal_state.dart';

class HomeModel extends ChangeNotifier {
  HomeModel(this._service) {
    addTab();
  }

  final LxdService _service;

  var _currentIndex = -1;
  final _controllers = <TerminalController>[];

  int get tabCount => _controllers.length;

  TerminalState? state(int index) => controller(index)?.state;
  TerminalState get currentState => state(_currentIndex)!;

  LxdTerminal? terminal(int index) =>
      state(index)?.whenOrNull(running: (instance, terminal) => terminal);
  LxdTerminal? get currentTerminal => terminal(_currentIndex);

  TerminalController? controller(int index) =>
      _controllers.elementAtOrNull(index);
  TerminalController get currentController => controller(_currentIndex)!;

  int get currentIndex => _currentIndex;
  set currentIndex(int index) {
    if (_currentIndex == index) return;
    _currentIndex = index;
    notifyListeners();
  }

  void addTab() {
    final controller = TerminalController(_service);
    controller.addListener(notifyListeners);
    _controllers.add(controller);
    currentIndex = _controllers.length - 1;
  }

  void closeTab([int? index]) {
    final controller = _controllers.removeAt(index ?? _currentIndex);
    controller.removeListener(notifyListeners);
    controller.dispose();
    currentIndex = _currentIndex.clamp(0, _controllers.length - 1);
  }

  void moveTab(int from, int to) {
    _controllers.move(from, to);
    if (_currentIndex == to) {
      currentIndex = from;
    } else if (_currentIndex == from) {
      currentIndex = to;
    }
  }

  void nextTab() {
    currentIndex = (_currentIndex + 1) % _controllers.length;
  }

  void previousTab() {
    final index = currentIndex - 1;
    currentIndex = index < 0 ? _controllers.length - 1 : index;
  }

  Future<void> createInstance(LxdImage image, {LxdRemote? remote}) async {
    final instance = await currentController.create(image, remote: remote);
    if (instance != null) {
      return configureInstance(instance, image);
    }
  }

  Future<void> configureInstance(LxdInstance instance, LxdImage image) async {
    if (await currentController.configure(instance, image)) {
      return startInstance(instance);
    }
  }

  Future<void> startInstance(LxdInstance instance) async {
    if (await currentController.start(instance)) {
      return runInstance(instance);
    }
  }

  Future<void> runInstance(LxdInstance instance) {
    return currentController.run(instance);
  }

  Future<void> stopInstance(LxdInstance instance) {
    return _service.stopInstance(instance.name);
  }

  Future<void> deleteInstance(LxdInstance instance) {
    return _service.deleteInstance(instance.name);
  }

  @override
  void dispose() {
    for (final controller in _controllers) {
      controller.removeListener(notifyListeners);
      controller.dispose();
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
