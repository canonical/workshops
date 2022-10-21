import 'package:command_store/command_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'command_store_test.mocks.dart';

@GenerateMocks([ShortcutSettings])
void main() {
  testWidgets('inherited commands', (tester) async {
    var foo = 0;
    var bar = 0;

    final fi = VoidCallbackIntent(() => ++foo);
    final bi = VoidCallbackIntent(() => ++bar);

    final a = LogicalKeySet(LogicalKeyboardKey.alt, LogicalKeyboardKey.keyA);
    final b = LogicalKeySet(LogicalKeyboardKey.meta, LogicalKeyboardKey.keyB);
    final c = LogicalKeySet(LogicalKeyboardKey.shift, LogicalKeyboardKey.keyC);

    final commands = [
      Command(id: 'foo', intent: fi),
      Command(id: 'bar', intent: bi),
    ];

    final shortcuts = MockShortcutSettings();
    when(shortcuts.get('foo')).thenReturn([a]);
    when(shortcuts.get('bar')).thenReturn([b, c]);

    await tester.pumpWidget(
      CommandStore(
        shortcuts: shortcuts,
        child: MaterialApp(
          home: Builder(
            builder: (context) => CommandScope(
              commands: commands,
              child: const Focus(
                autofocus: true,
                child: SizedBox.shrink(),
              ),
            ),
          ),
        ),
      ),
    );
    await tester.pumpAndSettle();

    final context = tester.element(find.byType(SizedBox));
    expect(CommandStore.of(context), isA<CommandStoreState>());
    expect(CommandStore.commandsOf(context), [
      commands.first.copyWith(shortcuts: [a]),
      commands.last.copyWith(shortcuts: [b, c]),
    ]);
    expect(CommandStore.shortcutsOf(context), {a: fi, b: bi, c: bi});
  });

  testWidgets('missing store', (tester) async {
    await tester.pumpWidget(const MaterialApp());

    final context = tester.element(find.byType(MaterialApp));
    expect(() => CommandStore.of(context), throwsAssertionError);
    expect(() => CommandStore.commandsOf(context), throwsAssertionError);
    expect(() => CommandStore.shortcutsOf(context), throwsAssertionError);
  });
}
