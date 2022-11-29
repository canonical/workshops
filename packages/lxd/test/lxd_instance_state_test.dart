import 'package:lxd/lxd.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import 'lxd_http.dart';

void main() {
  test('get instance state', () async {
    const response = {
      'status': 'Running',
      'status_code': 0,
      'disk': {},
      'memory': {
        'usage': 89337856,
        'usage_peak': 11,
        'swap_usage': 22,
        'swap_usage_peak': 33
      },
      'network': {
        'eth0': {
          'addresses': [
            {
              'family': 'inet6',
              'address': 'fd42:4c81:5770:1eaf:216:3eff:fe0c:eedd',
              'netmask': '64',
              'scope': 'global'
            },
          ],
          'counters': {
            'bytes_received': 192021,
            'bytes_sent': 10888579,
            'packets_received': 1748,
            'packets_sent': 964,
            'errors_received': 11,
            'errors_sent': 22,
            'packets_dropped_outbound': 33,
            'packets_dropped_inbound': 44
          },
          'hwaddr': '00:16:3e:0c:ee:dd',
          'host_name': 'veth4bd95d5a',
          'mtu': 1500,
          'state': 'up',
          'type': 'broadcast'
        },
      },
      'pid': 7281,
      'processes': 46,
      'cpu': {'usage': 7123197000}
    };

    final http = mockHttpClient();
    final uri = unixDomainUrl('/1.0/instances/foo/state', {'project': 'baz'});
    final request = mockResponse(response);
    when(http.openUrl('GET', uri)).thenAnswer((_) async => request);

    final client = LxdClient(client: http);
    final state =
        await client.getInstanceState(LxdInstanceId('foo', project: 'baz'));
    expect(state.network!.keys, equals(['eth0']));
    final eth = state.network!['eth0']!;
    expect(
        eth.addresses,
        equals([
          LxdInstanceNetworkAddress(
              address: 'fd42:4c81:5770:1eaf:216:3eff:fe0c:eedd',
              family: LxdNetworkFamily.inet6,
              netmask: '64',
              scope: LxdNetworkScope.global)
        ]));
    expect(
        eth.counters,
        equals(LxdInstanceNetworkCounters(
          bytesReceived: 192021,
          bytesSent: 10888579,
          packetsReceived: 1748,
          packetsSent: 964,
          errorsReceived: 11,
          errorsSent: 22,
          packetsDroppedOutbound: 33,
          packetsDroppedInbound: 44,
        )));

    expect(eth.hwaddr, equals('00:16:3e:0c:ee:dd'));
    expect(eth.mtu, equals(1500));
    expect(eth.state, equals('up'));
    expect(eth.type, equals('broadcast'));
    expect(state.pid, equals(7281));
    expect(state.processes, equals(46));
    expect(state.status, equals(LxdInstanceStatus.running));
    expect(state.statusCode, equals(0));
    expect(state.cpu, equals(LxdInstanceCpuState(usage: 7123197000)));
    expect(
        state.memory,
        equals(LxdInstanceMemoryState(
          usage: 89337856,
          usagePeak: 11,
          swapUsage: 22,
          swapUsagePeak: 33,
        )));
  });
}
