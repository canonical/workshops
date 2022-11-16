import 'package:accel_key/accel_key.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ubuntu_localizations/ubuntu_localizations.dart';

extension LogicalKeySetL10n on LogicalKeySet {
  List<String> localize(BuildContext context) {
    return sorted().map((k) => k.localize(context)).toList();
  }
}

extension LogicalKeyboardKeyL10n on LogicalKeyboardKey {
  String localize(BuildContext context) {
    final l10n = UbuntuLocalizations.of(context);
    if (isAlt) return l10n.altKey;
    if (isControl) return l10n.controlKey;
    if (isMeta) return l10n.metaKey;
    if (isShift) return l10n.shiftKey;
    return keyLabel.removePrefix('Key ').removePrefix('Arrow ');
  }
}

extension _StringX on String {
  String removePrefix(String prefix) {
    if (!startsWith(prefix)) return this;
    return substring(prefix.length);
  }
}
