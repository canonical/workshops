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
  test('get one shortcut', () async {
    final gsettings = MockGSettings();
    when(gsettings.get('foo'))
        .thenAnswer((_) async => DBusArray.string(['<Control>f']));

    final shortcuts = ShortcutGSettings(gsettings);
    expect(shortcuts.getShortcuts('foo'), isEmpty);

    final completer = Completer<List<SingleActivator>>();
    shortcuts.addListener(() {
      completer.complete(shortcuts.getShortcuts('foo'));
    });

    expect(await completer.future, [
      isSingleActivator(LogicalKeyboardKey.keyF, control: true),
    ]);
  });

  test('get multiple shortcuts', () async {
    final gsettings = MockGSettings();
    when(gsettings.get('foo')).thenAnswer(
        (_) async => DBusArray.string(['<Control>f', '<Alt><Shift>g']));

    final shortcuts = ShortcutGSettings(gsettings);
    expect(shortcuts.getShortcuts('foo'), isEmpty);

    final completer = Completer<List<SingleActivator>>();
    shortcuts.addListener(() {
      completer.complete(shortcuts.getShortcuts('foo'));
    });

    expect(await completer.future, [
      isSingleActivator(LogicalKeyboardKey.keyF, control: true),
      isSingleActivator(LogicalKeyboardKey.keyG, alt: true, shift: true),
    ]);
  });

  test('set shortcuts', () async {
    final gsettings = MockGSettings();
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
    final gsettings = MockGSettings();
    final shortcuts = ShortcutGSettings(gsettings);

    await shortcuts.removeShortcuts('foo');
    verify(gsettings.unset('foo'));
  });

  test('add shortcut', () async {
    final gsettings = MockGSettings();
    when(gsettings.get('foo')).thenAnswer((_) async => DBusArray.string([]));

    final shortcuts = ShortcutGSettings(gsettings);

    await shortcuts.addShortcut(
        'foo', const SingleActivator(LogicalKeyboardKey.keyB, control: true));
    verify(gsettings.set('foo', DBusArray.string(['<Control>b'])));

    when(gsettings.get('foo'))
        .thenAnswer((_) async => DBusArray.string(['<Control>b']));

    await shortcuts.addShortcut(
        'foo', const SingleActivator(LogicalKeyboardKey.keyC, meta: true));
    verify(gsettings.set('foo', DBusArray.string(['<Control>b', '<Meta>c'])));

    when(gsettings.get('foo'))
        .thenAnswer((_) async => DBusArray.string(['<Control>b', '<Meta>c']));
  });

  test('remove shortcut', () async {
    final gsettings = MockGSettings();
    when(gsettings.get('foo'))
        .thenAnswer((_) async => DBusArray.string(['<Control>b', '<Meta>c']));

    final shortcuts = ShortcutGSettings(gsettings);

    await shortcuts.removeShortcut(
        'foo', const SingleActivator(LogicalKeyboardKey.keyB, control: true));
    verify(gsettings.set('foo', DBusArray.string(['<Meta>c'])));

    when(gsettings.get('foo'))
        .thenAnswer((_) async => DBusArray.string(['<Meta>c']));

    await shortcuts.removeShortcut(
        'foo', const SingleActivator(LogicalKeyboardKey.keyC, meta: true));
    verify(gsettings.set('foo', DBusArray.string([])));
  });

  test('shortcut change', () async {
    final keysChanged = StreamController<List<String>>(sync: true);

    final gsettings = MockGSettings();
    when(gsettings.get('foo'))
        .thenAnswer((_) async => DBusArray.string(['<Control>c']));
    when(gsettings.keysChanged).thenAnswer((_) => keysChanged.stream);

    final shortcuts = ShortcutGSettings(gsettings);
    await shortcuts.init();

    var wasNotified = 0;
    shortcuts.addListener(() => ++wasNotified);

    keysChanged.add(['foo']);
    expect(wasNotified, 0);

    expect(shortcuts.getShortcuts('foo'), isEmpty);

    final completer = Completer<List<SingleActivator>>();
    shortcuts.addListener(() {
      if (!completer.isCompleted) {
        completer.complete(shortcuts.getShortcuts('foo'));
      }
    });

    expect(await completer.future, [
      isSingleActivator(LogicalKeyboardKey.keyC, control: true),
    ]);
    expect(wasNotified, 1);

    keysChanged.add(['foo']);
    expect(wasNotified, 2);
  });

  test('dispose', () async {
    final keysChanged = StreamController<List<String>>(sync: true);

    final gsettings = MockGSettings();
    when(gsettings.keysChanged).thenAnswer((_) => keysChanged.stream);

    final shortcuts = ShortcutGSettings(gsettings);

    await shortcuts.init();
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
