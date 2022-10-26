import 'dart:async';

import 'package:command_store/command_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gio_settings/gio_settings.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'shortcut_gsettings_test.mocks.dart';

@GenerateMocks([GioSettings])
void main() {
  MockGioSettings mockGSettings({
    Map<String, List<String>> shortcuts = const {},
    Stream<List<String>> keysChanged = const Stream.empty(),
  }) {
    final mock = MockGioSettings();
    when(mock.list()).thenAnswer((_) => Future.value(shortcuts.keys.toList()));
    when(mock.get(any)).thenAnswer((_) {
      final id = _.positionalArguments[0] as String;
      return Future.value(shortcuts[id] ?? []);
    });
    when(mock.keysChanged).thenAnswer((i) => keysChanged);
    return mock;
  }

  test('get one', () async {
    final gsettings = mockGSettings(shortcuts: {
      'foo': ['<Control>f']
    });

    final shortcuts = ShortcutGSettings.of(gsettings);
    expect(shortcuts.get('foo'), isEmpty);

    await shortcuts.load();
    expect(shortcuts.get('foo'), [
      isLogicalKeySet({LogicalKeyboardKey.keyF, LogicalKeyboardKey.control}),
    ]);
  });

  test('get multiple', () async {
    final gsettings = mockGSettings(shortcuts: {
      'foo': ['<Control>f', '<Alt><Shift>g']
    });

    final shortcuts = ShortcutGSettings.of(gsettings);
    expect(shortcuts.get('foo'), isEmpty);

    await shortcuts.load();
    expect(shortcuts.get('foo'), [
      isLogicalKeySet({LogicalKeyboardKey.keyF, LogicalKeyboardKey.control}),
      isLogicalKeySet({
        LogicalKeyboardKey.keyG,
        LogicalKeyboardKey.alt,
        LogicalKeyboardKey.shift,
      }),
    ]);
  });

  test('set', () async {
    final gsettings = mockGSettings();
    final shortcuts = ShortcutGSettings.of(gsettings);

    await shortcuts.set('foo', []);
    verify(gsettings.set('foo', []));

    await shortcuts.set('bar', [
      LogicalKeySet(LogicalKeyboardKey.keyB, LogicalKeyboardKey.control),
    ]);
    verify(gsettings.set('bar', ['<Control>b']));

    await shortcuts.set('baz', [
      LogicalKeySet(LogicalKeyboardKey.keyB, LogicalKeyboardKey.control),
      LogicalKeySet(LogicalKeyboardKey.keyC, LogicalKeyboardKey.meta),
    ]);
    verify(gsettings.set('baz', ['<Control>b', '<Meta>c']));
  });

  test('unset', () async {
    final gsettings = mockGSettings();
    final shortcuts = ShortcutGSettings.of(gsettings);

    await shortcuts.unset('foo');
    verify(gsettings.unset('foo'));
  });

  test('add first', () async {
    final gsettings = mockGSettings(shortcuts: {'foo': []});

    final shortcuts = ShortcutGSettings.of(gsettings);
    await shortcuts.load();

    await shortcuts.add(
      'foo',
      LogicalKeySet(LogicalKeyboardKey.keyB, LogicalKeyboardKey.control),
    );
    verify(gsettings.set('foo', ['<Control>b']));
  });

  test('add second', () async {
    final gsettings = mockGSettings(shortcuts: {
      'foo': ['<Control>b']
    });

    final shortcuts = ShortcutGSettings.of(gsettings);
    await shortcuts.load();

    await shortcuts.add(
      'foo',
      LogicalKeySet(LogicalKeyboardKey.keyC, LogicalKeyboardKey.meta),
    );
    verify(gsettings.set('foo', ['<Control>b', '<Meta>c']));
  });

  test('remove first', () async {
    final gsettings = mockGSettings(shortcuts: {
      'foo': ['<Control>b', '<Meta>c']
    });

    final shortcuts = ShortcutGSettings.of(gsettings);

    await shortcuts.load();

    await shortcuts.remove(
      'foo',
      LogicalKeySet(LogicalKeyboardKey.keyB, LogicalKeyboardKey.control),
    );
    verify(gsettings.set('foo', ['<Meta>c']));
  });

  test('remove last', () async {
    final gsettings = mockGSettings(shortcuts: {
      'foo': ['<Meta>c']
    });

    final shortcuts = ShortcutGSettings.of(gsettings);

    await shortcuts.load();

    await shortcuts.remove(
      'foo',
      LogicalKeySet(LogicalKeyboardKey.keyC, LogicalKeyboardKey.meta),
    );
    verify(gsettings.set('foo', []));
  });

  test('change', () async {
    final keysChanged = StreamController<List<String>>(sync: true);

    final gsettings = mockGSettings(shortcuts: {
      'foo': ['<Control>c']
    }, keysChanged: keysChanged.stream);

    final shortcuts = ShortcutGSettings.of(gsettings);

    var wasNotified = 0;
    shortcuts.addListener(() => ++wasNotified);

    await shortcuts.load();

    expect(wasNotified, 1);
    expect(shortcuts.get('foo'), [
      isLogicalKeySet({LogicalKeyboardKey.keyC, LogicalKeyboardKey.control}),
    ]);

    when(gsettings.get('foo')).thenAnswer((_) async => ['<Control><Meta>c']);

    final completer = Completer<List<LogicalKeySet>>();
    shortcuts.addListener(() {
      if (!completer.isCompleted) {
        completer.complete(shortcuts.get('foo'));
      }
    });

    keysChanged.add(['foo']);

    expect(await completer.future, [
      isLogicalKeySet({
        LogicalKeyboardKey.keyC,
        LogicalKeyboardKey.control,
        LogicalKeyboardKey.meta,
      }),
    ]);
    expect(wasNotified, 2);
  });

  test('dispose', () async {
    final keysChanged = StreamController<List<String>>(sync: true);

    final gsettings = mockGSettings(keysChanged: keysChanged.stream);

    final shortcuts = ShortcutGSettings.of(gsettings);

    await shortcuts.load();
    expect(keysChanged.hasListener, isTrue);
    verifyNever(gsettings.close());

    await shortcuts.dispose();
    expect(keysChanged.hasListener, isFalse);
    verify(gsettings.close()).called(1);
  });
}

Matcher isLogicalKeySet(Set<LogicalKeyboardKey> triggers) {
  return isA<LogicalKeySet>().having(
      (keyset) => LogicalKeyboardKey.collapseSynonyms(keyset.triggers.toSet()),
      'triggers',
      triggers);
}
