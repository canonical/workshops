import 'package:flutter/widgets.dart';

import 'logical_key_set_x.dart';

@immutable
class Command {
  const Command({
    required this.id,
    this.priority = 0,
    this.label,
    this.shortcuts,
    required this.intent,
  });

  final String id;
  final int priority;
  final String? label;
  final List<LogicalKeySet>? shortcuts;
  final Intent intent;

  Command copyWith({
    String? id,
    int? priority,
    String? label,
    String? description,
    List<LogicalKeySet>? shortcuts,
    Intent? intent,
  }) {
    return Command(
      id: id ?? this.id,
      priority: priority ?? this.priority,
      label: label ?? this.label,
      shortcuts: shortcuts ?? this.shortcuts,
      intent: intent ?? this.intent,
    );
  }

  @override
  String toString() {
    return 'Command(id: $id, priority: $priority, label: $label, shortcuts: $shortcuts)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Command &&
        other.id == id &&
        other.priority == priority &&
        other.label == label &&
        logicalKeySetListEquals(other.shortcuts, shortcuts) &&
        other.intent == intent;
  }

  @override
  int get hashCode {
    return Object.hash(
      id,
      priority,
      label,
      logicalKeySetListHash(shortcuts),
      intent,
    );
  }
}
