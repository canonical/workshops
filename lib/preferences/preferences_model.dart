import 'package:safe_change_notifier/safe_change_notifier.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PreferencesModel extends SafeChangeNotifier {
  PreferencesModel(this._preferences);

  final SharedPreferences _preferences; // ignore: unused_field

  Future<void> init() async {}
}
