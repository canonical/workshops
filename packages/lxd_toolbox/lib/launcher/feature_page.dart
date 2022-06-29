import 'package:flutter/material.dart';
import 'package:lxd/lxd.dart';
import 'package:lxd_service/lxd_service.dart';
import 'package:provider/provider.dart';
import 'package:ubuntu_widgets/ubuntu_widgets.dart';
import 'package:wizard_router/wizard_router.dart';

import '../widgets/wizard_page.dart';
import 'feature_model.dart';

class FeaturePage extends StatefulWidget {
  const FeaturePage({super.key});

  static Widget create(BuildContext context) {
    final image = Wizard.of(context).arguments as LxdImage;
    return ChangeNotifierProvider(
      create: (_) => FeatureModel(image),
      child: const FeaturePage(),
    );
  }

  @override
  State<FeaturePage> createState() => _FeaturePageState();
}

class _FeaturePageState extends State<FeaturePage> {
  @override
  void initState() {
    super.initState();
    final model = context.read<FeatureModel>();
    model.load();
  }

  @override
  Widget build(BuildContext context) {
    final model = context.watch<FeatureModel>();
    return WizardPage(
      title: const Text('Select features'),
      content: RoundedContainer(
        child: ListView(
          children: [
            CheckboxListTile(
              title: const Text('User'),
              subtitle: model.user != null
                  ? Text(
                      'Create a "${model.user!}" user account in the ${model.type.localize(context)}.')
                  : null,
              controlAffinity: ListTileControlAffinity.leading,
              value: model.hasFeature(LxdFeature.user),
              onChanged: model.user != null
                  ? (value) => model.setFeature(LxdFeature.user, value!)
                  : null,
            ),
            CheckboxListTile(
              title: const Text('Home'),
              subtitle: model.home != null
                  ? Text(
                      'Mount "${model.home!}" from the host into the ${model.type.localize(context)}.')
                  : null,
              controlAffinity: ListTileControlAffinity.leading,
              value: model.hasFeature(LxdFeature.home),
              onChanged: model.home != null && model.hasFeature(LxdFeature.user)
                  ? (value) => model.setFeature(LxdFeature.home, value!)
                  : null,
            ),
            CheckboxListTile(
              title: const Text('Display'),
              subtitle: const Text(
                  'Make the host GPU available and forward display connections for running UI apps.'),
              controlAffinity: ListTileControlAffinity.leading,
              value: model.hasFeature(LxdFeature.display),
              onChanged: (value) =>
                  model.setFeature(LxdFeature.display, value!),
            ),
            CheckboxListTile(
              title: const Text('Audio'),
              subtitle: const Text(
                  'Make the host sound card available and forward audio connections for running audio apps.'),
              controlAffinity: ListTileControlAffinity.leading,
              value: model.hasFeature(LxdFeature.audio),
              onChanged: (value) => model.setFeature(LxdFeature.audio, value!),
            ),
            CheckboxListTile(
              title: const Text('LXD'),
              subtitle: Text(
                  'Make the LXD server on the host accessible from the ${model.type.localize(context)}.'),
              controlAffinity: ListTileControlAffinity.leading,
              value: model.hasFeature(LxdFeature.lxd),
              onChanged: (value) => model.setFeature(LxdFeature.lxd, value!),
            ),
          ],
        ),
      ),
      actions: [
        OutlinedButton(
          onPressed: Wizard.of(context).done,
          child: const Text('Cancel'),
        ),
        OutlinedButton(
          onPressed: () => Wizard.of(context).next(arguments: model.save()),
          child: const Text('Continue'),
        ),
      ],
    );
  }
}

extension _LxdImageTypeL10n on LxdImageType {
  String localize(BuildContext context) {
    switch (this) {
      case LxdImageType.container:
        return 'container';
      case LxdImageType.virtualMachine:
        return 'virtual machine';
    }
  }
}
