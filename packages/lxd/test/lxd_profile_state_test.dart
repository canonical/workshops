import 'package:lxd/lxd.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import 'lxd_http.dart';

void main() {
  test('get project state', () async {
    const response = {
      'resources': {
        'containers': {'Limit': -1, 'Usage': 2},
        'cpu': {'Limit': -1, 'Usage': 0},
        'disk': {'Limit': -1, 'Usage': 0},
        'instances': {'Limit': -1, 'Usage': 2},
        'memory': {'Limit': -1, 'Usage': 0},
        'networks': {'Limit': -1, 'Usage': 1},
        'processes': {'Limit': -1, 'Usage': 0},
        'virtual-machines': {'Limit': -1, 'Usage': 0},
      }
    };

    final http = mockHttpClient();
    final uri = unixDomainUrl('/1.0/projects/foo/state', {});
    final request = mockResponse(response);
    when(http.openUrl('GET', uri)).thenAnswer((_) async => request);

    final client = LxdClient(client: http);
    final state = await client.getProjectState('foo');

    expect(state.resources, {
      'containers': LxdProjectStateResource(limit: -1, usage: 2),
      'cpu': LxdProjectStateResource(limit: -1, usage: 0),
      'disk': LxdProjectStateResource(limit: -1, usage: 0),
      'instances': LxdProjectStateResource(limit: -1, usage: 2),
      'memory': LxdProjectStateResource(limit: -1, usage: 0),
      'networks': LxdProjectStateResource(limit: -1, usage: 1),
      'processes': LxdProjectStateResource(limit: -1, usage: 0),
      'virtual-machines': LxdProjectStateResource(limit: -1, usage: 0),
    });
  });
}
