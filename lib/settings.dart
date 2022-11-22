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
