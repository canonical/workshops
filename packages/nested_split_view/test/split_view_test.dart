import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nested_split_view/nested_split_view.dart';

void main() {
  Widget buildSplitView({Key? key, NestedSplitController? controller}) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: NestedSplitView(
        controller: controller,
        builder: (context, node) => Text(node.toString()),
      ),
    );
  }

  testWidgets('builder', (tester) async {
    final controller = NestedSplitController();

    await tester.pumpWidget(buildSplitView(controller: controller));

    final nodes = find.textContaining(RegExp(r'NestedSplitNode#\w+'));
    expect(nodes, findsOneWidget);

    controller.split(controller.children.single, AxisDirection.right);
    await tester.pump();

    expect(nodes, findsNWidgets(2));

    controller.unsplit(controller.children.first);
    await tester.pump();

    expect(nodes, findsOneWidget);
  });

  testWidgets('controller', (tester) async {
    final controller1 = NestedSplitController();
    final controller2 = NestedSplitController();

    await tester.pumpWidget(buildSplitView(controller: controller1));

    final nodes = find.textContaining(RegExp(r'NestedSplitNode#\w+'));
    expect(nodes, findsOneWidget);

    controller1.split(controller1.children.single, AxisDirection.right);
    await tester.pump();

    expect(nodes, findsNWidgets(2));

    await tester.pumpWidget(buildSplitView(controller: controller2));

    expect(nodes, findsOneWidget);
  });
}
