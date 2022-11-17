import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:os_logo/os_logo.dart';
import 'package:provider/provider.dart';
import 'package:ubuntu_widgets/ubuntu_widgets.dart';
import 'package:wizard_router/wizard_router.dart';

import 'launcher_model.dart';
import 'launcher_page.dart';
import 'property_model.dart';

class PropertyPage extends StatefulWidget {
  const PropertyPage({super.key});

  static Widget create(BuildContext context) {
    final launcher = context.read<LauncherModel>();
    return ChangeNotifierProvider(
      create: (_) => PropertyModel(launcher.image!),
      child: const PropertyPage(),
    );
  }

  @override
  State<PropertyPage> createState() => _PropertyPageState();
}

class _PropertyPageState extends State<PropertyPage> {
  late final TextEditingController _nameController;

  @override
  void initState() {
    super.initState();

    final model = context.read<PropertyModel>();
    _nameController = TextEditingController(text: model.name);
    _nameController.addListener(() => model.name = _nameController.text);
  }

  @override
  void dispose() {
    super.dispose();
    _nameController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final model = context.watch<PropertyModel>();
    final l10n = AppLocalizations.of(context);
    return LauncherPage(
      title: Text(l10n.launchInstanceTitle),
      content: RoundedContainer(
        child: Padding(
          padding: const EdgeInsets.all(48),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextFormField(
                      controller: _nameController,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      decoration: InputDecoration(labelText: l10n.nameLabel),
                      validator: (value) {
                        if (value != null && !model.validateName(value)) {
                          return 'Alphanumeric and hyphen characters allowed';
                        }
                        return null;
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 48),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    OsLogo.asset(name: model.os, size: 192),
                    const SizedBox(height: 8),
                    Text(
                      model.os,
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      actions: [
        OutlinedButton(
          onPressed: Wizard.of(context).done,
          child: Text(l10n.cancelButton),
        ),
        ElevatedButton(
          onPressed: () => Wizard.of(context).next(arguments: model.save()),
          child: Text(l10n.launchButton),
        ),
      ],
    );
  }
}
