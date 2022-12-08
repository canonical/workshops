import 'package:lxd/lxd.dart';
import 'package:lxd_service/lxd_service.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import 'test_lxd_service.dart';

class TestLxdVmService extends MockLxdClient with LxdVmService {}

void main() {
  test('wait vm agent', () async {
    final service = TestLxdVmService();

    const state0 = LxdInstanceState(
        status: LxdInstanceStatus.running, statusCode: 0, pid: 0);
    const state1 = LxdInstanceState(
        status: LxdInstanceStatus.running, statusCode: 0, pid: 0, processes: 1);

    when(service.getInstanceState(fooId)).thenAnswer((_) async => state0);

    expect(await service.waitVmAgent(fooId, timeout: Duration.zero), isFalse);

    when(service.getInstanceState(fooId)).thenAnswer((_) async => state1);
    expect(await service.waitVmAgent(fooId, timeout: Duration.zero), isTrue);
  });
}
