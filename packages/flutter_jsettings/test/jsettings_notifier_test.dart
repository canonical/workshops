import 'dart:async';

import 'package:flutter_jsettings/flutter_jsettings.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('listeners', () async {
    final added = StreamController<String>(sync: true);
    final changed = StreamController<String>(sync: true);
    final removed = StreamController<String>(sync: true);

    final notifier = TestJSettingsNotifier(
      added: added.stream,
      changed: changed.stream,
      removed: removed.stream,
    );

    expect(added.hasListener, isFalse);
    expect(changed.hasListener, isFalse);
    expect(removed.hasListener, isFalse);

    await notifier.init();

    expect(added.hasListener, isTrue);
    expect(changed.hasListener, isTrue);
    expect(removed.hasListener, isTrue);

    var wasNotified = 0;
    notifier.addListener(() => wasNotified++);
    added.add('foo');
    expect(wasNotified, 1);
    changed.add('foo');
    expect(wasNotified, 2);
    removed.add('foo');
    expect(wasNotified, 3);

    await notifier.dispose();

    expect(added.hasListener, isFalse);
    expect(changed.hasListener, isFalse);
    expect(removed.hasListener, isFalse);
  });
}

class TestJSettingsNotifier extends JSettingsNotifier {
  TestJSettingsNotifier({
    this.added = const Stream.empty(),
    this.changed = const Stream.empty(),
    this.removed = const Stream.empty(),
  }) : super('');

  @override
  final Stream<String> added;

  @override
  final Stream<String> changed;

  @override
  final Stream<String> removed;
}
