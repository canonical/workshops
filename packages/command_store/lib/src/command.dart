import 'package:collection/collection.dart';
import 'package:flutter/widgets.dart';

import 'logical_key_set_x.dart';

@immutable
class Command {
  const Command({
    required this.id,
    this.priority = 0,
    this.label,
    this.shortcuts,
    this.intent,
    this.children,
  });

  final String id;
  final int priority;
  final String? label;
  final List<LogicalKeySet>? shortcuts;
  final Intent? intent;
  final List<Command>? children;

  Command copyWith({
    String? id,
    int? priority,
    String? label,
    List<LogicalKeySet>? shortcuts,
    Intent? intent,
    List<Command>? children,
  }) {
    return Command(
      id: id ?? this.id,
      priority: priority ?? this.priority,
      label: label ?? this.label,
      shortcuts: shortcuts ?? this.shortcuts,
      intent: intent ?? this.intent,
      children: children ?? this.children,
    );
  }

  @override
  String toString() {
    return 'Command(id: $id, priority: $priority, label: $label, shortcuts: $shortcuts, children: $children)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    final deepEquals = const DeepCollectionEquality().equals;
    return other is Command &&
        other.id == id &&
        other.priority == priority &&
        other.label == label &&
        logicalKeySetListEquals(other.shortcuts, shortcuts) &&
        other.intent == intent &&
        deepEquals(other.children, children);
  }

  @override
  int get hashCode {
    final deepHash = const DeepCollectionEquality().hash;
    return Object.hash(
      id,
      priority,
      label,
      logicalKeySetListHash(shortcuts),
      intent,
      deepHash(children),
    );
  }
}
