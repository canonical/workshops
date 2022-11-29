import 'package:lxd/lxd.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import 'lxd_http.dart';

void main() {
  test('get storage pools', () async {
    final http = mockHttpClient();
    final uri = unixDomainUrl('/1.0/storage-pools', {'project': 'baz'});
    final request =
        mockResponse(['/1.0/storage-pools/foo', '/1.0/storage-pools/bar']);
    when(http.openUrl('GET', uri)).thenAnswer((_) async => request);

    final client = LxdClient(client: http);
    final pools = await client.getStoragePools(project: 'baz');
    verify(http.openUrl('GET', uri)).called(1);
    verify(request.close()).called(1);

    expect(pools, equals(['foo', 'bar']));
  });

  test('get storage pool', () async {
    const response = {
      'config': {'volume.block.filesystem': 'ext4', 'volume.size': '50GiB'},
      'description': 'Local SSD pool',
      'name': 'local',
      'status': 'Created',
    };

    final http = mockHttpClient();
    final uri = unixDomainUrl('/1.0/storage-pools/local', {'project': 'baz'});
    final request = mockResponse(response);
    when(http.openUrl('GET', uri)).thenAnswer((_) async => request);

    final client = LxdClient(client: http);
    final pool = await client.getStoragePool('local', project: 'baz');
    verify(http.openUrl('GET', uri)).called(1);
    verify(request.close()).called(1);

    expect(pool.config,
        equals({'volume.block.filesystem': 'ext4', 'volume.size': '50GiB'}));
    expect(pool.description, equals('Local SSD pool'));
    expect(pool.name, equals('local'));
    expect(pool.status, equals('Created'));
  });
}
