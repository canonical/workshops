import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import 'tab_intents.dart';
import 'tab_model.dart';

class TabActions extends StatelessWidget {
  const TabActions({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final model = context.read<TabModel>();
    return Actions(
      actions: {
        AddTabIntent: AddTabAction(model),
        CloseTabIntent: CloseTabAction(model),
        MoveTabIntent: MoveTabAction(model),
        NextTabIntent: NextTabAction(model),
        PreviousTabIntent: PreviousTabAction(model),
      },
      child: child,
    );
  }
}

abstract class TabAction<T extends Intent> extends Action<T> {
  TabAction(this.model) {
    model.addListener(notifyActionListeners);
  }

  final TabModel model;
}

class AddTabAction extends TabAction<AddTabIntent> {
  AddTabAction(super.model);

  @override
  void invoke(AddTabIntent intent) => model.newTab(intent.instance);
}

class CloseTabAction extends TabAction<CloseTabIntent> {
  CloseTabAction(super.model);

  @override
  bool get isActionEnabled => model.length > 1;

  @override
  void invoke(CloseTabIntent intent) {
    if (intent.index != null) {
      model.removeTab(intent.index!);
    } else {
      model.closeTab();
    }
  }
}

class MoveTabAction extends TabAction<MoveTabIntent> {
  MoveTabAction(super.model);

  @override
  void invoke(MoveTabIntent intent) => model.moveTab(intent.from, intent.to);
}

class NextTabAction extends TabAction<NextTabIntent> {
  NextTabAction(super.model);

  @override
  void invoke(NextTabIntent intent) => model.nextTab();
}

class PreviousTabAction extends TabAction<PreviousTabIntent> {
  PreviousTabAction(super.model);

  @override
  void invoke(PreviousTabIntent intent) => model.previousTab();
}
