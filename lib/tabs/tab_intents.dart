import 'package:flutter/widgets.dart';
import 'package:lxd/lxd.dart';

class AddTabIntent extends Intent {
  const AddTabIntent([this.instance]);
  final LxdInstance? instance;
}

class CloseTabIntent extends Intent {
  const CloseTabIntent([this.index]);
  final int? index;
}

class MoveTabIntent extends Intent {
  const MoveTabIntent(this.from, this.to);
  final int from;
  final int to;
}

class NextTabIntent extends Intent {
  const NextTabIntent();
}

class PreviousTabIntent extends Intent {
  const PreviousTabIntent();
}
