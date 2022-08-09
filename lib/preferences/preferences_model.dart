import 'package:lxc_config/lxc_config.dart';
import 'package:safe_change_notifier/safe_change_notifier.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PreferencesModel extends SafeChangeNotifier {
  PreferencesModel({
    required LxcConfig config,
    required SharedPreferences preferences,
  })  : _config = config,
        _preferences = preferences;

  final LxcConfig _config;
  final SharedPreferences _preferences; // ignore: unused_field

  String? get defaultRemote => _config.defaultRemote;
  Map<String, LxcRemote>? get remotes => _config.remotes;

  Future<void> init() async {}
}
