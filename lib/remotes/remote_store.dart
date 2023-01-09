import 'package:async_value/async_value.dart';
import 'package:collection/collection.dart';
import 'package:lxd_service/lxd_service.dart';
import 'package:meta/meta.dart';
import 'package:safe_change_notifier/safe_change_notifier.dart';

import '../settings.dart';

typedef AsyncRemoteList = AsyncValue<List<LxdRemote>>;

class RemoteStore extends SafeChangeNotifier {
  RemoteSettings? _settings;

  LxdRemote? _current;
  AsyncRemoteList _remotes = const AsyncRemoteList.loading();

  AsyncRemoteList get remotes => _remotes;

  @protected
  set remotes(AsyncRemoteList remotes) {
    if (_remotes == remotes) return;
    _remotes = remotes;
    notifyListeners();
  }

  LxdRemote? get current => _current;
  void setCurrent(LxdRemote? current) {
    if (_current == current) return;
    _current = current;
    _settings?.setCurrent(current?.name);
    notifyListeners();
  }

  Future<void> init(RemoteSettings settings) async {
    _settings = settings;
    remotes = const AsyncRemoteList.loading().copyWithPrevious(remotes);
    remotes = await AsyncRemoteList.guard(() async {
      final remotes = _settings?.getRemotes();
      final current = _settings?.getCurrent();
      _current = remotes?.firstWhereOrNull((remote) => remote.name == current);
      return remotes ?? [];
    });
  }
}
