import 'package:flutter/material.dart';
import 'package:lxc_config/lxc_config.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ubuntu_service/ubuntu_service.dart';

import 'preferences_model.dart';

Future<void> showPreferencesDialog({required BuildContext context}) async {
  return showDialog(
    context: context,
    builder: (context) {
      return ChangeNotifierProvider(
        create: (_) => PreferencesModel(
          config: getService<LxcConfig>(),
          preferences: getService<SharedPreferences>(),
        ),
        child: const PreferencesDialog(),
      );
    },
  );
}

class PreferencesDialog extends StatelessWidget {
  const PreferencesDialog({super.key});

  @override
  Widget build(BuildContext context) {
    // final model = context.watch<PreferencesModel>();
    return AlertDialog(
      title: const Text('Preferences'),
      content: const SizedBox(
        width: 900,
        height: 600,
        child: Center(
          child: Text('TODO'),
        ),
      ),
      actions: [
        OutlinedButton(
          onPressed: Navigator.of(context).pop,
          child: const Text('Close'),
        )
      ],
    );
  }
}
