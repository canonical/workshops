import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:title_bar/title_bar.dart';
import 'package:ubuntu_service/ubuntu_service.dart';
import 'package:ubuntu_widgets/ubuntu_widgets.dart';
import 'package:yaru_widgets/yaru_widgets.dart';

import 'preferences_model.dart';
import 'shortcut_view.dart';

Future<void> showPreferencesDialog({required BuildContext context}) async {
  return showDialog(
    context: context,
    builder: (context) {
      return ChangeNotifierProvider(
        create: (_) => PreferencesModel(getService<SharedPreferences>()),
        child: const PreferencesDialog(),
      );
    },
  );
}

class PreferencesDialog extends StatelessWidget {
  const PreferencesDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return CallbackShortcuts(
      bindings: {
        const SingleActivator(LogicalKeyboardKey.escape):
            Navigator.of(context).pop,
      },
      child: Dialog(
        insetPadding: const EdgeInsets.all(20),
        child: SizedBox.fromSize(
          size: MediaQuery.of(context).size,
          child: Column(
            children: [
              DialogTitleBar(
                title: Text(l10n.preferencesTitle),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: RoundedContainer(
                    child: YaruMasterDetailPage(
                      length: 1,
                      tileBuilder: (context, index, selected) =>
                          const YaruMasterTile(
                        title: Text('Shortcuts'),
                      ),
                      pageBuilder: (context, index) => const YaruDetailPage(
                        body: ShortcutView(),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 24, bottom: 24, right: 24),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    OutlinedButton(
                      onPressed: Navigator.of(context).pop,
                      child: const Text('Close'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
