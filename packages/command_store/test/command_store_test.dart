import 'package:command_store/command_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'command_store_test.mocks.dart';

@GenerateMocks([ShortcutStore])
void main() {
  testWidgets('inherited commands', (tester) async {
    var foo = 0;
    var bar = 0;
    var qux = 0;

    final fi = VoidCallbackIntent(() => ++foo);
    final bi = VoidCallbackIntent(() => ++bar);
    final qi = VoidCallbackIntent(() => ++qux);

    final a = LogicalKeySet(LogicalKeyboardKey.alt, LogicalKeyboardKey.keyA);
    final b = LogicalKeySet(LogicalKeyboardKey.meta, LogicalKeyboardKey.keyB);
    final c = LogicalKeySet(LogicalKeyboardKey.shift, LogicalKeyboardKey.keyC);

    final commands = [
      Command(id: 'foo', label: 'Foo', intent: fi),
      Command(id: 'bar', label: 'Bar', intent: bi),
      Command(
        id: 'baz',
        label: 'Baz',
        children: [Command(id: 'qux', label: 'Qux', intent: qi)],
      ),
    ];

    final shortcuts = MockShortcutStore();
    when(shortcuts.getShortcuts('foo')).thenReturn([a]);
    when(shortcuts.getShortcuts('bar')).thenReturn([b, c]);
    when(shortcuts.getShortcuts('baz')).thenReturn(null);
    when(shortcuts.getShortcuts('qux')).thenReturn(null);

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
      commands[0].copyWith(shortcuts: [a]),
      commands[1].copyWith(shortcuts: [b, c]),
      commands[2],
    ]);
    expect(CommandStore.shortcutsOf(context), {a: fi, b: bi, c: bi});

    CommandStore.of(context).execute(commands[1]);
    await tester.pump();

    expect(CommandStore.commandsOf(context), [
      commands[1].copyWith(shortcuts: [b, c]),
      commands[0].copyWith(shortcuts: [a]),
      commands[2],
    ]);
  });

  testWidgets('missing store', (tester) async {
    await tester.pumpWidget(const MaterialApp());

    final context = tester.element(find.byType(MaterialApp));
    expect(() => CommandStore.of(context), throwsAssertionError);
    expect(() => CommandStore.commandsOf(context), throwsAssertionError);
    expect(() => CommandStore.shortcutsOf(context), throwsAssertionError);
  });
}
