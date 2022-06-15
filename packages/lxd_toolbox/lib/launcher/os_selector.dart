import 'package:flutter/material.dart';

import '../widgets/product_logo.dart';

class OsSelector extends StatelessWidget {
  const OsSelector({
    super.key,
    required this.items,
    this.selected,
    this.onSelected,
  });

  final List<String> items;
  final String? selected;
  final ValueChanged<String>? onSelected;

  @override
  Widget build(BuildContext context) {
    return GridView.custom(
      padding: const EdgeInsets.all(20),
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 192,
        mainAxisSpacing: 20,
        crossAxisSpacing: 20,
      ),
      childrenDelegate: SliverChildBuilderDelegate(
        (context, index) {
          final os = items[index];
          final theme = Theme.of(context);
          return ElevatedButton(
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.all(8),
              primary: theme.cardColor,
              onPrimary: theme.colorScheme.onSurface,
              surfaceTintColor: Colors.transparent,
              elevation: 1,
            ),
            child: Hero(
              tag: os,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ProductLogo.asset(
                    key: ValueKey(os),
                    name: os,
                    size: 48,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    os,
                    style: const TextStyle(overflow: TextOverflow.ellipsis),
                  ),
                ],
              ),
            ),
            onPressed: () => onSelected?.call(os),
          );
        },
        childCount: items.length,
      ),
    );
  }
}
