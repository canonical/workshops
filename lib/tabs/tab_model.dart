import 'package:flutter/foundation.dart';
import 'package:lxd/lxd.dart';

import 'tab_item.dart';

class TabModel extends ChangeNotifier {
  var _currentIndex = 0;
  final _tabs = <TabItem>[TabItem()];

  int get length => _tabs.length;
  List<TabItem> get tabs => _tabs;

  TabItem get currentTab => _tabs[currentIndex];

  int get currentIndex => _currentIndex;
  set currentIndex(int index) {
    if (_currentIndex == index) return;
    _currentIndex = index;
    notifyListeners();
  }

  void addTab([LxdInstance? instance]) {
    final tab = TabItem(instance);
    _tabs.add(tab);
    currentIndex = _tabs.length - 1;
  }

  void closeTab([int? index]) {
    final tab = _tabs.removeAt(index ?? _currentIndex);
    tab.dispose();
    _currentIndex = _currentIndex.clamp(0, _tabs.length - 1);
    notifyListeners();
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

  @override
  void dispose() {
    for (final tab in _tabs) {
      tab.dispose();
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
