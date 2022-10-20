import 'package:collection/collection.dart';
import 'package:flutter/widgets.dart';

@immutable
class Command {
  const Command({
    required this.id,
    this.shortcuts,
    required this.intent,
  });

  final String id;
  final List<LogicalKeySet>? shortcuts;
  final Intent intent;

  void execute() {
    void dispatchIntent() {
      Actions.maybeInvoke(primaryFocus!.context!, intent);
      FocusManager.instance.removeListener(dispatchIntent);
    }

    FocusManager.instance.addListener(dispatchIntent);
  }

  Command copyWith({
    String? id,
    List<LogicalKeySet>? shortcuts,
    Intent? intent,
  }) {
    return Command(
      id: id ?? this.id,
      shortcuts: shortcuts ?? this.shortcuts,
      intent: intent ?? this.intent,
    );
  }

  @override
  String toString() {
    return 'Command(id: $id, shortcuts: $shortcuts)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    final listEquals = const ListEquality().equals;
    return other is Command &&
        other.id == id &&
        listEquals(other.shortcuts, shortcuts) &&
        other.intent == intent;
  }

  @override
  int get hashCode {
    final listHash = const ListEquality().hash;
    return Object.hash(id, listHash(shortcuts), intent);
  }
}
