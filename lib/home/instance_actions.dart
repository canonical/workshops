import 'package:flutter/widgets.dart';
import 'package:lxd/lxd.dart';
import 'package:lxd_service/lxd_service.dart';
import 'package:lxd_x/lxd_x.dart';
import 'package:provider/provider.dart';
import 'package:ubuntu_service/ubuntu_service.dart';

import '../tabs/tab_item.dart';
import 'instance_context.dart';
import 'instance_intents.dart';

class InstanceActions extends StatelessWidget {
  const InstanceActions({super.key, this.name, required this.child});

  final Widget child;
  final String? name;

  @override
  Widget build(BuildContext context) {
    final instance = context.selectInstance(name ?? '');
    return Actions(
      actions: {
        StartInstanceIntent: StartInstanceAction(instance),
        StopInstanceIntent: StopInstanceAction(instance),
        DeleteInstanceIntent: DeleteInstanceAction(instance),
      },
      child: child,
    );
  }
}

class SelectInstanceAction extends ContextAction<SelectInstanceIntent> {
  SelectInstanceAction(this.onSelected);

  final ValueChanged<LxdInstance> onSelected;

  @override
  void invoke(SelectInstanceIntent intent, [BuildContext? context]) {
    final tab = context?.read<TabItem>();
    tab?.instance = intent.instance;
  }
}

class StartInstanceAction extends Action<StartInstanceIntent> {
  StartInstanceAction(this.instance);

  final LxdInstance? instance;

  @override
  bool get isActionEnabled => instance?.isRunning != true;

  @override
  void invoke(StartInstanceIntent intent) {
    final service = getService<LxdService>();
    service.startInstance(intent.instance?.name ?? instance!.name);
  }
}

class StopInstanceAction extends Action<StopInstanceIntent> {
  StopInstanceAction(this.instance);

  final LxdInstance? instance;

  @override
  bool get isActionEnabled => instance?.isRunning == true;

  @override
  void invoke(StopInstanceIntent intent) {
    final service = getService<LxdService>();
    service.stopInstance(intent.instance?.name ?? instance!.name);
  }
}

class DeleteInstanceAction extends Action<DeleteInstanceIntent> {
  DeleteInstanceAction(this.instance);

  final LxdInstance? instance;

  @override
  bool get isActionEnabled => instance?.isStopped == true;

  @override
  void invoke(DeleteInstanceIntent intent) {
    final service = getService<LxdService>();
    service.deleteInstance(intent.instance?.name ?? instance!.name);
  }
}
