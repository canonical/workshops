import 'package:lxd/lxd.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import 'lxd_http.dart';

void main() {
  test('get networks', () async {
    final http = mockHttpClient();
    final uri = unixDomainUrl('/1.0/networks', {});
    final request = mockResponse(['/1.0/networks/foo', '/1.0/networks/bar']);
    when(http.openUrl('GET', uri)).thenAnswer((_) async => request);

    final client = LxdClient(client: http);
    final networks = await client.getNetworks();
    verify(http.openUrl('GET', uri)).called(1);
    verify(request.close()).called(1);

    expect(networks, equals(['foo', 'bar']));
  });

  test('get network', () async {
    const response = {
      'config': {
        'ipv4.address': '10.0.0.1/24',
        'ipv4.nat': 'true',
        'ipv6.address': 'none',
      },
      'description': 'My new LXD bridge',
      'locations': ['none'],
      'managed': true,
      'name': 'lxdbr0',
      'status': 'Created',
      'type': 'bridge',
      'used_by': [
        '/1.0/profiles/default',
        '/1.0/instances/foo',
        '/1.0/instances/bar',
      ]
    };

    final http = mockHttpClient();
    final uri = unixDomainUrl('/1.0/networks/lxdbr0', {});
    final request = mockResponse(response);
    when(http.openUrl('GET', uri)).thenAnswer((_) async => request);

    final client = LxdClient(client: http);
    final network = await client.getNetwork('lxdbr0');
    verify(http.openUrl('GET', uri)).called(1);
    verify(request.close()).called(1);

    expect(
        network.config,
        equals({
          'ipv4.address': '10.0.0.1/24',
          'ipv4.nat': 'true',
          'ipv6.address': 'none'
        }));
    expect(network.description, equals('My new LXD bridge'));
    expect(network.managed, isTrue);
    expect(network.name, equals('lxdbr0'));
    expect(network.status, equals('Created'));
    expect(network.type, equals('bridge'));
  });

  test('get network leases', () async {
    const response = [
      {
        'address': '10.0.0.98',
        'hostname': 'c1',
        'hwaddr': '00:16:3e:2c:89:d9',
        'location': 'lxd01',
        'type': 'dynamic',
      }
    ];

    final http = mockHttpClient();
    final uri = unixDomainUrl('/1.0/networks/lxdbr0/leases', {});
    final request = mockResponse(response);
    when(http.openUrl('GET', uri)).thenAnswer((_) async => request);

    final client = LxdClient(client: http);
    final leases = await client.getNetworkLeases('lxdbr0');
    verify(http.openUrl('GET', uri)).called(1);
    verify(request.close()).called(1);

    expect(leases, hasLength(1));
    final lease = leases.single;
    expect(lease.address, equals('10.0.0.98'));
    expect(lease.hostname, equals('c1'));
    expect(lease.hwaddr, equals('00:16:3e:2c:89:d9'));
    expect(lease.location, equals('lxd01'));
    expect(lease.type, equals('dynamic'));
  });

  test('get network state', () async {
    const response = {
      'addresses': [
        {
          'address': '10.0.0.1',
          'family': 'inet',
          'netmask': '24',
          'scope': 'global',
        }
      ],
      'counters': {
        'bytes_received': 250542118,
        'bytes_sent': 17524040140,
        'packets_received': 1182515,
        'packets_sent': 1567934
      },
      'hwaddr': '00:16:3e:5a:83:57',
      'mtu': 1500,
      'state': 'up',
      'type': 'broadcast',
    };

    final http = mockHttpClient();
    final uri = unixDomainUrl('/1.0/networks/lxdbr0/state', {});
    final request = mockResponse(response);
    when(http.openUrl('GET', uri)).thenAnswer((_) async => request);

    final client = LxdClient(client: http);
    final state = await client.getNetworkState('lxdbr0');
    verify(http.openUrl('GET', uri)).called(1);
    verify(request.close()).called(1);

    expect(
        state.addresses,
        equals([
          LxdNetworkAddress(
              address: '10.0.0.1',
              family: 'inet',
              netmask: '24',
              scope: 'global')
        ]));
    expect(state.counters.bytesReceived, equals(250542118));
    expect(state.counters.bytesSent, equals(17524040140));
    expect(state.counters.packetsReceived, equals(1182515));
    expect(state.counters.packetsSent, equals(1567934));
    expect(state.hwaddr, equals('00:16:3e:5a:83:57'));
    expect(state.mtu, equals(1500));
    expect(state.state, equals('up'));
    expect(state.type, equals('broadcast'));
  });
}
