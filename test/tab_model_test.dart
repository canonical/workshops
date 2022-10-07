import 'package:flutter_test/flutter_test.dart';
import 'package:workshops/tabs/tab_item.dart';
import 'package:workshops/tabs/tab_model.dart';

void main() {
  test('defaults', () {
    final model = TabModel();
    expect(model.length, 1);
    expect(model.currentIndex, 0);
    expect(model.tabs, [model.currentTab]);
  });

  test('add/remove', () {
    final model = TabModel();

    var wasNotified = 0;
    var expectedNotified = 0;
    model.addListener(() => ++wasNotified);

    model.newTab();
    expect(model.length, 2);
    expect(model.currentIndex, 1);
    expect(wasNotified, ++expectedNotified);

    model.newTab();
    expect(model.length, 3);
    expect(model.currentIndex, 2);
    expect(wasNotified, ++expectedNotified);

    final tabs = List.of(model.tabs);

    model.closeTab();
    expect(model.length, 2);
    expect(model.currentIndex, 1);
    expect(model.tabs, [tabs[0], tabs[1]]);
    expect(wasNotified, ++expectedNotified);

    model.removeTab(0);
    expect(model.length, 1);
    expect(model.currentIndex, 0);
    expect(model.tabs, [tabs[1]]);
    expect(wasNotified, ++expectedNotified);
  });

  test('move', () {
    final model = TabModel();
    for (var i = 0; i < 2; ++i) {
      model.newTab();
    }
    expect(model.length, 3);
    expect(model.currentIndex, 2);

    var wasNotified = 0;
    var expectedNotified = 0;
    model.addListener(() => ++wasNotified);

    final tabs = List.of(model.tabs);

    model.moveTab(0, 1);
    expect(model.currentIndex, 2);
    expect(model.tabs, [tabs[1], tabs[0], tabs[2]]);
    expect(wasNotified, ++expectedNotified);

    model.moveTab(2, 1);
    expect(model.currentIndex, 1);
    expect(model.tabs, [tabs[1], tabs[2], tabs[0]]);
    expect(wasNotified, ++expectedNotified);

    model.moveTab(0, 1);
    expect(model.currentIndex, 0);
    expect(model.tabs, [tabs[2], tabs[1], tabs[0]]);
    expect(wasNotified, ++expectedNotified);
  });

  test('next', () {
    final model = TabModel();
    for (var i = 0; i < 2; ++i) {
      model.newTab();
    }
    expect(model.length, 3);
    expect(model.currentIndex, 2);

    var wasNotified = 0;
    var expectedNotified = 0;
    model.addListener(() => ++wasNotified);

    model.nextTab();
    expect(model.currentIndex, 0);
    expect(wasNotified, ++expectedNotified);

    model.nextTab();
    expect(model.currentIndex, 1);
    expect(wasNotified, ++expectedNotified);

    model.nextTab();
    expect(model.currentIndex, 2);
    expect(wasNotified, ++expectedNotified);
  });

  test('prev', () {
    final model = TabModel();
    for (var i = 0; i < 2; ++i) {
      model.newTab();
    }
    expect(model.length, 3);
    expect(model.currentIndex, 2);

    var wasNotified = 0;
    var expectedNotified = 0;
    model.addListener(() => ++wasNotified);

    model.previousTab();
    expect(model.currentIndex, 1);
    expect(wasNotified, ++expectedNotified);

    model.previousTab();
    expect(model.currentIndex, 0);
    expect(wasNotified, ++expectedNotified);

    model.previousTab();
    expect(model.currentIndex, 2);
    expect(wasNotified, ++expectedNotified);
  });

  test('dispose', () {
    final model = TabModel();
    final tab = TestTabItem();
    model.tabs.add(tab);
    model.dispose();
    expect(tab.wasDisposed, isTrue);
  });
}

class TestTabItem extends TabItem {
  bool wasDisposed = false;

  @override
  void dispose() {
    wasDisposed = true;
    super.dispose();
  }
}
