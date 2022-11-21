import 'package:flutter/widgets.dart';
import 'package:lxd/lxd.dart';

abstract class InstanceIntent extends Intent {
  const InstanceIntent(this.instance);
  final LxdInstance? instance;
}

class SelectInstanceIntent extends InstanceIntent {
  const SelectInstanceIntent(super.instance);
}

class StartInstanceIntent extends InstanceIntent {
  const StartInstanceIntent(super.instance);
}

class StopInstanceIntent extends InstanceIntent {
  const StopInstanceIntent(super.instance);
}

class DeleteInstanceIntent extends InstanceIntent {
  const DeleteInstanceIntent(super.instance);
}

class ShowInstanceInfoIntent extends InstanceIntent {
  const ShowInstanceInfoIntent(super.instance);
}
