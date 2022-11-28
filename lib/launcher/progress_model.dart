import 'package:lxd/lxd.dart';
import 'package:lxd_service/lxd_service.dart';
import 'package:lxd_x/lxd_x.dart';
import 'package:safe_change_notifier/safe_change_notifier.dart';

import 'progress_state.dart';

const kTimeout = Duration(seconds: 15);

class ProgressModel extends SafeChangeNotifier {
  ProgressModel(this._service);

  final LxdService _service;
  var _state = const ProgressState.none();

  ProgressState get state => _state;

  void _setState(ProgressState state) {
    if (_state == state) return;
    _state = state;
    notifyListeners();
  }

  @override
  Future<void> dispose() async {
    final op = state.operation;
    if (op?.mayCancel == true) {
      await _service.cancelOperation(op!.id);
    }
    super.dispose();
  }

  Future<bool?> create(LxdImage image, {LxdRemote? remote}) async {
    final create = await _service.createInstance(image, remote: remote);
    final id = create.instances!.single;
    _setState(ProgressState.create(id.name, create));

    final wait = await _service.waitOperation(create.id);
    if (isDisposed || wait.statusCode == LxdStatusCode.cancelled) {
      try {
        await _service.deleteInstance(id);
      } on LxdException catch (_) {}
      return null;
    }

    final instance = await _service.getInstance(id);
    return configure(instance, image);
  }

  Future<bool?> configure(LxdInstance instance, LxdImage image) async {
    final started = await start(instance);
    if (started != true) {
      return started;
    }

    final features = image.properties['user.features']
            ?.split(',')
            .map((name) => LxdFeature.values.byName(name)) ??
        {};

    for (final feature in features) {
      final provider = LxdFeature.get(feature);
      _setState(ProgressState.init(instance, feature));

      final init = await _service.initFeature(instance.name, provider, image);
      if (init != null) {
        final wait = await _service.waitOperation(init.id);
        if (isDisposed || wait.statusCode == LxdStatusCode.cancelled) {
          return cancel(instance);
        }
      }
    }

    final context = await _service.configureImage(instance.name, image);
    for (final feature in features) {
      final provider = LxdFeature.get(feature);
      _setState(ProgressState.config(instance, feature));
      await _service.configureFeature(instance.name, provider, context);
      if (isDisposed) {
        return cancel(instance);
      }
    }

    final stopped = await stop(instance);
    if (stopped != true) {
      return stopped;
    }

    final providers = features.map(LxdFeature.get).toList();
    final stage =
        await _service.stageFeatures(instance.name, providers, context);
    _setState(ProgressState.stage(instance, stage));
    final wait = await _service.waitOperation(stage.id);
    if (isDisposed || wait.statusCode == LxdStatusCode.cancelled) {
      return cancel(instance);
    }

    return start(instance);
  }

  Future<bool?> start(LxdInstance instance) async {
    final start = await _service.startInstance(instance.id);
    _setState(ProgressState.start(instance, start));

    final wait = await _service.waitOperation(start.id);
    if (isDisposed || wait.statusCode == LxdStatusCode.cancelled) {
      return cancel(instance);
    }

    await _service.waitVmAgent(instance.name);
    if (isDisposed) {
      return cancel(instance);
    }

    return true;
  }

  Future<bool?> stop(LxdInstance instance) async {
    final stop = await _service.stopInstance(instance.id, timeout: kTimeout);
    _setState(ProgressState.stop(instance, stop));

    final wait = await _service.waitOperation(stop.id);
    if (isDisposed || wait.statusCode == LxdStatusCode.cancelled) {
      return delete(instance);
    } else if (wait.statusCode != LxdStatusCode.success) {
      final force = await _service.stopInstance(instance.id, force: true);
      await _service.waitOperation(force.id);
    }
    return true;
  }

  Future<bool?> cancel(LxdInstance instance) async {
    try {
      final stop = await _service.stopInstance(instance.id, force: true);
      await _service.waitOperation(stop.id);
    } on LxdException catch (_) {}

    return delete(instance);
  }

  Future<bool?> delete(LxdInstance instance) async {
    try {
      final delete = await _service.deleteInstance(instance.id);
      _setState(ProgressState.delete(instance, delete));
      await _service.waitOperation(delete.id);
    } on LxdException catch (_) {}
    return null;
  }
}
