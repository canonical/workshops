import 'package:context_menu/context_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:lxd/lxd.dart';
import 'package:lxd_x/lxd_x.dart';
import 'package:os_logo/os_logo.dart';
import 'package:yaru_icons/yaru_icons.dart';

import 'instance_actions.dart';
import 'instance_context.dart';
import 'instance_intents.dart';
import 'instance_menu.dart';

class InstanceTile extends StatelessWidget {
  const InstanceTile({super.key, required this.id});

  final LxdInstanceId id;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    final instance = context.selectInstance(id);
    return InstanceActions(
      id: id,
      child: Builder(
        builder: (context) {
          final canStart =
              Actions.find<StartInstanceIntent>(context).isActionEnabled;
          final canStop =
              Actions.find<StopInstanceIntent>(context).isActionEnabled;
          final startHandler =
              Actions.handler(context, StartInstanceIntent(instance));
          final stopHandler =
              Actions.handler(context, StopInstanceIntent(instance));
          final deleteHandler =
              Actions.handler(context, DeleteInstanceIntent(instance));

          List<PopupMenuEntry<Intent>> popupMenuBuilder(BuildContext context) =>
              [
                PopupMenuItem(
                  value: SelectInstanceIntent(instance),
                  child: Text(l10n.openTerminalMenuItem),
                ),
                PopupMenuItem(
                  value: ShowInstanceInfoIntent(instance),
                  child: Text(l10n.instanceInformationMenuItem),
                ),
              ];

          return ContextMenuArea(
            builder: (context, position) => buildInstanceMenu(
              context: context,
              instance: instance,
            ),
            child: ListTile(
              leading: OsLogo.asset(name: instance?.imageName, size: 48),
              title: Text('${instance?.name} (${instance?.project})'),
              subtitle: Text(instance?.imageDescription ?? ''),
              onTap: () =>
                  Actions.invoke(context, SelectInstanceIntent(instance)),
              trailing: ButtonBar(
                mainAxisSize: MainAxisSize.min,
                children: [
                  instance?.isBusy == true
                      ? _BusyButton()
                      : canStop
                          ? _StopButton(stopHandler)
                          : canStart
                              ? _StartButton(startHandler)
                              : const SizedBox.shrink(),
                  _PopupMenuButton<Intent>(
                    itemBuilder: popupMenuBuilder,
                    onSelected: (value) => Actions.invoke(context, value),
                  ),
                  _DeleteButton(deleteHandler),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

extension _LxdInstanceImage on LxdInstance {
  String? get imageName => config['image.os']?.toLowerCase();
  String? get imageDescription => config['image.description'];
}

class _IconButton extends IconButton {
  const _IconButton({required super.icon, super.onPressed})
      : super(splashRadius: 24, iconSize: 16);
}

class _StartButton extends _IconButton {
  const _StartButton(VoidCallback? onPressed)
      : super(icon: const Icon(Icons.play_arrow), onPressed: onPressed);
}

class _StopButton extends _IconButton {
  const _StopButton(VoidCallback? onPressed)
      : super(icon: const Icon(Icons.stop), onPressed: onPressed);
}

class _DeleteButton extends _IconButton {
  const _DeleteButton(VoidCallback? onPressed)
      : super(icon: const Icon(YaruIcons.trash), onPressed: onPressed);
}

class _BusyButton extends IconButton {
  _BusyButton()
      : super(
          icon: const SizedBox.square(
            dimension: 16,
            child: CircularProgressIndicator(strokeWidth: 2),
          ),
          splashColor: Colors.transparent,
          hoverColor: Colors.transparent,
          onPressed: () {}, // block
        );
}

class _PopupMenuButton<T> extends PopupMenuButton<T> {
  const _PopupMenuButton({
    required super.itemBuilder,
    super.onSelected,
  }) : super(
          icon: const Icon(YaruIcons.view_more),
          splashRadius: 24,
          iconSize: 16,
        );
}
