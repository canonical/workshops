import 'package:lxd/lxd.dart';
import 'package:lxd_service/lxd_service.dart';
import 'package:lxd_x/lxd_x.dart';
import 'package:safe_change_notifier/safe_change_notifier.dart';
import 'package:terminal_view/terminal_view.dart';

import '../terminal/terminal_state.dart';

const kTimeout = Duration(seconds: 10);

class TerminalController extends SafeChangeNotifier {
  TerminalController(this._service);

  final LxdService _service;
  var _state = const TerminalState.none();

  TerminalState get state => _state;

  void _setState(TerminalState state) {
    if (_state == state) return;
    _state = state;
    notifyListeners();
  }

  Future<String?> create(LxdImage image, {LxdRemote? remote}) async {
    final create = await _service.createInstance(image, remote: remote);
    final name = create.instances!.single;
    _setState(TerminalState.create(name, create));

    final wait = await _service.waitOperation(create.id);
    if (wait.statusCode == LxdStatusCode.cancelled.value) {
      reset();
      return null;
    }
    return name;
  }

  Future<bool> configure(String name, LxdImage image) async {
    if (!await start(name)) {
      return false;
    }

    final features = image.properties['user.features']
            ?.split(',')
            .map((name) => LxdFeature.values.byName(name)) ??
        {};

    for (final feature in features) {
      final provider = LxdFeature.get(feature);
      _setState(TerminalState.init(name, feature));

      final init = await _service.initFeature(name, provider, image);
      if (init != null) {
        final wait = await _service.waitOperation(init.id);
        if (wait.statusCode == LxdStatusCode.cancelled.value) {
          reset();
          return false;
        }
        if (!await restart(name)) {
          return false;
        }
      }
    }

    final context = await _service.configureImage(name, image);
    for (final feature in features) {
      final provider = LxdFeature.get(feature);
      _setState(TerminalState.config(name, feature));
      await _service.configureFeature(name, provider, context);
    }

    if (!await stop(name)) {
      return false;
    }

    final providers = features.map(LxdFeature.get).toList();
    final stage = await _service.stageFeatures(name, providers, context);
    _setState(TerminalState.stage(name, stage));
    await _service.waitOperation(stage.id);

    return true;
  }

  Future<bool> restart(String name) async {
    final restart = await _service.restartInstance(name, timeout: kTimeout);
    _setState(TerminalState.restart(name, restart));

    final wait = await _service.waitOperation(restart.id);
    if (wait.statusCode == LxdStatusCode.cancelled.value) {
      reset();
      return false;
    } else if (wait.statusCode != LxdStatusCode.success.value) {
      final force = await _service.restartInstance(name, force: true);
      await _service.waitOperation(force.id);
    }
    return true;
  }

  Future<bool> start(String name) async {
    final start = await _service.startInstance(name);
    _setState(TerminalState.start(name, start));

    final wait = await _service.waitOperation(start.id);
    if (wait.statusCode == LxdStatusCode.cancelled.value) {
      reset();
      return false;
    }
    return true;
  }

  Future<void> run(String name) async {
    final instance = await _service.getInstance(name);
    _setState(
      TerminalState.running(
        name,
        Terminal(
          client: _service.getClient(),
          instance: instance,
          onExit: reset,
        ),
      ),
    );
  }

  Future<bool> stop(String name) async {
    final stop = await _service.stopInstance(name, timeout: kTimeout);
    _setState(TerminalState.stop(name, stop));

    final wait = await _service.waitOperation(stop.id);
    if (wait.statusCode == LxdStatusCode.cancelled.value) {
      reset();
      return false;
    } else if (wait.statusCode != LxdStatusCode.success.value) {
      final force = await _service.stopInstance(name, force: true);
      await _service.waitOperation(force.id);
    }
    return true;
  }

  void reset() => _setState(const TerminalState.none());
}
