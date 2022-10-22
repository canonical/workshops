import 'package:async_value/async_value.dart';
import 'package:flutter/material.dart';
import 'package:lxd/lxd.dart';
import 'package:lxd_service/lxd_service.dart';
import 'package:lxd_x/lxd_x.dart';
import 'package:os_logo/os_logo.dart';
import 'package:provider/provider.dart';
import 'package:ubuntu_service/ubuntu_service.dart';

import 'instance_model.dart';

class InstanceTile extends StatefulWidget {
  const InstanceTile({super.key, this.onStart});

  final ValueChanged<LxdInstance>? onStart;

  static Widget create(
    BuildContext context, {
    required String name,
    required ValueChanged<LxdInstance>? onStart,
  }) {
    return ChangeNotifierProvider(
      key: ValueKey(name),
      create: (_) => InstanceModel(name, getService<LxdService>()),
      child: InstanceTile(onStart: onStart),
    );
  }

  @override
  State<InstanceTile> createState() => _InstanceTileState();
}

class _InstanceTileState extends State<InstanceTile> {
  @override
  void initState() {
    super.initState();
    final model = context.read<InstanceModel>();
    WidgetsBinding.instance.addPostFrameCallback((_) => model.init());
  }

  @override
  Widget build(BuildContext context) {
    final model = context.watch<InstanceModel>();
    final instance = model.instance.valueOrNull;
    final canStop = instance?.isRunning == true;
    final canDelete = instance?.isStopped == true;
    final canStart = widget.onStart != null && instance != null;
    return ListTile(
      leading: OsLogo.asset(name: instance?.imageName, size: 48),
      title: Text(instance?.name ?? ''),
      subtitle: Text(instance?.imageDescription ?? ''),
      trailing: instance?.isBusy == true
          ? _BusyButton()
          : canStop
              ? _StopButton(model.stop)
              : canDelete
                  ? _DeleteButton(model.delete)
                  : null,
      onTap: canStart ? () => widget.onStart!(instance) : null,
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
  const _StopButton(VoidCallback onPressed)
      : super(icon: const Icon(Icons.stop), onPressed: onPressed);
}

class _DeleteButton extends _IconButton {
  const _DeleteButton(VoidCallback onPressed)
      : super(icon: const Icon(Icons.close), onPressed: onPressed);
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
