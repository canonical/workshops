import 'package:flutter/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:lxd/lxd.dart';

extension LxdImageTypeL10n on LxdImageType {
  String localize(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    switch (this) {
      case LxdImageType.container:
        return l10n.containerLabel;
      case LxdImageType.virtualMachine:
        return l10n.virtualMachineLabel;
    }
  }
}
