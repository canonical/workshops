import 'package:accel_key/accel_key.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('parse', () {
    expect(
      parseAccelKey('A'),
      isLogicalKeySet({LogicalKeyboardKey.keyA}),
    );

    expect(
      parseAccelKey('<Ctrl>B'),
      isLogicalKeySet({LogicalKeyboardKey.keyB, LogicalKeyboardKey.control}),
    );

    expect(
      parseAccelKey('<Shift>C'),
      isLogicalKeySet({LogicalKeyboardKey.keyC, LogicalKeyboardKey.shift}),
    );

    expect(
      parseAccelKey('<Meta>D'),
      isLogicalKeySet({LogicalKeyboardKey.keyD, LogicalKeyboardKey.meta}),
    );

    expect(
      parseAccelKey('<Ctrl><Shift><Alt><Meta>x'),
      isLogicalKeySet({
        LogicalKeyboardKey.keyX,
        LogicalKeyboardKey.control,
        LogicalKeyboardKey.shift,
        LogicalKeyboardKey.alt,
        LogicalKeyboardKey.meta
      }),
    );

    expect(
      parseAccelKey('<Control>Page_Up'),
      isLogicalKeySet({LogicalKeyboardKey.pageUp, LogicalKeyboardKey.control}),
    );

    expect(
      parseAccelKey('<Alt>5'),
      isLogicalKeySet({LogicalKeyboardKey.digit5, LogicalKeyboardKey.alt}),
    );

    expect(
      parseAccelKey('<Shift>KP_5'),
      isLogicalKeySet({LogicalKeyboardKey.numpad5, LogicalKeyboardKey.shift}),
    );
  });

  test('format', () {
    expect(
      formatAccelKey(LogicalKeySet(LogicalKeyboardKey.keyA)),
      'a',
    );

    expect(
      formatAccelKey(
          LogicalKeySet(LogicalKeyboardKey.keyB, LogicalKeyboardKey.control)),
      '<Control>b',
    );

    expect(
      formatAccelKey(
          LogicalKeySet(LogicalKeyboardKey.keyC, LogicalKeyboardKey.shift)),
      '<Shift>c',
    );

    expect(
      formatAccelKey(
          LogicalKeySet(LogicalKeyboardKey.keyD, LogicalKeyboardKey.meta)),
      '<Meta>d',
    );

    expect(
      formatAccelKey(LogicalKeySet.fromSet({
        LogicalKeyboardKey.keyX,
        LogicalKeyboardKey.control,
        LogicalKeyboardKey.shift,
        LogicalKeyboardKey.alt,
        LogicalKeyboardKey.meta
      })),
      '<Shift><Control><Alt><Meta>x',
    );

    expect(
      formatAccelKey(
          LogicalKeySet(LogicalKeyboardKey.pageUp, LogicalKeyboardKey.control)),
      '<Control>Page_Up',
    );

    expect(
      formatAccelKey(
          LogicalKeySet(LogicalKeyboardKey.digit5, LogicalKeyboardKey.alt)),
      '<Alt>5',
    );

    expect(
      formatAccelKey(
          LogicalKeySet(LogicalKeyboardKey.numpad5, LogicalKeyboardKey.shift)),
      '<Shift>KP_5',
    );
  });
}

Matcher isLogicalKeySet(Set<LogicalKeyboardKey> triggers) {
  return isA<LogicalKeySet>().having(
      (keyset) => LogicalKeyboardKey.collapseSynonyms(keyset.triggers.toSet()),
      'triggers',
      triggers);
}
