import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

import 'settings_notifier.dart';

class SettingsEditor extends StatelessWidget {
  const SettingsEditor({
    super.key,
    required this.title,
    required this.settings,
  });

  final Widget title;
  final SettingsNotifier settings;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: title),
      body: AnimatedBuilder(
        animation: settings,
        builder: (context, child) {
          final keys = settings.getKeys().sorted();
          return ListView.separated(
            padding: const EdgeInsets.all(24),
            itemCount: keys.length,
            itemBuilder: (context, index) {
              final key = keys[index];
              final value = settings.getValue(key);
              return TextFormField(
                key: ValueKey('$key:$value'),
                decoration: InputDecoration(
                  label: Text(key),
                  suffix: IconButton(
                    icon: const Icon(Icons.close),
                    onPressed: settings.hasValue(key)
                        ? () => settings.resetValue(key)
                        : null,
                  ),
                ),
                initialValue: value.toString(),
                onFieldSubmitted: (value) => settings.setValue(key, value),
              );
            },
            separatorBuilder: (context, index) => const SizedBox(height: 24),
          );
        },
      ),
      floatingActionButton: const FloatingActionButton(
        onPressed: null,
        child: Icon(Icons.add),
      ),
    );
  }
}
