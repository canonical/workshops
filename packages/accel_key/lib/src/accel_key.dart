import 'package:flutter/material.dart';

class AccelKey extends StatelessWidget {
  const AccelKey({super.key, required this.keys, this.separator});

  final List<String> keys;
  final Widget? separator;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        for (final key in keys)
          Card(
            color: Theme.of(context).highlightColor,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(4)),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
              child: Text(key),
            ),
          ),
      ].separated(separator ?? const Text('+')).toList(),
    );
  }
}

extension _Separator on Iterable<Widget> {
  Iterable<Widget> separated(Widget separator) {
    return expand((item) sync* {
      yield separator;
      yield item;
    }).skip(1);
  }
}
