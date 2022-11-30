import 'package:lxd/lxd.dart';
import 'package:lxd_service/lxd_service.dart';
import 'package:safe_change_notifier/safe_change_notifier.dart';

class ProjectSettingsModel extends SafeChangeNotifier {
  ProjectSettingsModel(this._service);

  final LxdService _service;
  var _projects = <String>[];
  Map<String, LxdProject> _settings = {};
  Map<String, LxdProjectState> _states = {};

  List<String> get projects => _projects;
  Map<String, LxdProject> get settings => _settings;
  Map<String, LxdProjectState> get states => _states;

  Future<void> init() => refresh();

  Future<void> refresh() async {
    _projects = await _service.getProjects();
    _settings = <String, LxdProject>{
      for (final project in projects)
        project: await _service.getProject(project)
    };
    _states = <String, LxdProjectState>{
      for (final project in projects)
        project: await _service.getProjectState(project)
    };
    notifyListeners();
  }
}
