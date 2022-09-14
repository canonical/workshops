import 'package:context_menu/context_menu.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

const kWindowSize = Size(600, 400);

void main() {
  testWidgets('items', (tester) async {
    await tester.pumpContextMenu();

    expect(find.text('Foo'), findsNothing);
    expect(find.text('Bar'), findsNothing);
    expect(find.text('Baz'), findsNothing);

    await tester.rightClick();
    await tester.pumpAndSettle();

    expect(find.text('Foo'), findsOneWidget);
    expect(find.text('Bar'), findsOneWidget);
    expect(find.text('Baz'), findsOneWidget);
  });

  testWidgets('center', (tester) async {
    await tester.pumpContextMenu();

    await tester.rightClick(kWindowSize.center(Offset.zero));
    await tester.pumpAndSettle();

    final foo = tester.getRect(find.text('Foo'));
    expect(foo.top, greaterThan(kWindowSize.height / 2));
    expect(foo.left, greaterThan(kWindowSize.width / 2));
    expect(foo.right, lessThan(kWindowSize.height));
    expect(foo.bottom, lessThan(kWindowSize.width));

    final bar = tester.getRect(find.text('Bar'));
    expect(bar.left, equals(foo.left));
    expect(bar.top, greaterThan(foo.bottom));
    expect(bar.right, equals(foo.right));

    final baz = tester.getRect(find.text('Baz'));
    expect(baz.left, equals(bar.left));
    expect(baz.top, greaterThan(bar.bottom));
    expect(baz.right, equals(bar.right));
  });

  testWidgets('top-left', (tester) async {
    await tester.pumpContextMenu();

    await tester.rightClick(kWindowSize.topLeft(Offset.zero));
    await tester.pumpAndSettle();

    final foo = tester.getRect(find.text('Foo'));
    expect(foo.left, greaterThan(0));
    expect(foo.top, greaterThan(0));
    expect(foo.right, lessThan(kWindowSize.width / 2));
    expect(foo.bottom, lessThan(kWindowSize.height / 2));

    final bar = tester.getRect(find.text('Bar'));
    expect(bar.left, equals(foo.left));
    expect(bar.top, greaterThan(foo.bottom));
    expect(bar.right, equals(foo.right));

    final baz = tester.getRect(find.text('Baz'));
    expect(baz.left, equals(bar.left));
    expect(baz.top, greaterThan(bar.bottom));
    expect(baz.right, equals(bar.right));
  });

  testWidgets('top-right', (tester) async {
    await tester.pumpContextMenu();

    await tester.rightClick(kWindowSize.topRight(const Offset(-1, 0)));
    await tester.pumpAndSettle();

    final foo = tester.getRect(find.text('Foo'));
    expect(foo.left, greaterThan(kWindowSize.width / 2));
    expect(foo.top, greaterThan(0));
    expect(foo.right, lessThan(kWindowSize.width));
    expect(foo.bottom, lessThan(kWindowSize.height / 2));

    final bar = tester.getRect(find.text('Bar'));
    expect(bar.left, equals(foo.left));
    expect(bar.top, greaterThan(foo.bottom));
    expect(bar.right, equals(foo.right));

    final baz = tester.getRect(find.text('Baz'));
    expect(baz.left, equals(bar.left));
    expect(baz.top, greaterThan(bar.bottom));
    expect(baz.right, equals(bar.right));
  });

  testWidgets('bottom-left', (tester) async {
    await tester.pumpContextMenu();

    await tester.rightClick(kWindowSize.bottomLeft(const Offset(0, -1)));
    await tester.pumpAndSettle();

    final foo = tester.getRect(find.text('Foo'));
    expect(foo.left, greaterThan(0));
    expect(foo.top, greaterThan(kWindowSize.height / 2));
    expect(foo.right, lessThan(kWindowSize.width / 2));
    expect(foo.bottom, lessThan(kWindowSize.height));

    final bar = tester.getRect(find.text('Bar'));
    expect(bar.left, equals(foo.left));
    expect(bar.top, greaterThan(foo.bottom));
    expect(bar.right, equals(foo.right));

    final baz = tester.getRect(find.text('Baz'));
    expect(baz.left, equals(bar.left));
    expect(baz.top, greaterThan(bar.bottom));
    expect(baz.right, equals(bar.right));
  });

  testWidgets('bottom-right', (tester) async {
    await tester.pumpContextMenu();

    await tester.rightClick(kWindowSize.bottomRight(const Offset(-1, -1)));
    await tester.pumpAndSettle();

    final foo = tester.getRect(find.text('Foo'));
    expect(foo.left, greaterThan(kWindowSize.width / 2));
    expect(foo.top, greaterThan(kWindowSize.height / 2));
    expect(foo.right, lessThan(kWindowSize.width));
    expect(foo.bottom, lessThan(kWindowSize.height));

    final bar = tester.getRect(find.text('Bar'));
    expect(bar.left, equals(foo.left));
    expect(bar.top, greaterThan(foo.bottom));
    expect(bar.right, equals(foo.right));

    final baz = tester.getRect(find.text('Baz'));
    expect(baz.left, equals(bar.left));
    expect(baz.top, greaterThan(bar.bottom));
    expect(baz.right, equals(bar.right));
  });
}

extension ContextMenuTester on WidgetTester {
  Future<void> pumpContextMenu() {
    binding.window.physicalSizeTestValue = kWindowSize;
    binding.window.devicePixelRatioTestValue = 1.0;
    return pumpWidget(MaterialApp(
      home: Scaffold(
        body: ContextMenuArea(
          builder: (context, position) => ['Foo', 'Bar', 'Baz']
              .map((item) => ContextMenuItem(child: Text(item)))
              .toList(),
        ),
      ),
    ));
  }

  Future<void> rightClick([Offset? position]) async {
    position ??= kWindowSize.center(Offset.zero);
    return tapAt(position, buttons: kSecondaryMouseButton);
  }
}
