import 'package:split_view/split_view.dart';

import 'split_controller.dart';

extension AxisDirectionX on AxisDirection {
  NestedSplitType toSplitType() {
    switch (this) {
      case AxisDirection.left:
      case AxisDirection.right:
        return NestedSplitType.horizontal;
      case AxisDirection.up:
      case AxisDirection.down:
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
