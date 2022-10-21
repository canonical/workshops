import 'package:collection/collection.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

const logicalKeySetListEquality =
    ListEquality<LogicalKeySet>(LogicalKeySetEquality());
final logicalKeySetListEquals = logicalKeySetListEquality.equals;
final logicalKeySetListHash = logicalKeySetListEquality.hash;

class LogicalKeySetEquality implements Equality<LogicalKeySet> {
  const LogicalKeySetEquality();

  @override
  bool isValidKey(Object? o) => o is LogicalKeySet;

  @override
  bool equals(LogicalKeySet e1, LogicalKeySet e2) {
    return identical(e1, e2) || e1.equals(e2);
  }

  @override
  int hash(LogicalKeySet e) => Object.hashAll(e.triggers);
}

extension LogicalKeySetX on LogicalKeySet {
  bool equals(LogicalKeySet other) {
    final listEquals = const IterableEquality<LogicalKeyboardKey>().equals;
    return listEquals(other.triggers, triggers);
  }
}
