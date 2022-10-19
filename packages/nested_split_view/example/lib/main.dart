import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:nested_split_view/nested_split_view.dart';

const kColors = <MaterialColor>[
  Colors.pink,
  Colors.red,
  Colors.deepOrange,
  Colors.orange,
  Colors.amber,
  Colors.yellow,
  Colors.lime,
  Colors.lightGreen,
  Colors.green,
  Colors.teal,
  Colors.cyan,
  Colors.lightBlue,
  Colors.blue,
  Colors.indigo,
  Colors.purple,
  Colors.deepPurple,
  Colors.blueGrey,
  Colors.brown,
];

void main() => runApp(const MaterialApp(home: MyPage()));

class MyPage extends StatefulWidget {
  const MyPage({super.key});

  @override
  State<MyPage> createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  final _controller = NestedSplitController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nested SplitView'),
      ),
      body: NestedSplitView(
        controller: _controller,
        builder: buildPane,
      ),
    );
  }

  Widget buildPane(BuildContext context, NestedSplitNode node) {
    return MyPane(
      node: node,
      onSplit: (direction) {
        _controller.split(node, direction);
        debugPrint(_controller.toStringDeep());
      },
      onRemove: () {
        _controller.unsplit(node);
        debugPrint(_controller.toStringDeep());
      },
    );
  }
}

class MyPane extends StatelessWidget {
  const MyPane({
    super.key,
    required this.node,
    required this.onSplit,
    required this.onRemove,
  });

  final NestedSplitNode node;
  final ValueChanged<AxisDirection> onSplit;
  final VoidCallback onRemove;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: kColors[node.hashCode % kColors.length][100],
        border: Border.all(color: Colors.black54),
      ),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(describeIdentity(node)),
          ),
          Positioned(
            top: 0,
            right: 0,
            child: IconButton(
              onPressed: onRemove,
              iconSize: 16,
              icon: const Icon(Icons.close),
            ),
          ),
          Center(
            child: IntrinsicHeight(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  border: Border.all(color: Theme.of(context).dividerColor),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextButton(
                      onPressed: () => onSplit(AxisDirection.up),
                      child: const Icon(Icons.arrow_upward),
                    ),
                    const VerticalDivider(width: 1, thickness: 1),
                    TextButton(
                      onPressed: () => onSplit(AxisDirection.down),
                      child: const Icon(Icons.arrow_downward),
                    ),
                    const VerticalDivider(width: 1, thickness: 1),
                    TextButton(
                      onPressed: () => onSplit(AxisDirection.left),
                      child: const Icon(Icons.arrow_back),
                    ),
                    const VerticalDivider(width: 1, thickness: 1),
                    TextButton(
                      onPressed: () => onSplit(AxisDirection.right),
                      child: const Icon(Icons.arrow_forward),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
