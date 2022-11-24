import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../settings.dart';

class AppearanceView extends StatelessWidget {
  const AppearanceView({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final settings = context.watch<AppSettings>();
    return ListView(
      padding: const EdgeInsets.symmetric(vertical: 20),
      children: [
        ListTile(
          title: Text(l10n.themeLabel),
          trailing: IntrinsicWidth(
            child: DropdownButtonFormField<ThemeMode>(
              value: settings.themeMode,
              items: [
                for (final value in ThemeMode.values)
                  DropdownMenuItem(
                    value: value,
                    child: Text(value.name),
                  ),
              ],
              onChanged: settings.setThemeMode,
            ),
          ),
        ),
      ],
    );
  }
}
