import 'package:context_menu/context_menu.dart';
import 'package:flutter/material.dart';
import 'package:lxd/lxd.dart';
import 'package:lxd_x/lxd_x.dart';
import 'package:os_logo/os_logo.dart';
import 'package:provider/provider.dart';
import 'package:yaru_icons/yaru_icons.dart';

import 'instance_actions.dart';
import 'instance_intents.dart';
import 'instance_menu.dart';
import 'instance_store.dart';

class InstanceTile extends StatelessWidget {
  const InstanceTile({super.key, required this.name});

  final String name;

  @override
  Widget build(BuildContext context) {
    final instance =
        context.select<InstanceStore, LxdInstance?>((s) => s.get(name));
    return InstanceActions(
      name: name,
      child: Builder(
        builder: (context) {
          final canStop =
              Actions.find<StopInstanceIntent>(context).isActionEnabled;
          final stopHandler =
              Actions.handler(context, StopInstanceIntent(instance));

          final canDelete =
              Actions.find<DeleteInstanceIntent>(context).isActionEnabled;
          final deleteHandler =
              Actions.handler(context, DeleteInstanceIntent(instance));

          return ContextMenuArea(
            builder: (context, position) => buildInstanceMenu(
              context: context,
              instance: instance,
            ),
            child: ListTile(
              leading: OsLogo.asset(name: instance?.imageName, size: 48),
              title: Text(instance?.name ?? ''),
              subtitle: Text(instance?.imageDescription ?? ''),
              trailing: instance?.isBusy == true
                  ? _BusyButton()
                  : canStop
                      ? _StopButton(stopHandler)
                      : canDelete
                          ? _DeleteButton(deleteHandler)
                          : null,
              onTap: () {
                Actions.invoke(context, SelectInstanceIntent(instance));
                Actions.invoke(context, StartInstanceIntent(instance));
              },
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

class _StopButton extends _IconButton {
  const _StopButton(VoidCallback? onPressed)
      : super(icon: const Icon(Icons.stop), onPressed: onPressed);
}

class _DeleteButton extends _IconButton {
  const _DeleteButton(VoidCallback? onPressed)
      : super(icon: const Icon(YaruIcons.window_close), onPressed: onPressed);
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
