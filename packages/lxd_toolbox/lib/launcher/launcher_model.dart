import 'package:lxd/lxd.dart';
import 'package:petname/petname.dart' as petname;
import 'package:safe_change_notifier/safe_change_notifier.dart';

/// The regular expression pattern for valid image names:
/// - must start and end with a letter or digit
/// - may contain letters, digits, and hyphens
final _validName = RegExp(r'^[a-zA-Z0-9]([a-zA-Z0-9-]*[a-zA-Z0-9])*$');

class LauncherModel extends SafeChangeNotifier {
  LxdImage? _image;
  String _name = '';

  String get os => _image?.properties['os'] ?? '';
  String get release => _image?.properties['release'] ?? '';

  String get name => _name;
  set name(String name) {
    if (_name == name) return;
    _name = name;
    notifyListeners();
  }

  LxdImage? get image {
    return _image?.copyWith(properties: {
      'name': _name,
      ...?_image?.properties,
    });
  }

  void init(LxdImage? image) {
    _image = image;
    _name = image?.properties['name'] ?? generateName();
  }

  static String generateName() => petname.generate(2, separator: '-');

  bool validateName(String name) => name.isEmpty || _validName.hasMatch(name);
}
