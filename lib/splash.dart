import 'package:async_value/async_value.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:lxd/lxd.dart';
import 'package:lxd_service/lxd_service.dart';
import 'package:provider/provider.dart';
import 'package:title_bar/title_bar.dart';
import 'package:ubuntu_service/ubuntu_service.dart';
import 'package:yaru_widgets/yaru_widgets.dart';

import 'app.dart';

class Splash extends StatelessWidget {
  const Splash({super.key});

  static Widget create(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => _SplashModel(getService<LxdService>())..init(),
      child: const Splash(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final model = context.watch<_SplashModel>();
    return model.state.when(
      data: (_) => const Workshops(),
      loading: () => const Scaffold(
        appBar: _SplashTitleBar(),
        body: Center(child: YaruCircularProgressIndicator()),
      ),
      error: (e, s) => Scaffold(
        appBar: const _SplashTitleBar(),
        body: ErrorWidget(e),
        persistentFooterButtons: [
          TextButton(
            onPressed: model.init,
            child: Text(l10n.retryButton),
          ),
        ],
      ),
    );
  }
}

class _SplashTitleBar extends StatelessWidget implements PreferredSizeWidget {
  const _SplashTitleBar();

  @override
  Size get preferredSize => const Size.fromHeight(kYaruTitleBarHeight);

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return WindowTitleBar(
      centerTitle: true,
      title: Center(
        child: Text(
          l10n.appTitle,
          style: const TextStyle(fontSize: 14),
        ),
      ),
    );
  }
}

typedef ServerState = AsyncValue<LxdServer>;

class _SplashModel extends ChangeNotifier {
  _SplashModel(this._service);

  final LxdService _service;

  var _state = const ServerState.loading();
  ServerState get state => _state;

  void _setState(ServerState state) {
    if (_state == state) return;
    _state = state;
    notifyListeners();
  }

  Future<void> init() async {
    _setState(const ServerState.loading());
    _setState(await ServerState.guard(() async {
      await _service.init();
      return _service.getServerInfo();
    }));
  }
}
