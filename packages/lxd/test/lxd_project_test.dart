import 'package:lxd/lxd.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import 'lxd_http.dart';

void main() {
  test('get projects', () async {
    final http = mockHttpClient();
    final uri = unixDomainUrl('/1.0/projects', {});
    final request = mockResponse(['/1.0/projects/foo', '/1.0/projects/bar']);
    when(http.openUrl('GET', uri)).thenAnswer((_) async => request);

    final client = LxdClient(client: http);
    final projects = await client.getProjects();
    verify(http.openUrl('GET', uri)).called(1);
    verify(request.close()).called(1);

    expect(projects, equals(['foo', 'bar']));
  });

  test('get project', () async {
    const response = {
      'config': {'features.networks': 'false', 'features.profiles': 'true'},
      'description': 'My new project',
      'name': 'foo',
      'used_by': ['/1.0/instances/bar'],
    };

    final http = mockHttpClient();
    final uri = unixDomainUrl('/1.0/projects/foo', {});
    final request = mockResponse(response);
    when(http.openUrl('GET', uri)).thenAnswer((_) async => request);

    final client = LxdClient(client: http);
    final project = await client.getProject('foo');
    verify(http.openUrl('GET', uri)).called(1);
    verify(request.close()).called(1);

    expect(project.config,
        equals({'features.networks': 'false', 'features.profiles': 'true'}));
    expect(project.description, equals('My new project'));
    expect(project.name, equals('foo'));
    expect(project.usedBy, equals(['/1.0/instances/bar']));
  });
}
