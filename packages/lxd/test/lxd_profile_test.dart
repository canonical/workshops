import 'package:lxd/lxd.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import 'lxd_http.dart';

void main() {
  test('get profiles', () async {
    final http = mockHttpClient();
    final uri = unixDomainUrl('/1.0/profiles', {'project': 'baz'});
    final request = mockResponse(['/1.0/profiles/foo', '/1.0/profiles/bar']);
    when(http.openUrl('GET', uri)).thenAnswer((_) async => request);

    final client = LxdClient(client: http);
    final profiles = await client.getProfiles(project: 'baz');
    verify(http.openUrl('GET', uri)).called(1);
    verify(request.close()).called(1);

    expect(profiles, equals(['foo', 'bar']));
  });

  test('get profile', () async {
    const response = {
      'config': {'limits.cpu': '4', 'limits.memory': '4GiB'},
      'description': 'Medium size instances',
      'name': 'foo',
    };

    final http = mockHttpClient();
    final uri = unixDomainUrl('/1.0/profiles/foo', {'project': 'baz'});
    final request = mockResponse(response);
    when(http.openUrl('GET', uri)).thenAnswer((_) async => request);

    final client = LxdClient(client: http);
    final profile = await client.getProfile('foo', project: 'baz');
    verify(http.openUrl('GET', uri)).called(1);
    verify(request.close()).called(1);

    expect(
        profile.config, equals({'limits.cpu': '4', 'limits.memory': '4GiB'}));
    expect(profile.description, equals('Medium size instances'));
    expect(profile.name, equals('foo'));
  });
}
