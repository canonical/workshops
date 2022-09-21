import 'package:split_view/split_view.dart';

import 'split_controller.dart';

extension AxisX on Axis {
  NestedSplitType toSplitType() {
    switch (this) {
      case Axis.horizontal:
        return NestedSplitType.horizontal;
      case Axis.vertical:
        return NestedSplitType.vertical;
    }
  }
}

extension NestedSplitTypeX on NestedSplitType {
  SplitViewMode toViewMode() {
    switch (this) {
      case NestedSplitType.vertical:
        return SplitViewMode.Vertical;
      case NestedSplitType.horizontal:
        return SplitViewMode.Horizontal;
      default:
        throw StateError(name);
    }
  }
}
