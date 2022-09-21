import 'package:collection/collection.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nested_split_view/nested_split_view.dart';

void main() {
  test('structure', () {
    final controller = NestedSplitController();

    expect(
      controller,
      isSplit(
        NestedSplitType.horizontal,
        children: [
          isSplit(NestedSplitType.view),
        ],
        weights: [1.0],
      ),
    );
  });

  test('split horizontally', () {
    final controller = NestedSplitController();

    expect(
      controller.split(controller.children.single, Axis.horizontal),
      isTrue,
    );

    expect(
      controller,
      isSplit(
        NestedSplitType.horizontal,
        children: [
          isSplit(NestedSplitType.view),
          isSplit(NestedSplitType.view),
        ],
        weights: [0.5, 0.5],
      ),
    );
  });

  test('split vertically', () {
    final controller = NestedSplitController();

    expect(
      controller.split(controller.children.single, Axis.vertical),
      isTrue,
    );

    expect(
      controller,
      isSplit(
        NestedSplitType.vertical,
        children: [
          isSplit(NestedSplitType.view),
          isSplit(NestedSplitType.view),
        ],
        weights: [0.5, 0.5],
      ),
    );
  });

  test('unsplit first horizontal', () {
    final controller = NestedSplitController();

    expect(
      controller.split(controller.children.single, Axis.horizontal),
      isTrue,
    );

    expect(
      controller,
      isSplit(
        NestedSplitType.horizontal,
        children: [
          isSplit(NestedSplitType.view),
          isSplit(NestedSplitType.view),
        ],
        weights: [0.5, 0.5],
      ),
    );

    expect(controller.unsplit(controller.children.first), isTrue);

    expect(
      controller,
      isSplit(
        NestedSplitType.horizontal,
        children: [
          isSplit(NestedSplitType.view),
        ],
        weights: [1.0],
      ),
    );
  });

  test('unsplit last vertical', () {
    final controller = NestedSplitController();

    expect(
      controller.split(controller.children.single, Axis.vertical),
      isTrue,
    );

    expect(
      controller,
      isSplit(
        NestedSplitType.vertical,
        children: [
          isSplit(NestedSplitType.view),
          isSplit(NestedSplitType.view),
        ],
        weights: [0.5, 0.5],
      ),
    );

    expect(controller.unsplit(controller.children.last), isTrue);

    expect(
      controller,
      isSplit(
        NestedSplitType.vertical,
        children: [
          isSplit(NestedSplitType.view),
        ],
        weights: [1.0],
      ),
    );
  });

  test('collapse children', () {
    final controller = NestedSplitController();

    expect(
      controller.split(controller.children.single, Axis.horizontal),
      isTrue,
    );

    expect(
      controller,
      isSplit(
        NestedSplitType.horizontal,
        children: [
          isSplit(NestedSplitType.view),
          isSplit(NestedSplitType.view),
        ],
        weights: [0.5, 0.5],
      ),
    );

    expect(
      controller.split(controller.children.last, Axis.vertical),
      isTrue,
    );

    expect(
      controller,
      isSplit(
        NestedSplitType.horizontal,
        children: [
          isSplit(NestedSplitType.view),
          isSplit(
            NestedSplitType.vertical,
            children: [
              isSplit(NestedSplitType.view),
              isSplit(NestedSplitType.view),
            ],
            weights: [0.5, 0.5],
          ),
        ],
        weights: [0.5, 0.5],
      ),
    );

    expect(controller.unsplit(controller.children.first), isTrue);

    expect(
      controller,
      isSplit(
        NestedSplitType.vertical,
        children: [
          isSplit(NestedSplitType.view),
          isSplit(NestedSplitType.view),
        ],
        weights: [0.5, 0.5],
      ),
    );
  });

  test('collapse parent', () {
    final controller = NestedSplitController();

    expect(
      controller.split(controller.children.single, Axis.vertical),
      isTrue,
    );

    expect(
      controller,
      isSplit(
        NestedSplitType.vertical,
        children: [
          isSplit(NestedSplitType.view),
          isSplit(NestedSplitType.view),
        ],
        weights: [0.5, 0.5],
      ),
    );

    expect(
      controller.split(controller.children.last, Axis.horizontal),
      isTrue,
    );

    expect(
      controller,
      isSplit(
        NestedSplitType.vertical,
        children: [
          isSplit(NestedSplitType.view),
          isSplit(
            NestedSplitType.horizontal,
            children: [
              isSplit(NestedSplitType.view),
              isSplit(NestedSplitType.view),
            ],
            weights: [0.5, 0.5],
          ),
        ],
        weights: [0.5, 0.5],
      ),
    );

    expect(
      controller.split(controller.children.last.children.last, Axis.vertical),
      isTrue,
    );

    expect(
      controller,
      isSplit(
        NestedSplitType.vertical,
        children: [
          isSplit(NestedSplitType.view),
          isSplit(
            NestedSplitType.horizontal,
            children: [
              isSplit(NestedSplitType.view),
              isSplit(
                NestedSplitType.vertical,
                children: [
                  isSplit(NestedSplitType.view),
                  isSplit(NestedSplitType.view),
                ],
                weights: [0.5, 0.5],
              ),
            ],
            weights: [0.5, 0.5],
          ),
        ],
        weights: [0.5, 0.5],
      ),
    );

    expect(
      controller.unsplit(controller.children.last.children.last.children.last),
      isTrue,
    );

    expect(
      controller,
      isSplit(
        NestedSplitType.vertical,
        children: [
          isSplit(NestedSplitType.view),
          isSplit(
            NestedSplitType.horizontal,
            children: [
              isSplit(NestedSplitType.view),
              isSplit(NestedSplitType.view),
            ],
            weights: [0.5, 0.5],
          ),
        ],
        weights: [0.5, 0.5],
      ),
    );
  });

  test('middle split', () {
    final controller = NestedSplitController();

    expect(
      controller.split(controller.children.single, Axis.horizontal),
      isTrue,
    );

    expect(
      controller,
      isSplit(
        NestedSplitType.horizontal,
        children: [
          isSplit(NestedSplitType.view),
          isSplit(NestedSplitType.view),
        ],
        weights: [0.5, 0.5],
      ),
    );

    expect(
      controller.split(controller.children.first, Axis.horizontal),
      isTrue,
    );

    expect(
      controller,
      isSplit(
        NestedSplitType.horizontal,
        children: [
          isSplit(NestedSplitType.view),
          isSplit(NestedSplitType.view),
          isSplit(NestedSplitType.view),
        ],
        weights: [0.25, 0.25, 0.5],
      ),
    );
  });

  test('listener', () {
    final controller = NestedSplitController();

    var wasNotified = 0;
    controller.addListener(() => ++wasNotified);

    controller.split(controller.children.single, Axis.horizontal);
    expect(wasNotified, 1);

    controller.unsplit(controller.children.last);
    expect(wasNotified, 2);
  });

  test('dispose', () {
    final controller = NestedSplitController();

    final children = List.of(controller.children);
    expect(children, isNotEmpty);
    for (final child in children) {
      expect(child.parent, isNotNull);
    }

    controller.dispose();

    expect(controller.children, isEmpty);
    for (final child in children) {
      expect(child.parent, isNull);
    }
  });
}

class SplitMatcher extends Matcher {
  SplitMatcher(this.type, {this.children = const [], this.weights});

  final NestedSplitType type;
  final List<Matcher> children;
  final List<double?>? weights;

  @override
  Description describe(Description description) {
    switch (type) {
      case NestedSplitType.view:
        return description.add(type.toString());
      case NestedSplitType.horizontal:
      case NestedSplitType.vertical:
        return description.add('$type with ${children.length} children');
    }
  }

  @override
  bool matches(dynamic item, Map matchState) {
    final node = item as NestedSplitNode;
    return node.type == type &&
        children.length == node.children.length &&
        children.every((matcher) =>
            node.children.any((child) => matcher.matches(child, matchState))) &&
        (weights == null ||
            const ListEquality().equals(node.view!.weights, weights));
  }
}

Matcher isSplit(
  NestedSplitType type, {
  List<Matcher> children = const [],
  List<double?>? weights,
}) =>
    SplitMatcher(type, children: children, weights: weights);
