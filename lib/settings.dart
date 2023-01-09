import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_jsettings/flutter_jsettings.dart';
import 'package:lxd_service/lxd_service.dart';
import 'package:provider/provider.dart';

class DefaultSettings extends JSettingsNotifier with JSettingsReadOnlyMixin {
  DefaultSettings(super.path);
}

class AppSettings extends JSettingsNotifier with JSettingsInheritedMixin {
  AppSettings(super.path);
}

class DefaultRemotes extends JSettingsNotifier with JSettingsReadOnlyMixin {
  DefaultRemotes(super.path);
}

class RemoteSettings extends JSettingsNotifier with JSettingsInheritedMixin {
  RemoteSettings(super.path);

  String getCurrent() => getValue('current') as String;
  Future<void> setCurrent(String? value) => setValue('current', value);

  List<LxdRemote> getRemotes() {
    return (getValue('remotes') as List)
        .map((json) => LxdRemote.fromJson(json as Map<String, dynamic>))
        .toList();
  }
}

class DefaultShortcuts extends JSettingsNotifier with JSettingsReadOnlyMixin {
  DefaultShortcuts(super.path);
}

class ShortcutSettings extends JSettingsNotifier with JSettingsInheritedMixin {
  ShortcutSettings(super.path);
}

extension ThemeSettings on JSettings {
  ThemeMode? get themeMode {
    final theme = (getValue('app.theme') as String?)?.toLowerCase();
    return ThemeMode.values.firstWhereOrNull((mode) => mode.name == theme);
  }

  Future<void> setThemeMode(ThemeMode? value) {
    return setValue('app.theme', value?.name);
  }
}

extension SettingsContext on BuildContext {
  ThemeMode? get themeMode {
    return select<AppSettings, ThemeMode?>((settings) => settings.themeMode);
  }
}
