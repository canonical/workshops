import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:settings_store/settings_store.dart';

class DefaultSettings extends SettingsStore with ReadOnlySettings {
  DefaultSettings(super.path);
}

class AppSettings extends SettingsStore with InheritedSettings {
  AppSettings(super.path);
}

class DefaultShortcuts extends SettingsStore with ReadOnlySettings {
  DefaultShortcuts(super.path);
}

class ShortcutSettings extends SettingsStore with InheritedSettings {
  ShortcutSettings(super.path);
}

extension ThemeSettings on SettingsStore {
  ThemeMode? get themeMode {
    final theme = (getValue('app.theme') as String?)?.toLowerCase();
    return ThemeMode.values.firstWhereOrNull((mode) => mode.name == theme);
  }

  Future<void> setThemeMode(ThemeMode? value) {
    return setValue('app.theme', value?.name);
  }
}
