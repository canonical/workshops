import 'package:flutter/widgets.dart';

import 'preferences_dialog.dart';
import 'preferences_intents.dart';

class PreferencesActions extends StatelessWidget {
  const PreferencesActions({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Actions(
      actions: {
        OpenPreferencesIntent: OpenPreferencesAction(),
      },
      child: child,
    );
  }
}

class OpenPreferencesAction extends ContextAction<OpenPreferencesIntent> {
  @override
  Future<void> invoke(OpenPreferencesIntent intent,
      [BuildContext? context]) async {
    if (context != null) {
      await showPreferencesDialog(context: context);
    }
  }
}
