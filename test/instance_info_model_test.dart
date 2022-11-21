import 'package:flutter_test/flutter_test.dart';
import 'package:lxd_service/lxd_service.dart';
import 'package:lxd_test/lxd_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:workshops/home/instance_info_model.dart';

import 'instance_info_model_test.mocks.dart';

@GenerateMocks([LxdService])
void main() {
  test('timer', () async {
    const instanceName = 'foo';
    const updateInterval = Duration(milliseconds: 10);
    final instance = testInstance(name: instanceName);
    final instanceState = testInstanceState();
    final service = MockLxdService();

    when(service.getInstance(instanceName)).thenAnswer((_) async => instance);
    when(service.getInstanceState(instanceName))
        .thenAnswer((_) async => instanceState);
    final model = InstanceInfoModel(
      instanceName: instanceName,
      service: service,
      updateInterval: updateInterval,
    );

    await model.init();
    expect(model.instance, instance);
    expect(model.instanceState, instanceState);

    var calls = 0;
    model.addListener(() => calls++);
    await Future.delayed(updateInterval);
    await Future.delayed(updateInterval);
    expect(calls, 2);
    model.dispose();
    await Future.delayed(updateInterval);
    expect(calls, 2);
  });
}
