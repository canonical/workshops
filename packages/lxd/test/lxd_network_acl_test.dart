import 'package:lxd/lxd.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import 'lxd_http.dart';

void main() {
  test('get network acls', () async {
    final http = mockHttpClient();
    final uri = unixDomainUrl('/1.0/network-acls', {'project': 'baz'});
    final request =
        mockResponse(['/1.0/network-acls/foo', '/1.0/network-acls/bar']);
    when(http.openUrl('GET', uri)).thenAnswer((_) async => request);

    final client = LxdClient(client: http);
    final acls = await client.getNetworkAcls(project: 'baz');
    verify(http.openUrl('GET', uri)).called(1);
    verify(request.close()).called(1);

    expect(acls, equals(['foo', 'bar']));
  });

  test('get network acl', () async {
    const response = {
      'config': {'user.mykey': 'foo'},
      'description': 'Web servers',
      'egress': [
        {'action': 'ea', 'state': 'es'}
      ],
      'ingress': [
        {'action': 'ia', 'state': 'is'}
      ],
      'name': 'foo',
      'used_by': ['bar', 'baz'],
    };

    final http = mockHttpClient();
    final uri = unixDomainUrl('/1.0/network-acls/foo', {'project': 'baz'});
    final request = mockResponse(response);
    when(http.openUrl('GET', uri)).thenAnswer((_) async => request);

    final client = LxdClient(client: http);
    final acl = await client.getNetworkAcl('foo', project: 'baz');
    verify(http.openUrl('GET', uri)).called(1);
    verify(request.close()).called(1);

    expect(acl.config, equals({'user.mykey': 'foo'}));
    expect(acl.description, equals('Web servers'));
    expect(acl.egress, equals([LxdNetworkAclRule(action: 'ea', state: 'es')]));
    expect(acl.ingress, equals([LxdNetworkAclRule(action: 'ia', state: 'is')]));
    expect(acl.name, equals('foo'));
    expect(acl.usedBy, equals(['bar', 'baz']));
  });
}
