import 'package:lxd/lxd.dart';
import 'package:movable_tabs/movable_tabs.dart';

import 'tab_item.dart';

class TabModel extends MovableTabController<TabItem> {
  TabModel() : super(tabs: [TabItem()], currentIndex: 0);

  @override
  set currentIndex(int index) {
    super.currentIndex = index;
    currentTab.focusScope.requestFocus();
  }

  void newTab([LxdInstance? instance]) => addTab(TabItem(instance));
  void closeTab() => removeTab(currentIndex);

  @override
  TabItem removeTab(int index) => super.removeTab(index)..dispose();

  @override
  void dispose() {
    for (final tab in tabs) {
      tab.dispose();
    }
    super.dispose();
  }
}
