import 'dart:convert';

import 'package:lxd/lxd.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import 'lxd_http.dart';

void main() {
  test('get instances', () async {
    final http = mockHttpClient();
    final uri = unixDomainUrl('/1.0/instances', {'project': 'baz'});
    final request = mockResponse(
        ['/1.0/instances/foo?project=baz', '/1.0/instances/bar?project=baz']);
    when(http.openUrl('GET', uri)).thenAnswer((_) async => request);

    final client = LxdClient(client: http);
    final instances = await client.getInstances(project: 'baz');
    verify(http.openUrl('GET', uri)).called(1);
    verify(request.close()).called(1);

    expect(
      instances,
      equals([
        LxdInstanceId('foo', project: 'baz'),
        LxdInstanceId('bar', project: 'baz')
      ]),
    );
  });

  test('get instance', () async {
    const response = {
      'architecture': 'x86_64',
      'config': {'security.nesting': 'true'},
      'created_at': '2021-03-23T20:00:00-04:00',
      'description': 'My test instance',
      'devices': {},
      'ephemeral': false,
      'last_used_at': '2021-03-23T20:00:00-04:00',
      'location': 'lxd01',
      'name': 'foo',
      'project': 'default',
      'profiles': ['default'],
      'stateful': false,
      'status': 'Running',
      'status_code': 0,
      'type': 'container'
    };

    final http = mockHttpClient();
    final uri = unixDomainUrl('/1.0/instances/foo', {'project': 'baz'});
    final request = mockResponse(response);
    when(http.openUrl('GET', uri)).thenAnswer((_) async => request);

    final client = LxdClient(client: http);
    final instance =
        await client.getInstance(LxdInstanceId('foo', project: 'baz'));
    verify(http.openUrl('GET', uri)).called(1);
    verify(request.close()).called(1);

    expect(instance.architecture, equals('x86_64'));
    expect(instance.config, equals({'security.nesting': 'true'}));
    expect(instance.createdAt,
        equals(DateTime.parse('2021-03-23T20:00:00-04:00')));
    expect(instance.description, equals('My test instance'));
    expect(instance.ephemeral, isFalse);
    expect(instance.lastUsedAt,
        equals(DateTime.parse('2021-03-23T20:00:00-04:00')));
    expect(instance.location, equals('lxd01'));
    expect(instance.name, equals('foo'));
    expect(instance.profiles, equals(['default']));
    expect(instance.stateful, isFalse);
    expect(instance.status, equals('Running'));
    expect(instance.statusCode, equals(0));
    expect(instance.type, LxdInstanceType.container);
  });

  test('create instance', () async {
    final image = LxdImage(
      architecture: 'amd64',
      fingerprint:
          '06b86454720d36b20f94e31c6812e05ec51c1b568cf3a8abd273769d213394bb',
      size: 272237676,
      type: LxdImageType.container,
      filename: '',
      createdAt: DateTime.parse('2021-03-23T20:00:00-04:00'),
      expiresAt: DateTime.parse('2021-03-23T20:00:00-04:00'),
      uploadedAt: DateTime.parse('2021-03-23T20:00:00-04:00'),
    );

    final body = {
      'description': 'Test Image',
      'source': {
        ...image.toJson(),
        'type': 'image',
        'protocol': 'simplestreams',
        'server': 'https://example.com',
      },
      'type': 'container',
    };

    final http = mockHttpClient();
    final uri = unixDomainUrl('/1.0/instances', {'project': 'baz'});
    final request = mockOperation(id: 'ID');
    when(http.openUrl('POST', uri)).thenAnswer((_) async => request);

    final client = LxdClient(client: http);
    var operation = await client.createInstance(
      project: 'baz',
      description: 'Test Image',
      source: image,
      server: 'https://example.com',
    );

    verify(http.openUrl('POST', uri)).called(1);
    verify(request.write(jsonEncode(body)));
    verify(request.close()).called(1);

    expect(operation.id, equals('ID'));
  });

  test('start instance', () async {
    final http = mockHttpClient();
    final uri = unixDomainUrl('/1.0/instances/foo/state', {'project': 'baz'});
    final request = mockOperation(id: 'ID');
    when(http.openUrl('PUT', uri)).thenAnswer((_) async => request);

    final client = LxdClient(client: http);
    final operation =
        await client.startInstance(LxdInstanceId('foo', project: 'baz'));
    verify(http.openUrl('PUT', uri)).called(1);
    verify(request.write(jsonEncode({'action': 'start', 'force': false})));
    verify(request.close()).called(1);

    expect(operation.id, equals('ID'));
  });

  test('stop instance', () async {
    final http = mockHttpClient();
    final uri = unixDomainUrl('/1.0/instances/foo/state', {'project': 'baz'});
    final request = mockOperation(id: 'ID');
    when(http.openUrl('PUT', uri)).thenAnswer((_) async => request);

    final client = LxdClient(client: http);
    final operation =
        await client.stopInstance(LxdInstanceId('foo', project: 'baz'));
    verify(http.openUrl('PUT', uri)).called(1);
    verify(request.write(jsonEncode({'action': 'stop', 'force': false})));
    verify(request.close()).called(1);

    expect(operation.id, equals('ID'));
  });

  test('restart instance', () async {
    final http = mockHttpClient();
    final uri = unixDomainUrl('/1.0/instances/foo/state', {'project': 'baz'});
    final request = mockOperation(id: 'ID');
    when(http.openUrl('PUT', uri)).thenAnswer((_) async => request);

    final client = LxdClient(client: http);
    final operation =
        await client.restartInstance(LxdInstanceId('foo', project: 'baz'));
    verify(http.openUrl('PUT', uri)).called(1);
    verify(request.write(jsonEncode({'action': 'restart', 'force': false})));
    verify(request.close()).called(1);

    expect(operation.id, equals('ID'));
  });

  test('delete instance', () async {
    final http = mockHttpClient();
    final uri = unixDomainUrl('/1.0/instances/foo', {'project': 'baz'});
    final request = mockOperation(id: 'ID');
    when(http.openUrl('DELETE', uri)).thenAnswer((_) async => request);

    final client = LxdClient(client: http);
    final operation =
        await client.deleteInstance(LxdInstanceId('foo', project: 'baz'));
    verify(http.openUrl('DELETE', uri)).called(1);
    verify(request.close()).called(1);

    expect(operation.id, equals('ID'));
  });
}
