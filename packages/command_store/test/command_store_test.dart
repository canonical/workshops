import 'package:command_store/command_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';

import 'command_store_test.mocks.dart';

@GenerateMocks([ShortcutSettings])
void main() {
  testWidgets('inherited shortcuts', (tester) async {
    final shortcuts = MockShortcutSettings();

    await tester.pumpWidget(CommandStore(
      shortcuts: shortcuts,
      child: Builder(builder: (context) => const MaterialApp()),
    ));

    expect(CommandStore.shortcutsOf(tester.element(find.byType(MaterialApp))),
        shortcuts);
  });

  testWidgets('missing store', (tester) async {
    await tester.pumpWidget(const MaterialApp());

    expect(
        () =>
            CommandStore.shortcutsOf(tester.element(find.byType(MaterialApp))),
        throwsAssertionError);
  });
}
