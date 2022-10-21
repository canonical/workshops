import 'package:flutter/widgets.dart';

import 'logical_key_set_x.dart';

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
    return other is Command &&
        other.id == id &&
        logicalKeySetListEquals(other.shortcuts, shortcuts) &&
        other.intent == intent;
  }

  @override
  int get hashCode => Object.hash(id, logicalKeySetListHash(shortcuts), intent);
}
