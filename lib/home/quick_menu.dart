import 'package:flutter/material.dart';
import 'package:lxd/lxd.dart';
import 'package:lxd_service/lxd_service.dart';
import 'package:lxd_x/lxd_x.dart';
import 'package:os_logo/os_logo.dart';
import 'package:provider/provider.dart';
import 'package:ubuntu_service/ubuntu_service.dart';
import 'package:yaru_icons/yaru_icons.dart';

import 'instance_model.dart';
import 'instance_store.dart';

class QuickMenuButton extends StatelessWidget {
  const QuickMenuButton({super.key, this.onSelected});

  final ValueChanged<LxdInstance>? onSelected;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
          visualDensity: const VisualDensity(horizontal: -4, vertical: -4)),
      child: PopupMenuButton<LxdInstance>(
        icon: const Icon(YaruIcons.pan_down),
        iconSize: 16,
        padding: EdgeInsets.zero,
        position: PopupMenuPosition.under,
        tooltip: '',
        itemBuilder: (context) {
          final store = context.read<InstanceStore>();
          return [
            for (final name in store.instances.value ?? <String>[])
              _QuickMenuItem(name)
          ];
        },
        onSelected: onSelected,
      ),
    );
  }
}

class _QuickMenuItem extends PopupMenuItem<LxdInstance> {
  const _QuickMenuItem(this.name) : super(child: null);

  final String name;

  @override
  PopupMenuItemState<LxdInstance, _QuickMenuItem> createState() =>
      _InstancePopupMenuItemState();
}

class _InstancePopupMenuItemState
    extends PopupMenuItemState<LxdInstance, _QuickMenuItem>
    with SingleTickerProviderStateMixin {
  LxdInstance? _instance;

  @override
  void handleTap() => Navigator.pop<LxdInstance>(context, _instance);

  @override
  Widget buildChild() {
    final service = getService<LxdService>();
    return ChangeNotifierProvider(
      create: (_) => InstanceModel(widget.name, service)..init(),
      builder: (context, child) {
        final model = context.watch<InstanceModel>();
        _instance = model.instance.value;
        return Row(
          children: [
            OsLogo.asset(
              name: model.instance.value?.os,
              size: 32,
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                widget.name,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        );
      },
    );
  }
}
