import 'dart:async';

import 'package:dbus/dbus.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gsettings/gsettings.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:settings_store/settings_store.dart';

import 'settings_store_test.mocks.dart';

@GenerateMocks([GSettings])
void main() {
  MockGSettings mockGSettings({
    Map<String, DBusValue> values = const {},
    Stream<List<String>> keysChanged = const Stream.empty(),
  }) {
    final mock = MockGSettings();
    when(mock.list()).thenAnswer((_) => Future.value(values.keys.toList()));
    when(mock.get(any)).thenAnswer((_) {
      final key = _.positionalArguments[0] as String;
      return Future.value(values[key]);
    });
    when(mock.keysChanged).thenAnswer((i) => keysChanged);
    return mock;
  }

  test('keys', () async {
    final gsettings = mockGSettings(values: {
      'bool': const DBusBoolean(true),
      'int32': const DBusInt32(123),
      'double': const DBusDouble(123.456),
      'string': const DBusString('foo'),
      'array': DBusArray.string(['foo', 'bar']),
    });

    final store = SettingsStore.of(gsettings);
    expect(store.keys, isEmpty);

    await store.init();
    expect(store.keys, ['bool', 'int32', 'double', 'string', 'array']);
  });

  test('get', () async {
    final gsettings = mockGSettings(values: {
      'bool': const DBusBoolean(true),
      'int32': const DBusInt32(123),
      'double': const DBusDouble(123.456),
      'string': const DBusString('foo'),
      'array': DBusArray.string(['foo', 'bar']),
    });

    final store = SettingsStore.of(gsettings);
    expect(store.get('none'), isNull);
    expect(store.get('bool'), isNull);
    expect(store.get('int32'), isNull);
    expect(store.get('double'), isNull);
    expect(store.get('string'), isNull);
    expect(store.get('array'), isNull);

    await store.init();
    expect(store.get('none'), isNull);
    expect(store.get('bool'), isTrue);
    expect(store.get('int32'), 123);
    expect(store.get('double'), 123.456);
    expect(store.get('string'), 'foo');
    expect(store.get('array'), ['foo', 'bar']);
  });

  test('set', () async {
    final gsettings = mockGSettings();
    final store = SettingsStore.of(gsettings);

    await store.set('bool', true);
    verify(gsettings.set('bool', const DBusBoolean(true))).called(1);

    await store.set('int32', 123);
    verify(gsettings.set('int32', const DBusInt32(123)));

    await store.set('double', 123.456);
    verify(gsettings.set('double', const DBusDouble(123.456)));

    await store.set('string', 'foo');
    verify(gsettings.set('string', const DBusString('foo')));

    await store.set('array', ['foo', 'bar']);
    verify(gsettings.set('array', DBusArray.string(['foo', 'bar'])));
  });

  test('unset', () async {
    final gsettings = mockGSettings();
    final store = SettingsStore.of(gsettings);

    await store.unset('foo');
    verify(gsettings.unset('foo'));
  });

  test('change', () async {
    final keysChanged = StreamController<List<String>>(sync: true);

    final gsettings = mockGSettings(
      values: {'foo': const DBusString('bar')},
      keysChanged: keysChanged.stream,
    );

    final store = SettingsStore.of(gsettings);

    var wasNotified = 0;
    store.addListener(() => ++wasNotified);

    await store.init();

    expect(wasNotified, 1);
    expect(store.get('foo'), 'bar');

    when(gsettings.get('foo')).thenAnswer((_) async => const DBusString('baz'));

    final completer = Completer();
    store.addListener(() {
      if (!completer.isCompleted) {
        completer.complete(store.get('foo'));
      }
    });

    keysChanged.add(['foo']);

    expect(await completer.future, 'baz');
    expect(wasNotified, 2);
  });

  test('dispose', () async {
    final keysChanged = StreamController<List<String>>(sync: true);

    final gsettings = mockGSettings(keysChanged: keysChanged.stream);

    final store = SettingsStore.of(gsettings);

    await store.init();
    expect(keysChanged.hasListener, isTrue);
    verifyNever(gsettings.close());

    await store.dispose();
    expect(keysChanged.hasListener, isFalse);
    verify(gsettings.close()).called(1);
  });
}
