import 'dart:async';

import 'package:dbus/dbus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gsettings/gsettings.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:shortcut_store/shortcut_store.dart';

import 'shortcut_gsettings_test.mocks.dart';

@GenerateMocks([GSettings])
void main() {
  MockGSettings mockGSettings({
    Map<String, List<String>> shortcuts = const {},
    Stream<List<String>> keysChanged = const Stream.empty(),
  }) {
    final mock = MockGSettings();
    when(mock.list()).thenAnswer((_) => Future.value(shortcuts.keys.toList()));
    when(mock.get(any)).thenAnswer((_) {
      final id = _.positionalArguments[0] as String;
      return Future.value(DBusArray.string(shortcuts[id] ?? []));
    });
    when(mock.keysChanged).thenAnswer((i) => keysChanged);
    return mock;
  }

  test('get one shortcut', () async {
    final gsettings = mockGSettings(shortcuts: {
      'foo': ['<Control>f']
    });

    final shortcuts = ShortcutGSettings(gsettings);
    expect(shortcuts.getShortcuts('foo'), isEmpty);

    await shortcuts.load();
    expect(shortcuts.getShortcuts('foo'), [
      isSingleActivator(LogicalKeyboardKey.keyF, control: true),
    ]);
  });

  test('get multiple shortcuts', () async {
    final gsettings = mockGSettings(shortcuts: {
      'foo': ['<Control>f', '<Alt><Shift>g']
    });

    final shortcuts = ShortcutGSettings(gsettings);
    expect(shortcuts.getShortcuts('foo'), isEmpty);

    await shortcuts.load();
    expect(shortcuts.getShortcuts('foo'), [
      isSingleActivator(LogicalKeyboardKey.keyF, control: true),
      isSingleActivator(LogicalKeyboardKey.keyG, alt: true, shift: true),
    ]);
  });

  test('set shortcuts', () async {
    final gsettings = mockGSettings();
    final shortcuts = ShortcutGSettings(gsettings);

    await shortcuts.setShortcuts('foo', []);
    verify(gsettings.set('foo', DBusArray.string([])));

    await shortcuts.setShortcuts(
        'bar', [const SingleActivator(LogicalKeyboardKey.keyB, control: true)]);
    verify(gsettings.set('bar', DBusArray.string(['<Control>b'])));

    await shortcuts.setShortcuts('baz', [
      const SingleActivator(LogicalKeyboardKey.keyB, control: true),
      const SingleActivator(LogicalKeyboardKey.keyC, meta: true),
    ]);
    verify(gsettings.set('baz', DBusArray.string(['<Control>b', '<Meta>c'])));
  });

  test('remove shortcuts', () async {
    final gsettings = mockGSettings();
    final shortcuts = ShortcutGSettings(gsettings);

    await shortcuts.removeShortcuts('foo');
    verify(gsettings.unset('foo'));
  });

  test('add first shortcut', () async {
    final gsettings = mockGSettings(shortcuts: {'foo': []});

    final shortcuts = ShortcutGSettings(gsettings);
    await shortcuts.load();

    await shortcuts.addShortcut(
        'foo', const SingleActivator(LogicalKeyboardKey.keyB, control: true));
    verify(gsettings.set('foo', DBusArray.string(['<Control>b'])));
  });

  test('add second shortcut', () async {
    final gsettings = mockGSettings(shortcuts: {
      'foo': ['<Control>b']
    });

    final shortcuts = ShortcutGSettings(gsettings);
    await shortcuts.load();

    await shortcuts.addShortcut(
        'foo', const SingleActivator(LogicalKeyboardKey.keyC, meta: true));
    verify(gsettings.set('foo', DBusArray.string(['<Control>b', '<Meta>c'])));
  });

  test('remove first shortcut', () async {
    final gsettings = mockGSettings(shortcuts: {
      'foo': ['<Control>b', '<Meta>c']
    });

    final shortcuts = ShortcutGSettings(gsettings);

    await shortcuts.load();

    await shortcuts.removeShortcut(
        'foo', const SingleActivator(LogicalKeyboardKey.keyB, control: true));
    verify(gsettings.set('foo', DBusArray.string(['<Meta>c'])));
  });

  test('remove last shortcut', () async {
    final gsettings = mockGSettings(shortcuts: {
      'foo': ['<Meta>c']
    });

    final shortcuts = ShortcutGSettings(gsettings);

    await shortcuts.load();

    await shortcuts.removeShortcut(
        'foo', const SingleActivator(LogicalKeyboardKey.keyC, meta: true));
    verify(gsettings.set('foo', DBusArray.string([])));
  });

  test('shortcut change', () async {
    final keysChanged = StreamController<List<String>>(sync: true);

    final gsettings = mockGSettings(shortcuts: {
      'foo': ['<Control>c']
    }, keysChanged: keysChanged.stream);

    final shortcuts = ShortcutGSettings(gsettings);

    var wasNotified = 0;
    shortcuts.addListener(() => ++wasNotified);

    await shortcuts.load();

    expect(wasNotified, 1);
    expect(shortcuts.getShortcuts('foo'), [
      isSingleActivator(LogicalKeyboardKey.keyC, control: true),
    ]);

    when(gsettings.get('foo'))
        .thenAnswer((_) async => DBusArray.string(['<Control><Meta>c']));

    final completer = Completer<List<SingleActivator>>();
    shortcuts.addListener(() {
      if (!completer.isCompleted) {
        completer.complete(shortcuts.getShortcuts('foo'));
      }
    });

    keysChanged.add(['foo']);

    expect(await completer.future, [
      isSingleActivator(LogicalKeyboardKey.keyC, control: true, meta: true),
    ]);
    expect(wasNotified, 2);
  });

  test('dispose', () async {
    final keysChanged = StreamController<List<String>>(sync: true);

    final gsettings = mockGSettings(keysChanged: keysChanged.stream);

    final shortcuts = ShortcutGSettings(gsettings);

    await shortcuts.load();
    expect(keysChanged.hasListener, isTrue);
    verifyNever(gsettings.close());

    await shortcuts.dispose();
    expect(keysChanged.hasListener, isFalse);
    verify(gsettings.close()).called(1);
  });
}

Matcher isSingleActivator(
  LogicalKeyboardKey trigger, {
  bool alt = false,
  bool control = false,
  bool meta = false,
  bool shift = false,
}) {
  return isA<SingleActivator>()
      .having((a) => a.trigger, 'key', trigger)
      .having((a) => a.alt, 'alt', alt)
      .having((a) => a.control, 'control', control)
      .having((a) => a.meta, 'meta', meta)
      .having((a) => a.shift, 'shift', shift);
}
