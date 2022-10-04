import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lxd/lxd.dart';
import 'package:lxd_service/lxd_service.dart';
import 'package:provider/provider.dart';
import 'package:wizard_router/wizard_router.dart';
import 'package:yaru/yaru.dart';

import '../remotes/remote_store.dart';
import 'feature_page.dart';
import 'launcher_model.dart';
import 'local_image_page.dart';
import 'progress_page.dart';
import 'property_page.dart';
import 'remote_image_page.dart';
import 'remote_os_page.dart';

class LaunchOptions {
  const LaunchOptions({
    required this.image,
    required this.remote,
  });
  final LxdImage image;
  final LxdRemote remote;
}

Future<LxdInstance?> showLauncherWizard(BuildContext context) {
  return showDialog(
    context: context,
    builder: (context) => ChangeNotifierProvider(
      create: (_) => LauncherModel(),
      child: const LauncherWizard(),
    ),
  );
}

class LauncherWizard extends StatefulWidget {
  const LauncherWizard({super.key});

  @override
  State<LauncherWizard> createState() => _LauncherWizardState();
}

class _LauncherWizardState extends State<LauncherWizard> {
  @override
  void initState() {
    super.initState();

    final launcher = context.read<LauncherModel>();
    launcher.run().then(Navigator.of(context).pop);
  }

  @override
  Widget build(BuildContext context) {
    final remote = context.select<RemoteStore, LxdRemote?>((s) => s.current);
    return Dialog(
      clipBehavior: Clip.hardEdge,
      child: SizedBox.fromSize(
        size: MediaQuery.of(context).size,
        child: Theme(
          data: Theme.of(context).copyWith(
            pageTransitionsTheme: YaruPageTransitionsTheme.horizontal,
          ),
          child: Stack(
            children: [
              remote?.isLocal == true
                  ? const LocalImageWizard()
                  : const RemoteImageWizard(),
              Positioned.directional(
                top: 12,
                end: 12,
                textDirection: Directionality.of(context),
                child: IconButton(
                  splashRadius: 16,
                  padding: EdgeInsets.zero,
                  icon: const Icon(Icons.close),
                  onPressed: context.read<LauncherModel>().cancel,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class RemoteImageWizard extends StatelessWidget {
  const RemoteImageWizard({super.key});

  @override
  Widget build(BuildContext context) {
    final launcher = context.read<LauncherModel>();
    return Wizard(
      routes: {
        '/os': WizardRoute(
          builder: (_) => const RemoteOsPage(),
          onNext: (settings) => launcher.next(settings.arguments),
          onDone: launcher.done,
        ),
        '/image': WizardRoute(
          builder: RemoteImagePage.create,
          onNext: (settings) => launcher.next(settings.arguments),
          onDone: launcher.done,
        ),
        '/features': WizardRoute(
          builder: FeaturePage.create,
          onNext: (settings) => launcher.next(settings.arguments),
          onDone: launcher.done,
        ),
        '/properties': WizardRoute(
          builder: PropertyPage.create,
          onDone: launcher.done,
        ),
        '/progress': WizardRoute(
          builder: ProgressPage.create,
          onDone: launcher.done,
        ),
      },
    );
  }
}

class LocalImageWizard extends StatelessWidget {
  const LocalImageWizard({super.key});

  @override
  Widget build(BuildContext context) {
    final launcher = context.read<LauncherModel>();
    return Wizard(
      routes: {
        '/image': WizardRoute(
          builder: LocalImagePage.create,
          onNext: (settings) => launcher.next(settings.arguments),
          onDone: launcher.done,
        ),
        '/features': WizardRoute(
          builder: FeaturePage.create,
          onNext: (settings) => launcher.next(settings.arguments),
          onDone: launcher.done,
        ),
        '/properties': WizardRoute(
          builder: PropertyPage.create,
          onDone: launcher.done,
        ),
        '/progress': WizardRoute(
          builder: ProgressPage.create,
          onDone: launcher.done,
        ),
      },
    );
  }
}
