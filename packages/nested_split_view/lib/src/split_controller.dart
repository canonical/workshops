import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/painting.dart' show AxisDirection;
import 'package:split_view/split_view.dart';

import 'split_x.dart';
export 'package:flutter/painting.dart' show AxisDirection;

enum NestedSplitType { horizontal, vertical, view }

class NestedSplitController extends NestedSplitNode with ChangeNotifier {
  NestedSplitController() : super._(NestedSplitType.horizontal) {
    _appendChild(NestedSplitNode._(NestedSplitType.view));
  }

  @override
  bool split(NestedSplitNode node, AxisDirection direction) {
    final res = super.split(node, direction);
    if (res) notifyListeners();
    return res;
  }

  @override
  bool unsplit(NestedSplitNode node) {
    final res = super.unsplit(node);
    if (res) notifyListeners();
    return res;
  }

  @override
  void dispose() {
    _disposeSplit();
    super.dispose();
  }
}

class NestedSplitNode with DiagnosticableTreeMixin {
  NestedSplitNode._([this._type]) {
    if (type != NestedSplitType.view) {
      _view = SplitViewController(weights: [1.0]);
    }
  }

  NestedSplitType? _type;
  NestedSplitNode? _parent;
  final _children = <NestedSplitNode>[];
  SplitViewController? _view;

  NestedSplitType get type => _type!;
  NestedSplitNode? get parent => _parent;
  List<NestedSplitNode> get children => _children;
  SplitViewController? get view => _view;

  int get length {
    switch (type) {
      case NestedSplitType.horizontal:
      case NestedSplitType.vertical:
        return _children.fold<int>(0, (p, c) => p + c.length);
      case NestedSplitType.view:
        return 1;
    }
  }

  bool split(NestedSplitNode node, AxisDirection direction) {
    if (node == this) {
      parent?._splitChild(this, direction);
      return true;
    }
    return children.any((c) => c.split(node, direction));
  }

  bool unsplit(NestedSplitNode node) {
    if (node == this) {
      parent?._unsplitChild(this);
      return true;
    }
    return children.any((c) => c.unsplit(node));
  }

  void dispose() => _disposeSplit();

  void _disposeSplit() {
    _parent = null;
    for (final child in children) {
      child.dispose();
    }
    _children.clear();
    _view?.dispose();
    _view = null;
  }

  void _appendChild(NestedSplitNode child) {
    child._parent?._removeChild(child);
    _children.add(child);
    child._parent = this;
  }

  void _insertChild(int index, NestedSplitNode child) {
    child._parent?._removeChild(child);
    _children.replaceRange(index, index, [child]);
    child._parent = this;
  }

  void _removeChild(NestedSplitNode child) {
    child._parent = null;
    _children.remove(child);
  }

  void _replaceChild(NestedSplitNode before, NestedSplitNode after) {
    final index = _children.indexOf(before);
    _removeChild(before);
    _insertChild(index, after);
  }

  void _splitChild(NestedSplitNode child, AxisDirection direction) {
    final node = NestedSplitNode._(NestedSplitType.view);
    final index = _children.indexOf(child);
    final type = direction.toSplitType();
    if (_type == type || _children.length == 1) {
      _type = type;
      _addWeight(index);
      if (direction == AxisDirection.left || direction == AxisDirection.up) {
        _insertChild(index, node);
      } else {
        _insertChild(index + 1, node);
      }
    } else {
      final split = NestedSplitNode._(type);
      if (direction == AxisDirection.left || direction == AxisDirection.up) {
        split._appendChild(node);
        split._appendChild(child);
      } else {
        split._appendChild(child);
        split._appendChild(node);
      }
      split.view!.weights = [0.5, 0.5];
      _insertChild(index, split);
    }
  }

  void _unsplitChild(NestedSplitNode child) {
    final index = _children.indexOf(child);
    _removeWeight(index);
    _removeChild(child);
    if (children.length == 1) {
      final singleChild = children.single;
      if (parent != null) {
        parent!._replaceChild(this, singleChild);
        dispose();
      } else if (singleChild.type != NestedSplitType.view) {
        _type = singleChild.type;
        final granChildren = List.of(singleChild.children);
        _removeChild(singleChild);
        for (final granChild in granChildren) {
          _appendChild(granChild);
        }
        view!.weights = List.of(singleChild.view!.weights);
        singleChild.dispose();
      }
    }
  }

  void _addWeight(int index) {
    final weights = List.of(view!.weights);
    final half = (weights[index] ?? 1.0) / 2;
    weights.replaceRange(index, index + 1, [half, half]);
    view!.weights = weights;
  }

  void _removeWeight(int index) {
    final weights = List.of(view!.weights);
    final weight = weights.removeAt(index)!;
    if (index > 0) {
      weights[index - 1] = (weights[index - 1] ?? 0) + weight;
    } else if (index < weights.length) {
      weights[index] = (weights[index] ?? 0) + weight;
    }
    view!.weights = weights;
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(EnumProperty<NestedSplitType>('type', type));
    properties.add(DiagnosticsProperty('children', children));
    if (view != null) {
      properties.add(DiagnosticsProperty('weights', view!.weights));
    }
  }

  @override
  List<DiagnosticsNode> debugDescribeChildren() {
    return _children.mapIndexed((index, child) {
      return child.toDiagnosticsNode(name: '#$index');
    }).toList();
  }
}
