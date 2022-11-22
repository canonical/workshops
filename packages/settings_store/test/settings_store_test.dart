import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:jsettings/jsettings.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:settings_store/settings_store.dart';

import 'settings_store_test.mocks.dart';

@GenerateMocks([JSettings])
void main() {
  MockJSettings mockJSettings({
    Map<String, dynamic> values = const {},
    Stream<String> added = const Stream.empty(),
    Stream<String> changed = const Stream.empty(),
    Stream<String> removed = const Stream.empty(),
  }) {
    final mock = MockJSettings();
    when(mock.getKeys()).thenAnswer((_) => Set.of(values.keys));
    when(mock.getValue(any)).thenAnswer((i) {
      return values[i.positionalArguments[0] as String];
    });
    when(mock.hasValue(any)).thenAnswer((i) {
      return values.containsKey(i.positionalArguments[0] as String);
    });
    when(mock.added).thenAnswer((i) => added);
    when(mock.changed).thenAnswer((i) => changed);
    when(mock.removed).thenAnswer((i) => removed);
    return mock;
  }

  test('keys', () async {
    final jsettings = mockJSettings(values: {
      'bool': true,
      'int': 123,
      'double': 123.456,
      'string': 'foo',
      'array': ['foo', 'bar'],
    });

    final store = SettingsStore.of(jsettings);
    expect(store.getKeys(), {'bool', 'int', 'double', 'string', 'array'});
  });

  test('get value', () async {
    final jsettings = mockJSettings(values: {
      'bool': true,
      'int32': 123,
      'double': 123.456,
      'string': 'foo',
      'array': ['foo', 'bar'],
    });

    final store = SettingsStore.of(jsettings);
    expect(store.getValue('none'), isNull);
    expect(store.getValue('bool'), isTrue);
    expect(store.getValue('int32'), 123);
    expect(store.getValue('double'), 123.456);
    expect(store.getValue('string'), 'foo');
    expect(store.getValue('array'), ['foo', 'bar']);
  });

  test('set value', () async {
    final jsettings = mockJSettings();
    final store = SettingsStore.of(jsettings);

    await store.setValue('bool', true);
    verify(jsettings.setValue('bool', true)).called(1);

    await store.setValue('int32', 123);
    verify(jsettings.setValue('int32', 123));

    await store.setValue('double', 123.456);
    verify(jsettings.setValue('double', 123.456));

    await store.setValue('string', 'foo');
    verify(jsettings.setValue('string', 'foo'));

    await store.setValue('array', ['foo', 'bar']);
    verify(jsettings.setValue('array', ['foo', 'bar']));
  });

  test('reset value', () async {
    final jsettings = mockJSettings();
    final store = SettingsStore.of(jsettings);

    await store.resetValue('foo');
    verify(jsettings.resetValue('foo'));
  });

  test('value changes', () async {
    final added = StreamController<String>(sync: true);
    final changed = StreamController<String>(sync: true);
    final removed = StreamController<String>(sync: true);

    final jsettings = mockJSettings(
      values: {'foo': 'bar'},
      added: added.stream,
      changed: changed.stream,
      removed: removed.stream,
    );

    final store = SettingsStore.of(jsettings);

    var wasNotified = 0;
    var expectedNotified = 0;
    store.addListener(() => ++wasNotified);

    await store.init();
    expect(wasNotified, expectedNotified);

    added.add('foo');
    expect(wasNotified, ++expectedNotified);

    changed.add('foo');
    expect(wasNotified, ++expectedNotified);

    removed.add('foo');
    expect(wasNotified, ++expectedNotified);
  });

  test('read-only settings', () async {
    final store = ReadOnlySettingsStore.of(mockJSettings());
    expect(() => store.setValue('key', 123), throwsA(isA<UnsupportedError>()));
    expect(() => store.resetValue('key'), throwsA(isA<UnsupportedError>()));
  });

  test('inherited settings', () async {
    final jsettings1 = mockJSettings(values: {'foo': 'foo1'});
    final jsettings2 = mockJSettings(values: {'bar': 'bar1'});

    final store1 = SettingsStore.of(jsettings1);
    final store2 = InheritedSettingsStore.of(jsettings2);
    await store2.init(base: store1);

    // ignore: invalid_use_of_protected_member
    expect(store1.hasListeners, isTrue);

    expect(store1.getKeys(), {'foo'});
    expect(store2.getKeys(), {'foo', 'bar'});

    expect(store1.hasValue('foo'), isTrue);
    expect(store2.hasValue('foo'), isFalse);
    expect(store1.hasValue('bar'), isFalse);
    expect(store2.hasValue('bar'), isTrue);

    expect(store1.getValue('foo'), 'foo1');
    expect(store2.getValue('foo'), 'foo1');

    expect(store1.getValue('bar'), isNull);
    expect(store2.getValue('bar'), 'bar1');

    when(jsettings1.getValue('foo')).thenReturn('foo2');
    await store1.setValue('foo', 'foo2');
    expect(store1.getValue('foo'), 'foo2');
    expect(store2.getValue('foo'), 'foo2');

    when(jsettings2.getValue('foo')).thenReturn('foo3');
    await store2.setValue('foo', 'foo3');
    expect(store1.getValue('foo'), 'foo2');
    expect(store2.getValue('foo'), 'foo3');

    when(jsettings2.getValue('foo')).thenReturn(null);
    await store2.resetValue('foo');
    expect(store1.getValue('foo'), 'foo2');
    expect(store2.getValue('foo'), 'foo2');

    await store2.dispose();
    // ignore: invalid_use_of_protected_member
    expect(store1.hasListeners, isFalse);
  });

  test('dispose', () async {
    final added = StreamController<String>(sync: true);
    final changed = StreamController<String>(sync: true);
    final removed = StreamController<String>(sync: true);

    final jsettings = mockJSettings(
      added: added.stream,
      changed: changed.stream,
      removed: removed.stream,
    );

    final store = SettingsStore.of(jsettings);

    await store.init();
    expect(added.hasListener, isTrue);
    expect(changed.hasListener, isTrue);
    expect(removed.hasListener, isTrue);
    verifyNever(jsettings.close());

    await store.dispose();
    expect(added.hasListener, isFalse);
    expect(changed.hasListener, isFalse);
    expect(removed.hasListener, isFalse);
    verify(jsettings.close()).called(1);
  });
}

class ReadOnlySettingsStore extends SettingsStore with ReadOnlySettings {
  // ignore: use_super_parameters
  ReadOnlySettingsStore.of(JSettings jsettings) : super.of(jsettings);
}

class InheritedSettingsStore extends SettingsStore with InheritedSettings {
  // ignore: use_super_parameters
  InheritedSettingsStore.of(JSettings jsettings) : super.of(jsettings);
}
