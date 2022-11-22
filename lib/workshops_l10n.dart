import 'package:flutter/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:lxd/lxd.dart';

extension LxdInstanceStatusL10n on LxdInstanceStatus {
  String localize(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    switch (this) {
      case LxdInstanceStatus.running:
        return l10n.lxdInstanceStatusRunning;
      case LxdInstanceStatus.stopped:
        return l10n.lxdInstanceStatusStopped;
      case LxdInstanceStatus.frozen:
        return l10n.lxdInstanceStatusFrozen;
      case LxdInstanceStatus.error:
        return l10n.lxdInstanceStatusError;
    }
  }
}

extension LxdInstanceTypeL10n on LxdInstanceType {
  String localize(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    switch (this) {
      case LxdInstanceType.container:
        return l10n.lxdInstanceTypeContainer;
      case LxdInstanceType.virtualMachine:
        return l10n.lxdInstanceTypeVirtualMachine;
    }
  }
}
