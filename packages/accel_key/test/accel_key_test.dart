import 'package:accel_key/accel_key.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('listener', (tester) async {
    LogicalKeySet? accelKey;
    final focusNode = FocusNode();

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Center(
            child: AccelKeyListener(
              autofocus: true,
              focusNode: focusNode,
              onAccelKey: (value) => accelKey = value,
              child: const SizedBox.shrink(),
            ),
          ),
        ),
      ),
    );

    await tester.sendKeyEvent(LogicalKeyboardKey.enter);
    expect(accelKey, isNull);

    await tester.sendKeyEvent(LogicalKeyboardKey.escape);
    expect(accelKey, isNull);

    await tester.sendKeyDownEvent(LogicalKeyboardKey.controlLeft);
    expect(accelKey, isLogicalKeySet({LogicalKeyboardKey.control}));

    await tester.sendKeyDownEvent(LogicalKeyboardKey.shiftLeft);
    expect(
      accelKey,
      isLogicalKeySet({LogicalKeyboardKey.control, LogicalKeyboardKey.shift}),
    );

    await tester.sendKeyDownEvent(LogicalKeyboardKey.keyA);
    expect(
      accelKey,
      isLogicalKeySet({
        LogicalKeyboardKey.control,
        LogicalKeyboardKey.shift,
        LogicalKeyboardKey.keyA,
      }),
    );
  });

  testWidgets('widget', (tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: Center(
            child: AccelKey(
              keys: ['Control', 'A'],
            ),
          ),
        ),
      ),
    );

    expect(find.byType(AccelKey), findsOneWidget);
    expect(find.byType(Card), findsNWidgets(2));
    expect(find.text('Control'), findsOneWidget);
    expect(find.text('A'), findsOneWidget);
  });

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

  test('extensions', () {
    expect(LogicalKeyboardKey.keyA.isAlt, isFalse);
    expect(LogicalKeyboardKey.keyA.isControl, isFalse);
    expect(LogicalKeyboardKey.keyA.isMeta, isFalse);
    expect(LogicalKeyboardKey.keyA.isShift, isFalse);

    expect(LogicalKeyboardKey.alt.isAlt, isTrue);
    expect(LogicalKeyboardKey.alt.isControl, isFalse);
    expect(LogicalKeyboardKey.alt.isMeta, isFalse);
    expect(LogicalKeyboardKey.alt.isShift, isFalse);

    expect(LogicalKeyboardKey.control.isAlt, isFalse);
    expect(LogicalKeyboardKey.control.isControl, isTrue);
    expect(LogicalKeyboardKey.control.isMeta, isFalse);
    expect(LogicalKeyboardKey.control.isShift, isFalse);

    expect(LogicalKeyboardKey.meta.isAlt, isFalse);
    expect(LogicalKeyboardKey.meta.isControl, isFalse);
    expect(LogicalKeyboardKey.meta.isMeta, isTrue);
    expect(LogicalKeyboardKey.meta.isShift, isFalse);

    expect(LogicalKeyboardKey.shift.isAlt, isFalse);
    expect(LogicalKeyboardKey.shift.isControl, isFalse);
    expect(LogicalKeyboardKey.shift.isMeta, isFalse);
    expect(LogicalKeyboardKey.shift.isShift, isTrue);

    expect(LogicalKeySet(LogicalKeyboardKey.keyA).hasAlt, isFalse);
    expect(LogicalKeySet(LogicalKeyboardKey.keyA).hasControl, isFalse);
    expect(LogicalKeySet(LogicalKeyboardKey.keyA).hasMeta, isFalse);
    expect(LogicalKeySet(LogicalKeyboardKey.keyA).hasShift, isFalse);

    final controlA = LogicalKeySet(
      LogicalKeyboardKey.control,
      LogicalKeyboardKey.keyA,
    );
    expect(controlA.hasAlt, isFalse);
    expect(controlA.hasControl, isTrue);
    expect(controlA.hasMeta, isFalse);
    expect(controlA.hasShift, isFalse);

    final shiftB = LogicalKeySet(
      LogicalKeyboardKey.keyB,
      LogicalKeyboardKey.shift,
    );
    expect(shiftB.hasAlt, isFalse);
    expect(shiftB.hasControl, isFalse);
    expect(shiftB.hasMeta, isFalse);
    expect(shiftB.hasShift, isTrue);

    final controlAltC = LogicalKeySet(
      LogicalKeyboardKey.alt,
      LogicalKeyboardKey.keyC,
      LogicalKeyboardKey.control,
    );
    expect(controlAltC.hasAlt, isTrue);
    expect(controlAltC.hasControl, isTrue);
    expect(controlAltC.hasMeta, isFalse);
    expect(controlAltC.hasShift, isFalse);

    expect(controlA.sorted(), [
      LogicalKeyboardKey.control,
      LogicalKeyboardKey.keyA,
    ]);
    expect(shiftB.sorted(), [
      LogicalKeyboardKey.shift,
      LogicalKeyboardKey.keyB,
    ]);
    expect(controlAltC.sorted(), [
      LogicalKeyboardKey.control,
      LogicalKeyboardKey.alt,
      LogicalKeyboardKey.keyC,
    ]);

    final allModifiers = LogicalKeySet(
      LogicalKeyboardKey.alt,
      LogicalKeyboardKey.control,
      LogicalKeyboardKey.meta,
      LogicalKeyboardKey.shift,
    );
    expect(allModifiers.sorted(), [
      LogicalKeyboardKey.control,
      LogicalKeyboardKey.shift,
      LogicalKeyboardKey.alt,
      LogicalKeyboardKey.meta,
    ]);
  });
}

Matcher isLogicalKeySet(Set<LogicalKeyboardKey> triggers) {
  return isA<LogicalKeySet>().having(
      (keyset) => LogicalKeyboardKey.collapseSynonyms(keyset.triggers.toSet()),
      'triggers',
      triggers);
}
