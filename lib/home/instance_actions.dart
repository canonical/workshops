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

abstract class InstanceAction<T extends InstanceIntent> extends Action<T> {
  InstanceAction(this._instance);

  final LxdInstance? _instance;

  LxdInstance? getInstance([InstanceIntent? intent]) {
    return intent?.instance ?? _instance;
  }
}

class StartInstanceAction extends InstanceAction<StartInstanceIntent> {
  StartInstanceAction(super.instance);

  @override
  bool get isActionEnabled => getInstance()?.canStart == true;

  @override
  bool isEnabled(StartInstanceIntent intent) {
    return getInstance(intent)?.canStart == true;
  }

  @override
  void invoke(StartInstanceIntent intent) {
    final instance = getInstance(intent);
    if (instance != null) {
      getService<LxdService>().startInstance(instance.name);
    }
  }
}

class StopInstanceAction extends InstanceAction<StopInstanceIntent> {
  StopInstanceAction(super.instance);

  @override
  bool get isActionEnabled => getInstance()?.canStop == true;

  @override
  bool isEnabled(StopInstanceIntent intent) {
    return getInstance(intent)?.canStop == true;
  }

  @override
  void invoke(StopInstanceIntent intent) {
    final instance = getInstance(intent);
    if (instance != null) {
      getService<LxdService>().stopInstance(instance.name);
    }
  }
}

class DeleteInstanceAction extends InstanceAction<DeleteInstanceIntent> {
  DeleteInstanceAction(super.instance);

  @override
  bool get isActionEnabled => getInstance()?.canDelete == true;

  @override
  bool isEnabled(DeleteInstanceIntent intent) {
    return getInstance(intent)?.canDelete == true;
  }

  @override
  void invoke(DeleteInstanceIntent intent) {
    final instance = getInstance(intent);
    if (instance != null) {
      getService<LxdService>().deleteInstance(instance.name);
    }
  }
}

extension _LxdInstanceX on LxdInstance {
  bool get canStart => !isRunning;
  bool get canStop => isRunning;
  bool get canDelete => isStopped;
}
