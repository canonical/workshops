import 'package:lxd/lxd.dart';

mixin LxdProjectService on LxdClient {
  Future<void> updateProjectConfig(
      String name, Map<String, String> config) async {
    final project = await getProject(name);
    return updateProject(project.copyWith(config: config));
  }
}
