import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:shortcut_store/shortcut_store.dart';

import 'shortcut_store_test.mocks.dart';

@GenerateMocks([ShortcutSettings])
void main() {
  testWidgets('inherited', (tester) async {
    final settings = MockShortcutSettings();

    await tester.pumpWidget(ShortcutStore(
      settings: settings,
      child: Builder(builder: (context) => const MaterialApp()),
    ));

    expect(
        ShortcutStore.of(tester.element(find.byType(MaterialApp))), settings);
  });

  testWidgets('missing', (tester) async {
    await tester.pumpWidget(const MaterialApp());

    expect(() => ShortcutStore.of(tester.element(find.byType(MaterialApp))),
        throwsAssertionError);
  });
}
