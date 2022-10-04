import 'package:flutter/material.dart';
import 'package:lxd/lxd.dart';

import '../launcher/launcher_wizard.dart';
import 'instance_view.dart';

class InstancePage extends StatelessWidget {
  const InstancePage({
    super.key,
    required this.onStart,
    required this.onCreate,
  });

  final ValueChanged<LxdInstance> onStart;
  final ValueChanged<LxdInstance> onCreate;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: InstanceView(
        onStart: onStart,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final instance = await showLauncherWizard(context);
          if (instance != null) {
            onCreate(instance);
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
