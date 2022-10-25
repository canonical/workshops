import 'package:flutter/widgets.dart';

import 'logical_key_set_x.dart';

@immutable
class Command {
  const Command({
    required this.id,
    this.priority = 0,
    this.shortcuts,
    required this.intent,
  });

  final String id;
  final int priority;
  final List<LogicalKeySet>? shortcuts;
  final Intent intent;

  Command copyWith({
    String? id,
    int? priority,
    List<LogicalKeySet>? shortcuts,
    Intent? intent,
  }) {
    return Command(
      id: id ?? this.id,
      priority: priority ?? this.priority,
      shortcuts: shortcuts ?? this.shortcuts,
      intent: intent ?? this.intent,
    );
  }

  @override
  String toString() {
    return 'Command(id: $id, priority: $priority, shortcuts: $shortcuts)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Command &&
        other.id == id &&
        other.priority == priority &&
        logicalKeySetListEquals(other.shortcuts, shortcuts) &&
        other.intent == intent;
  }

  @override
  int get hashCode {
    return Object.hash(id, priority, logicalKeySetListHash(shortcuts), intent);
  }
}
