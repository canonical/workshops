import 'package:flutter/widgets.dart';
import 'package:lxd/lxd.dart';
import 'package:provider/provider.dart';

import '../tabs/tab_item.dart';
import 'instance_intents.dart';
import 'instance_model.dart';

class InstanceActions extends StatelessWidget {
  const InstanceActions({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final model = context.read<InstanceModel>();
    return Actions(
      actions: {
        StartInstanceIntent: StartInstanceAction(model),
        StopInstanceIntent: StopInstanceAction(model),
        DeleteInstanceIntent: DeleteInstanceAction(model),
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
  StartInstanceAction(this.model) {
    model.addListener(notifyActionListeners);
  }

  final InstanceModel model;

  @override
  bool get isActionEnabled => !model.isRunning;

  @override
  void invoke(StartInstanceIntent intent) => model.start();
}

class StopInstanceAction extends Action<StopInstanceIntent> {
  StopInstanceAction(this.model) {
    model.addListener(notifyActionListeners);
  }

  final InstanceModel model;

  @override
  bool get isActionEnabled => model.isRunning;

  @override
  void invoke(StopInstanceIntent intent) => model.stop();
}

class DeleteInstanceAction extends Action<DeleteInstanceIntent> {
  DeleteInstanceAction(this.model) {
    model.addListener(notifyActionListeners);
  }

  final InstanceModel model;

  @override
  bool get isActionEnabled => model.isStopped;

  @override
  void invoke(DeleteInstanceIntent intent) => model.delete();
}
