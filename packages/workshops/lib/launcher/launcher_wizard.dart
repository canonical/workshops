import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lxd/lxd.dart';
import 'package:lxd_service/lxd_service.dart';
import 'package:provider/provider.dart';
import 'package:wizard_router/wizard_router.dart';

import '../remotes/remote_store.dart';
import '../widgets/wizard_transition.dart';
import 'feature_page.dart';
import 'launcher_page.dart';
import 'local_image_page.dart';
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

Future<LaunchOptions?> showLauncherWizard(BuildContext context) {
  return showDialog(
    context: context,
    builder: (context) => const LauncherWizard(),
  );
}

class LauncherWizard extends StatelessWidget {
  const LauncherWizard({super.key});

  void _onDone(BuildContext context, [Object? result]) {
    if (result is! LxdImage) {
      Navigator.of(context).pop(null);
      return;
    }

    final remote = context.read<RemoteStore>().current!;
    final options = LaunchOptions(
      image: result,
      remote: remote,
    );
    Navigator.of(context).pop(options);
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
            pageTransitionsTheme: const PageTransitionsTheme(
              builders: {
                TargetPlatform.linux: WizardPageTransitionsBuilder(),
              },
            ),
          ),
          child: Stack(
            children: [
              remote?.isLocal == true
                  ? LocalImageWizard(onDone: (res) => _onDone(context, res))
                  : RemoteImageWizard(onDone: (res) => _onDone(context, res)),
              Positioned.directional(
                top: 12,
                end: 12,
                textDirection: Directionality.of(context),
                child: IconButton(
                  splashRadius: 16,
                  padding: EdgeInsets.zero,
                  icon: const Icon(Icons.close),
                  onPressed: () => _onDone(context),
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
  const RemoteImageWizard({super.key, required this.onDone});

  final ValueChanged<Object?> onDone;

  @override
  Widget build(BuildContext context) {
    return Wizard(
      routes: {
        '/os': WizardRoute(
          builder: (_) => const RemoteOsPage(),
          onDone: onDone,
        ),
        '/image': WizardRoute(
          builder: RemoteImagePage.create,
          onDone: onDone,
        ),
        '/features': WizardRoute(
          builder: FeaturePage.create,
          onDone: onDone,
        ),
        '/launch': WizardRoute(
          builder: LauncherPage.create,
          onDone: onDone,
        ),
      },
    );
  }
}

class LocalImageWizard extends StatelessWidget {
  const LocalImageWizard({super.key, required this.onDone});

  final ValueChanged<Object?> onDone;

  @override
  Widget build(BuildContext context) {
    return Wizard(
      routes: {
        '/image': WizardRoute(
          builder: LocalImagePage.create,
          onDone: onDone,
        ),
        '/features': WizardRoute(
          builder: FeaturePage.create,
          onDone: onDone,
        ),
        '/launch': WizardRoute(
          builder: LauncherPage.create,
          onDone: onDone,
        ),
      },
    );
  }
}
