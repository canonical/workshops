import 'package:command_store/command_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../tabs/tab_intents.dart';
import 'instance_intents.dart';
import 'instance_store.dart';

class InstanceCommands extends StatelessWidget {
  const InstanceCommands({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final store = context.watch<InstanceStore>();
    return CommandScope(
      commands: [
        if (store.instances.value?.isNotEmpty == true) ...[
          Command(
            id: 'instance-launch',
            priority: 20,
            label: l10n.launchInstanceCommand,
            children: store.instances.value
                ?.map((i) => Command(
                    id: 'instance-launch-$i',
                    label: i,
                    intent: VoidCallbackIntent(() {
                      Actions.invoke(
                        primaryFocus!.context!,
                        AddTabIntent(store.getInstance(i)),
                      );
                    })))
                .toList(),
          ),
          Command(
            id: 'instance-start',
            priority: 20,
            label: l10n.startInstanceCommand,
            children: store.instances.value
                ?.map((i) => Command(
                    id: 'instance-start-$i',
                    label: i,
                    intent: VoidCallbackIntent(() {
                      Actions.invoke(
                        primaryFocus!.context!,
                        StartInstanceIntent(store.getInstance(i)),
                      );
                    })))
                .toList(),
          ),
          Command(
            id: 'instance-stop',
            priority: 20,
            label: l10n.stopInstanceCommand,
            children: store.instances.value
                ?.map((i) => Command(
                    id: 'instance-stop-$i',
                    label: i,
                    intent: VoidCallbackIntent(() {
                      Actions.invoke(
                        primaryFocus!.context!,
                        StopInstanceIntent(store.getInstance(i)),
                      );
                    })))
                .toList(),
          ),
          Command(
            id: 'instance-delete',
            priority: 20,
            label: l10n.deleteInstanceCommand,
            children: store.instances.value
                ?.map((i) => Command(
                    id: 'instance-delete-$i',
                    label: i,
                    intent: VoidCallbackIntent(() {
                      Actions.invoke(
                        primaryFocus!.context!,
                        DeleteInstanceIntent(store.getInstance(i)),
                      );
                    })))
                .toList(),
          ),
        ],
      ],
      child: child,
    );
  }
}
