import 'package:lxd/lxd.dart';
import 'package:lxd_service/lxd_service.dart';
import 'package:lxd_x/lxd_x.dart';
import 'package:petname/petname.dart' as petname;
import 'package:safe_change_notifier/safe_change_notifier.dart';

/// The regular expression pattern for valid image names:
/// - must start and end with a letter or digit
/// - may contain letters, digits, and hyphens
final _validName = RegExp(r'^[a-zA-Z0-9]([a-zA-Z0-9-]*[a-zA-Z0-9])*$');

class PropertyModel extends SafeChangeNotifier {
  PropertyModel(this._service, this._image)
      : _name = _image.name ?? generateName();

  final LxdService _service;

  String get os => _image.os ?? '';
  String get release => _image.release ?? '';

  late final LxdImage _image;
  String _name = '';
  String _project = 'default';

  var _allProjects = <String>[];
  List<String> get allProjects => _allProjects;

  Future<void> init() async {
    _allProjects = await _service.getProjects();
    notifyListeners();
  }

  String get name => _name;
  set name(String name) {
    if (_name == name) return;
    _name = name;
    notifyListeners();
  }

  String get project => _project;
  set project(String project) {
    if (_project == project) return;
    _project = project;
    notifyListeners();
  }

  LxdImage? save() {
    return _image.copyWith(
      properties: {
        ..._image.properties,
        'name': _name,
        'project': _project,
      },
    );
  }

  static String generateName() => petname.generate(2, separator: '-');

  bool validateName(String name) => name.isEmpty || _validName.hasMatch(name);
}
