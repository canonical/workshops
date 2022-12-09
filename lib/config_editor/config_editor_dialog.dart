import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:title_bar/title_bar.dart';
import 'package:yaru_widgets/yaru_widgets.dart';

import 'config_editor_model.dart';
import 'config_schema.dart';

Future<void> showConfigEditorDialog(
  BuildContext context, {
  required Map<String, String> config,
  required String assetName,
  required Future<void> Function(Map<String, String> config) onSaved,
}) async {
  final configSchema = await loadConfigSchema(assetName);
  return showDialog(
    context: context,
    builder: (context) => ChangeNotifierProvider(
      create: (_) => ConfigEditorModel(
        config: config,
        configSchema: configSchema,
        onSaved: onSaved,
      ),
      child: const ConfigEditorDialog(),
    ),
  );
}

class ConfigEditorDialog extends StatelessWidget {
  const ConfigEditorDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Dialog(
      clipBehavior: Clip.antiAlias,
      insetPadding: const EdgeInsets.all(20),
      child: SizedBox.fromSize(
        size: MediaQuery.of(context).size,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            DialogTitleBar(
              title: Text(l10n.configEditorTitle),
            ),
            const Expanded(
              child: Padding(
                padding: EdgeInsets.all(24),
                child: ConfigEditor(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ConfigEditor extends StatelessWidget {
  const ConfigEditor({super.key});

  Widget _buildRow({
    required String name,
    required String description,
    String? currentValue,
    Object? defaultValue,
    required String type,
    required void Function(String key, String value) updateValue,
    void Function(String key)? resetValue,
  }) {
    Widget? child;
    switch (type) {
      case 'string':
      case 'integer':
        child = SizedBox(
          width: 200,
          child: TextFormField(
            initialValue:
                currentValue?.toString() ?? defaultValue?.toString() ?? '',
            onChanged: (value) => updateValue(name, value),
          ),
        );
        break;
      case 'blob':
        child = SizedBox(
          width: 200,
          child: _MultiLineTextField(
            initialValue:
                currentValue?.toString() ?? defaultValue?.toString() ?? '',
            onChanged: (value) => updateValue(name, value),
          ),
        );
        break;
      case 'bool':
        child = YaruSwitch(
            value:
                currentValue.asBool ?? defaultValue.toString().asBool ?? false,
            onChanged: (value) => updateValue(name, value.toString()));
        break;
    }

    return ListTile(
      enabled: currentValue != null,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Tooltip(
            message: description,
            child: GestureDetector(
              onDoubleTap: () => resetValue?.call(name),
              child: Text(name),
            ),
          ),
          if (child != null) child,
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context, [bool mounted = true]) {
    final model = context.watch<ConfigEditorModel>();
    final l10n = AppLocalizations.of(context);

    return Column(
      children: [
        Expanded(
          child: YaruBorderContainer(
            color: Theme.of(context).backgroundColor,
            child: ListView(
              children: [
                ...model.configSchema.entries
                    .map((e) => _buildRow(
                          name: e.key,
                          description: e.value.description,
                          currentValue: model.config[e.key],
                          defaultValue: e.value.defaultValue,
                          type: e.value.type,
                          updateValue: model.updateValue,
                          resetValue: model.resetValue,
                        ))
                    .toList(),
              ],
            ),
          ),
        ),
        const SizedBox(height: 24),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            OutlinedButton(
              onPressed: Navigator.of(context).maybePop,
              child: Text(l10n.cancelButton),
            ),
            const SizedBox(width: 8),
            ElevatedButton(
              onPressed: () async {
                try {
                  await model.save();
                } on Exception catch (e) {
                  await showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text('Error'),
                      content: Text(
                        e.toString(),
                      ),
                      actions: [
                        OutlinedButton(
                          onPressed: Navigator.of(context).maybePop,
                          child: Text(l10n.okButton),
                        ),
                      ],
                    ),
                  );
                  return;
                }
                if (!mounted) return;
                await Navigator.of(context).maybePop();
              },
              child: Text(l10n.saveButton),
            ),
          ],
        )
      ],
    );
  }
}

class _MultiLineTextField extends StatefulWidget {
  const _MultiLineTextField({required this.initialValue, this.onChanged});
  final String initialValue;
  final void Function(String)? onChanged;

  @override
  State<_MultiLineTextField> createState() => __MultiLineTextFieldState();
}

class __MultiLineTextFieldState extends State<_MultiLineTextField> {
  late final ScrollController _controller;

  @override
  void initState() {
    super.initState();
    _controller = ScrollController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      controller: _controller,
      child: SingleChildScrollView(
        controller: _controller,
        scrollDirection: Axis.horizontal,
        child: IntrinsicWidth(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxHeight: 200, minWidth: 200),
            child: TextFormField(
              maxLines: null,
              initialValue: widget.initialValue,
              onChanged: widget.onChanged,
            ),
          ),
        ),
      ),
    );
  }
}

extension StringToBool on String? {
  bool? get asBool => this == 'true'
      ? true
      : this == 'false'
          ? false
          : null;
}
