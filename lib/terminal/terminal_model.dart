import 'package:lxd/lxd.dart';
import 'package:lxd_service/lxd_service.dart';
import 'package:lxd_x/lxd_x.dart';
import 'package:safe_change_notifier/safe_change_notifier.dart';
import 'package:terminal_view/terminal_view.dart';

import 'terminal_instance.dart';
import 'terminal_state.dart';

const kTimeout = Duration(seconds: 10);

class TerminalModel extends SafeChangeNotifier {
  TerminalModel(this._service);

  final LxdService _service;
  var _state = const TerminalState.none();

  TerminalState get state => _state;

  void _setState(TerminalState state) {
    if (_state == state) return;
    _state = state;
    notifyListeners();
  }

  Future<LxdInstance?> create(LxdImage image, {LxdRemote? remote}) async {
    final create = await _service.createInstance(image, remote: remote);
    final name = create.instances!.single;
    _setState(TerminalState.create(name, create));

    final wait = await _service.waitOperation(create.id);
    if (wait.statusCode == LxdStatusCode.cancelled) {
      reset();
      return null;
    }
    return _service.getInstance(name);
  }

  Future<bool> configure(LxdInstance instance, LxdImage image) async {
    if (!await start(instance)) {
      return false;
    }

    final features = image.properties['user.features']
            ?.split(',')
            .map((name) => LxdFeature.values.byName(name)) ??
        {};

    for (final feature in features) {
      final provider = LxdFeature.get(feature);
      _setState(TerminalState.init(instance, feature));

      final init = await _service.initFeature(instance.name, provider, image);
      if (init != null) {
        final wait = await _service.waitOperation(init.id);
        if (wait.statusCode == LxdStatusCode.cancelled) {
          reset();
          return false;
        }
      }
    }

    final context = await _service.configureImage(instance.name, image);
    for (final feature in features) {
      final provider = LxdFeature.get(feature);
      _setState(TerminalState.config(instance, feature));
      await _service.configureFeature(instance.name, provider, context);
    }

    if (!await stop(instance)) {
      return false;
    }

    final providers = features.map(LxdFeature.get).toList();
    final stage =
        await _service.stageFeatures(instance.name, providers, context);
    _setState(TerminalState.stage(instance, stage));
    await _service.waitOperation(stage.id);

    return true;
  }

  Future<bool> restart(LxdInstance instance) async {
    final restart =
        await _service.restartInstance(instance.name, timeout: kTimeout);
    _setState(TerminalState.restart(instance, restart));

    final wait = await _service.waitOperation(restart.id);
    if (wait.statusCode == LxdStatusCode.cancelled) {
      reset();
      return false;
    } else if (wait.statusCode != LxdStatusCode.success) {
      final force = await _service.restartInstance(instance.name, force: true);
      await _service.waitOperation(force.id);
    }

    await _service.waitVmAgent(instance.name);

    return true;
  }

  Future<bool> start(LxdInstance instance) async {
    final start = await _service.startInstance(instance.name);
    _setState(TerminalState.start(instance, start));

    final wait = await _service.waitOperation(start.id);
    if (wait.statusCode == LxdStatusCode.cancelled) {
      reset();
      return false;
    }

    await _service.waitVmAgent(instance.name);

    return true;
  }

  Future<void> run(LxdInstance instance) async {
    // TODO: configurable max lines
    final terminal = TerminalInstance(
      client: _service.getClient(),
      controller: TerminalController(),
      maxLines: 10000,
    );
    _setState(TerminalState.running(instance, terminal));
    return terminal.execute(instance).then((_) => reset());
  }

  Future<bool> stop(LxdInstance instance) async {
    final stop = await _service.stopInstance(instance.name, timeout: kTimeout);
    _setState(TerminalState.stop(instance, stop));

    final wait = await _service.waitOperation(stop.id);
    if (wait.statusCode == LxdStatusCode.cancelled) {
      reset();
      return false;
    } else if (wait.statusCode != LxdStatusCode.success) {
      final force = await _service.stopInstance(instance.name, force: true);
      await _service.waitOperation(force.id);
    }
    return true;
  }

  void reset() => _setState(const TerminalState.none());
}
