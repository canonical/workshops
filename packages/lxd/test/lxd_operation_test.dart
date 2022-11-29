import 'package:lxd/lxd.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import 'lxd_http.dart';

void main() {
  test('get operations', () async {
    const response = {
      'running': ['/1.0/operations/foo', '/1.0/operations/bar'],
    };

    final http = mockHttpClient();
    final uri = unixDomainUrl('/1.0/operations', {});
    final request = mockResponse(response);
    when(http.openUrl('GET', uri)).thenAnswer((_) async => request);

    final client = LxdClient(client: http);
    final operations = await client.getOperations();
    verify(http.openUrl('GET', uri)).called(1);
    verify(request.close()).called(1);

    expect(
      operations,
      equals({
        'running': ['foo', 'bar']
      }),
    );
  });

  test('cancel operation', () async {
    final http = mockHttpClient();
    final uri = unixDomainUrl('/1.0/operations/foo', {});
    final request = mockResponse(null);
    when(http.openUrl('DELETE', uri)).thenAnswer((_) async => request);

    final client = LxdClient(client: http);
    await client.cancelOperation('foo');

    verify(http.openUrl('DELETE', uri)).called(1);
    verify(request.close()).called(1);
  });

  test('null resources', () async {
    const json = {
      'id': '4f0d166b-3136-4bb2-99db-c7754fdbba3d',
      'class': 'task',
      'description': 'Updating images',
      'created_at': '2022-06-06T09:22:36.212346295+02:00',
      'updated_at': '2022-06-06T09:22:36.212346295+02:00',
      'status': 'Success',
      'status_code': 200,
      'resources': null,
      'metadata': null,
      'may_cancel': false,
      'err': '',
      'location': 'none',
    };

    final operation = LxdOperation.fromJson(json);
    expect(operation.id, '4f0d166b-3136-4bb2-99db-c7754fdbba3d');
    expect(operation.type, LxdOperationType.task);
    expect(operation.description, 'Updating images');
    expect(operation.createdAt,
        DateTime.parse('2022-06-06T09:22:36.212346295+02:00'));
    expect(operation.updatedAt,
        DateTime.parse('2022-06-06T09:22:36.212346295+02:00'));
    expect(operation.status, 'Success');
    expect(operation.statusCode, 200);
    expect(operation.resources, null);
    expect(operation.metadata, null);
    expect(operation.mayCancel, false);
    expect(operation.error, '');
    expect(operation.location, 'none');
  });
}
