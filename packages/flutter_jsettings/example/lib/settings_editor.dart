import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_jsettings/flutter_jsettings.dart';

class SettingsEditor extends StatelessWidget {
  const SettingsEditor({
    super.key,
    required this.title,
    required this.settings,
    this.readOnly = false,
  });

  final Widget title;
  final JSettingsNotifier settings;
  final bool readOnly;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: title,
        actions: [
          Tooltip(
            message: settings.path,
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(Icons.info_outline),
            ),
          )
        ],
      ),
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
                readOnly: readOnly,
                decoration: InputDecoration(
                  label: Text(key),
                  suffix: IconButton(
                    iconSize: 16,
                    padding: EdgeInsets.zero,
                    icon: const Icon(Icons.close),
                    onPressed: !readOnly && settings.hasValue(key)
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
    );
  }
}
