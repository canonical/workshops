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
      final id = _.positionalArguments[0] as String;
      return Future.value(values[id]);
    });
    when(mock.keysChanged).thenAnswer((i) => keysChanged);
    return mock;
  }

  test('get null', () async {
    final gsettings = mockGSettings(values: {});

    final store = SettingsStore.of(gsettings);
    expect(store.get('foo'), isNull);

    await store.load();
    expect(store.get('foo'), isNull);
  });

  test('get one', () async {
    final gsettings = mockGSettings(values: {
      'foo': DBusArray.string(['<Control>f'])
    });

    final store = SettingsStore.of(gsettings);
    expect(store.get('foo'), isNull);

    await store.load();
    expect(store.get('foo'), DBusArray.string(['<Control>f']));
  });

  test('get multiple', () async {
    final gsettings = mockGSettings(values: {
      'foo': DBusArray.string(['<Control>f', '<Alt><Shift>g'])
    });

    final store = SettingsStore.of(gsettings);
    expect(store.get('foo'), isNull);

    await store.load();
    expect(
      store.get('foo'),
      DBusArray.string(['<Control>f', '<Alt><Shift>g']),
    );
  });

  test('set', () async {
    final gsettings = mockGSettings();
    final store = SettingsStore.of(gsettings);

    await store.set('foo', const DBusInt32(123));
    verify(gsettings.set('foo', const DBusInt32(123)));

    await store.set('bar', DBusArray.string(['<Control>b']));
    verify(gsettings.set('bar', DBusArray.string(['<Control>b'])));
  });

  test('unset', () async {
    final gsettings = mockGSettings();
    final store = SettingsStore.of(gsettings);

    await store.unset('foo');
    verify(gsettings.unset('foo'));
  });

  test('change', () async {
    final keysChanged = StreamController<List<String>>(sync: true);

    final gsettings = mockGSettings(values: {
      'foo': DBusArray.string(['<Control>c'])
    }, keysChanged: keysChanged.stream);

    final store = SettingsStore.of(gsettings);

    var wasNotified = 0;
    store.addListener(() => ++wasNotified);

    await store.load();

    expect(wasNotified, 1);
    expect(store.get('foo'), DBusArray.string(['<Control>c']));

    when(gsettings.get('foo'))
        .thenAnswer((_) async => DBusArray.string(['<Control><Meta>c']));

    final completer = Completer<DBusValue>();
    store.addListener(() {
      if (!completer.isCompleted) {
        completer.complete(store.get('foo'));
      }
    });

    keysChanged.add(['foo']);

    expect(await completer.future, DBusArray.string(['<Control><Meta>c']));
    expect(wasNotified, 2);
  });

  test('dispose', () async {
    final keysChanged = StreamController<List<String>>(sync: true);

    final gsettings = mockGSettings(keysChanged: keysChanged.stream);

    final store = SettingsStore.of(gsettings);

    await store.load();
    expect(keysChanged.hasListener, isTrue);
    verifyNever(gsettings.close());

    await store.dispose();
    expect(keysChanged.hasListener, isFalse);
    verify(gsettings.close()).called(1);
  });
}
