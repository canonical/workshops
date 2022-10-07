import 'package:flutter/foundation.dart';

class MovableTabController<T> extends ChangeNotifier {
  MovableTabController({List<T>? tabs, int? currentIndex})
      : _tabs = tabs ?? [],
        _currentIndex = currentIndex ?? (tabs?.length ?? 0) - 1;

  final List<T> _tabs;
  int _currentIndex;

  int get length => _tabs.length;
  List<T> get tabs => _tabs;

  T get currentTab => _tabs[currentIndex];

  int get currentIndex => _currentIndex;
  set currentIndex(int index) {
    if (_currentIndex == index) return;
    _currentIndex = index;
    notifyListeners();
  }

  void addTab(T tab) {
    _tabs.add(tab);
    currentIndex = _tabs.length - 1;
  }

  T removeTab(int index) {
    final tab = _tabs.removeAt(index);
    _currentIndex = _currentIndex.clamp(0, _tabs.length - 1);
    notifyListeners();
    return tab;
  }

  void moveTab(int from, int to) {
    _tabs.move(from, to);
    if (_currentIndex == to) {
      _currentIndex = from;
    } else if (_currentIndex == from) {
      _currentIndex = to;
    }
    notifyListeners();
  }

  void nextTab() {
    currentIndex = (_currentIndex + 1) % _tabs.length;
  }

  void previousTab() {
    final index = currentIndex - 1;
    currentIndex = index < 0 ? _tabs.length - 1 : index;
  }
}

extension ListX<T> on List<T> {
  void move(int from, int to) {
    final tmp = this[from];
    this[from] = this[to];
    this[to] = tmp;
  }
}
