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
      'int32': const DBusInt32(123),
      'string': const DBusString('foo'),
      'array': DBusArray.string(['foo', 'bar']),
    });

    final store = SettingsStore.of(gsettings);
    expect(store.keys, isEmpty);

    await store.init();
    expect(store.keys, ['int32', 'string', 'array']);
  });

  test('get', () async {
    final gsettings = mockGSettings(values: {
      'int32': const DBusInt32(123),
      'string': const DBusString('foo'),
      'array': DBusArray.string(['foo', 'bar']),
    });

    final store = SettingsStore.of(gsettings);
    expect(store.get('none'), isNull);
    expect(store.get('int32'), isNull);
    expect(store.get('string'), isNull);
    expect(store.get('array'), isNull);

    await store.init();
    expect(store.get('none'), isNull);
    expect(store.get('int32'), const DBusInt32(123));
    expect(store.get('string'), const DBusString('foo'));
    expect(store.get('array'), DBusArray.string(['foo', 'bar']));
  });

  test('set', () async {
    final gsettings = mockGSettings();
    final store = SettingsStore.of(gsettings);

    await store.set('int32', const DBusInt32(123));
    verify(gsettings.set('int32', const DBusInt32(123)));

    await store.set('string', const DBusString('foo'));
    verify(gsettings.set('string', const DBusString('foo')));

    await store.set('array', DBusArray.string(['foo', 'bar']));
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
    expect(store.get('foo'), const DBusString('bar'));

    when(gsettings.get('foo')).thenAnswer((_) async => const DBusString('baz'));

    final completer = Completer<DBusValue>();
    store.addListener(() {
      if (!completer.isCompleted) {
        completer.complete(store.get('foo'));
      }
    });

    keysChanged.add(['foo']);

    expect(await completer.future, const DBusString('baz'));
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
