import 'package:flutter/material.dart';
import 'package:lxd/lxd.dart';
import 'package:provider/provider.dart';
import 'package:ubuntu_widgets/ubuntu_widgets.dart';
import 'package:wizard_router/wizard_router.dart';

import '../widgets/product_logo.dart';
import '../widgets/wizard_page.dart';
import 'launcher_model.dart';

class LauncherPage extends StatefulWidget {
  const LauncherPage({super.key});

  static Widget create(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => LauncherModel(),
      child: const LauncherPage(),
    );
  }

  @override
  State<LauncherPage> createState() => _LauncherPageState();
}

class _LauncherPageState extends State<LauncherPage> {
  late final TextEditingController _nameController;

  @override
  void initState() {
    super.initState();

    final model = context.read<LauncherModel>();
    model.init(Wizard.of(context).arguments as LxdImage);

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
    final model = context.watch<LauncherModel>();
    return WizardPage(
      title: const Text('Launch instance'),
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
                      decoration: const InputDecoration(labelText: 'Name'),
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
                    ProductLogo.asset(name: model.os, size: 192),
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
          child: const Text('Cancel'),
        ),
        OutlinedButton(
          onPressed: () => Wizard.of(context).done(result: model.image),
          child: const Text('Ok'),
        ),
      ],
    );
  }
}
