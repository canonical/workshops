import 'package:flutter_jsettings/flutter_jsettings.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

void main() {
  test('read-only', () async {
    final settings = JSettingsReadOnlyNotifier();
    expect(() => settings.setValue('a', 123), throwsA(isA<UnsupportedError>()));
    expect(() => settings.resetValue('a'), throwsA(isA<UnsupportedError>()));
  });

  test('inherited', () async {
    final base = MockJSettingsNotifier();
    when(base.getKeys()).thenReturn({'foo', 'bar'});
    when(base.getValue('foo')).thenReturn(1);
    when(base.getValue('bar')).thenReturn(2);

    final settings = JSettingsInheritedNotifier({'bar': 3, 'baz': 4});
    settings.inherit(base);
    verify(base.addListener(settings.notifyListeners)).called(1);

    expect(settings.getKeys(), {'foo', 'bar', 'baz'});
    expect(settings.getValue('foo'), 1);
    expect(settings.getValue('bar'), 3);
    expect(settings.getValue('baz'), 4);
    expect(settings.hasValue('foo'), isFalse);
    expect(settings.hasValue('bar'), isTrue);
    expect(settings.hasValue('bar'), isTrue);

    await settings.dispose();
    verify(base.removeListener(settings.notifyListeners)).called(1);
  });
}

class MockJSettingsNotifier extends Mock implements JSettingsNotifier {
  @override
  Set<String> getKeys() {
    return super.noSuchMethod(
      Invocation.getter(#getKeys),
      returnValue: <String>{},
    ) as Set<String>;
  }
}

class FakeJSettingsNotifier extends Fake implements JSettingsNotifier {
  FakeJSettingsNotifier([this._values = const {}]);

  final Map<String, Object> _values;

  @override
  Set<String> getKeys() => Set.of(_values.keys);

  @override
  Object? getValue(String key) => _values[key];

  @override
  Future<void> dispose() async {}
}

class JSettingsReadOnlyNotifier extends FakeJSettingsNotifier
    with JSettingsReadOnlyMixin {}

class JSettingsInheritedNotifier extends FakeJSettingsNotifier
    with JSettingsInheritedMixin {
  JSettingsInheritedNotifier([super.values]);
}
