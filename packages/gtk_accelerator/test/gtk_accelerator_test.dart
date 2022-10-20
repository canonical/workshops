import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gtk_accelerator/src/gtk_accelerator.dart';

void main() {
  test('parse', () {
    expect(
      parseGtkAccelerator('A'),
      isLogicalKeySet({LogicalKeyboardKey.keyA}),
    );

    expect(
      parseGtkAccelerator('<Ctrl>B'),
      isLogicalKeySet({LogicalKeyboardKey.keyB, LogicalKeyboardKey.control}),
    );

    expect(
      parseGtkAccelerator('<Shift>C'),
      isLogicalKeySet({LogicalKeyboardKey.keyC, LogicalKeyboardKey.shift}),
    );

    expect(
      parseGtkAccelerator('<Meta>D'),
      isLogicalKeySet({LogicalKeyboardKey.keyD, LogicalKeyboardKey.meta}),
    );

    expect(
      parseGtkAccelerator('<Ctrl><Shift><Alt><Meta>x'),
      isLogicalKeySet({
        LogicalKeyboardKey.keyX,
        LogicalKeyboardKey.control,
        LogicalKeyboardKey.shift,
        LogicalKeyboardKey.alt,
        LogicalKeyboardKey.meta
      }),
    );

    expect(
      parseGtkAccelerator('<Control>Page_Up'),
      isLogicalKeySet({LogicalKeyboardKey.pageUp, LogicalKeyboardKey.control}),
    );

    expect(
      parseGtkAccelerator('<Alt>5'),
      isLogicalKeySet({LogicalKeyboardKey.digit5, LogicalKeyboardKey.alt}),
    );

    expect(
      parseGtkAccelerator('<Shift>KP_5'),
      isLogicalKeySet({LogicalKeyboardKey.numpad5, LogicalKeyboardKey.shift}),
    );
  });

  test('format', () {
    expect(
      formatGtkAccelerator(LogicalKeySet(LogicalKeyboardKey.keyA)),
      'a',
    );

    expect(
      formatGtkAccelerator(
          LogicalKeySet(LogicalKeyboardKey.keyB, LogicalKeyboardKey.control)),
      '<Control>b',
    );

    expect(
      formatGtkAccelerator(
          LogicalKeySet(LogicalKeyboardKey.keyC, LogicalKeyboardKey.shift)),
      '<Shift>c',
    );

    expect(
      formatGtkAccelerator(
          LogicalKeySet(LogicalKeyboardKey.keyD, LogicalKeyboardKey.meta)),
      '<Meta>d',
    );

    expect(
      formatGtkAccelerator(LogicalKeySet.fromSet({
        LogicalKeyboardKey.keyX,
        LogicalKeyboardKey.control,
        LogicalKeyboardKey.shift,
        LogicalKeyboardKey.alt,
        LogicalKeyboardKey.meta
      })),
      '<Shift><Control><Alt><Meta>x',
    );

    expect(
      formatGtkAccelerator(
          LogicalKeySet(LogicalKeyboardKey.pageUp, LogicalKeyboardKey.control)),
      '<Control>Page_Up',
    );

    expect(
      formatGtkAccelerator(
          LogicalKeySet(LogicalKeyboardKey.digit5, LogicalKeyboardKey.alt)),
      '<Alt>5',
    );

    expect(
      formatGtkAccelerator(
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
