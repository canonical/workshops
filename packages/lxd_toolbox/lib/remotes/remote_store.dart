import 'package:async_value/async_value.dart';
import 'package:collection/collection.dart';
import 'package:meta/meta.dart';
import 'package:safe_change_notifier/safe_change_notifier.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'remote.dart';

const _kDefaultRemote = 'images';

const _kDefaultRemotes = [
  Remote(
    name: 'local',
    address: 'unix://',
    isStatic: true,
    isPublic: false,
  ),
  // community image server (over simplestreams)
  Remote(
    name: 'images',
    address: 'https://images.linuxcontainers.org',
    isPublic: true,
    protocol: 'simplestreams',
  ),
  // Ubuntu image server (over simplestreams)
  Remote(
    name: 'ubuntu',
    address: 'https://cloud-images.ubuntu.com/releases',
    isPublic: true,
    isStatic: true,
    protocol: 'simplestreams',
  ),
  // Ubuntu daily image server (over simplestreams)
  Remote(
    name: 'daily',
    address: 'https://cloud-images.ubuntu.com/daily',
    isPublic: true,
    isStatic: true,
    protocol: 'simplestreams',
  ),
];

typedef AsyncRemoteList = AsyncValue<List<Remote>>;

class RemoteStore extends SafeChangeNotifier {
  RemoteStore(this._preferences);

  final SharedPreferences _preferences;

  Remote? _current;
  AsyncRemoteList _remotes = const AsyncRemoteList.loading();

  AsyncRemoteList get remotes => _remotes;

  @protected
  set remotes(AsyncRemoteList remotes) {
    if (_remotes == remotes) return;
    _remotes = remotes;
    notifyListeners();
  }

  Remote? get current => _current;
  void setCurrent(Remote? current) {
    if (_current == current) return;
    _current = current;
    if (current != null) {
      _preferences.setString('remote', current.name);
    } else {
      _preferences.remove('remote');
    }
    notifyListeners();
  }

  Future<void> init() async {
    remotes = const AsyncRemoteList.loading().copyWithPrevious(remotes);
    remotes = await AsyncRemoteList.guard(() async {
      final remotes =
          _preferences.get('remotes') as List<Remote>? ?? _kDefaultRemotes;
      final current = _preferences.get('remote') as String? ?? _kDefaultRemote;
      _current = remotes.firstWhereOrNull((remote) => remote.name == current);
      return remotes;
    });
  }
}
