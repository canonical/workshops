import 'package:lxd/lxd.dart';
import 'package:lxd_x/lxd_x.dart';
import 'package:petname/petname.dart' as petname;
import 'package:safe_change_notifier/safe_change_notifier.dart';

/// The regular expression pattern for valid image names:
/// - must start and end with a letter or digit
/// - may contain letters, digits, and hyphens
final _validName = RegExp(r'^[a-zA-Z0-9]([a-zA-Z0-9-]*[a-zA-Z0-9])*$');

class LauncherModel extends SafeChangeNotifier {
  void load(LxdImage image) {
    _image = image;
    _name = _image.name ?? generateName();
  }

  String get os => _image.os ?? '';
  String get release => _image.release ?? '';

  late final LxdImage _image;
  String _name = '';

  String get name => _name;
  set name(String name) {
    if (_name == name) return;
    _name = name;
    notifyListeners();
  }

  LxdImage? get image {
    return _image.copyWith(
      properties: {
        ..._image.properties,
        'name': _name,
      },
    );
  }

  static String generateName() => petname.generate(2, separator: '-');

  bool validateName(String name) => name.isEmpty || _validName.hasMatch(name);
}
