import 'package:flutter_test/flutter_test.dart';
import 'package:movable_tabs/movable_tabs.dart';

void main() {
  test('defaults', () {
    final controller = MovableTabController();
    expect(controller.length, 0);
    expect(controller.currentIndex, -1);
    expect(controller.tabs, []);
  });

  test('constructor', () {
    final tabs = [Object(), Object(), Object()];
    final controller = MovableTabController(tabs: tabs, currentIndex: 1);
    expect(controller.length, tabs.length);
    expect(controller.currentIndex, 1);
    expect(controller.tabs, tabs);
  });

  test('add/remove', () {
    final controller = MovableTabController(tabs: [Object()]);

    var wasNotified = 0;
    var expectedNotified = 0;
    controller.addListener(() => ++wasNotified);

    controller.addTab(Object());
    expect(controller.length, 2);
    expect(controller.currentIndex, 1);
    expect(wasNotified, ++expectedNotified);

    controller.addTab(Object());
    expect(controller.length, 3);
    expect(controller.currentIndex, 2);
    expect(wasNotified, ++expectedNotified);

    final tabs = List.of(controller.tabs);

    controller.removeTab(2);
    expect(controller.length, 2);
    expect(controller.currentIndex, 1);
    expect(controller.tabs, [tabs[0], tabs[1]]);
    expect(wasNotified, ++expectedNotified);

    controller.removeTab(0);
    expect(controller.length, 1);
    expect(controller.currentIndex, 0);
    expect(controller.tabs, [tabs[1]]);
    expect(wasNotified, ++expectedNotified);
  });

  test('move', () {
    final controller = MovableTabController(tabs: List.generate(3, (i) => i));
    expect(controller.length, 3);
    expect(controller.currentIndex, 2);

    var wasNotified = 0;
    var expectedNotified = 0;
    controller.addListener(() => ++wasNotified);

    final tabs = List.of(controller.tabs);

    controller.moveTab(0, 1);
    expect(controller.currentIndex, 2);
    expect(controller.tabs, [tabs[1], tabs[0], tabs[2]]);
    expect(wasNotified, ++expectedNotified);

    controller.moveTab(2, 1);
    expect(controller.currentIndex, 1);
    expect(controller.tabs, [tabs[1], tabs[2], tabs[0]]);
    expect(wasNotified, ++expectedNotified);

    controller.moveTab(0, 1);
    expect(controller.currentIndex, 0);
    expect(controller.tabs, [tabs[2], tabs[1], tabs[0]]);
    expect(wasNotified, ++expectedNotified);

    controller.moveTab(0, 2);
    expect(controller.currentIndex, 2);
    expect(controller.tabs, [tabs[1], tabs[0], tabs[2]]);
    expect(wasNotified, ++expectedNotified);
  });

  test('next', () {
    final controller = MovableTabController(tabs: List.generate(3, (i) => i));
    expect(controller.length, 3);
    expect(controller.currentIndex, 2);

    var wasNotified = 0;
    var expectedNotified = 0;
    controller.addListener(() => ++wasNotified);

    controller.nextTab();
    expect(controller.currentIndex, 0);
    expect(wasNotified, ++expectedNotified);

    controller.nextTab();
    expect(controller.currentIndex, 1);
    expect(wasNotified, ++expectedNotified);

    controller.nextTab();
    expect(controller.currentIndex, 2);
    expect(wasNotified, ++expectedNotified);
  });

  test('prev', () {
    final controller = MovableTabController(tabs: List.generate(3, (i) => i));
    expect(controller.length, 3);
    expect(controller.currentIndex, 2);

    var wasNotified = 0;
    var expectedNotified = 0;
    controller.addListener(() => ++wasNotified);

    controller.previousTab();
    expect(controller.currentIndex, 1);
    expect(wasNotified, ++expectedNotified);

    controller.previousTab();
    expect(controller.currentIndex, 0);
    expect(wasNotified, ++expectedNotified);

    controller.previousTab();
    expect(controller.currentIndex, 2);
    expect(wasNotified, ++expectedNotified);
  });
}
