import 'package:fake_async/fake_async.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lxd/lxd.dart';
import 'package:lxd_service/lxd_service.dart';
import 'package:lxd_test/lxd_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:workshops/home/instance_info_model.dart';

import 'instance_info_model_test.mocks.dart';

@GenerateMocks([LxdService])
void main() {
  test('timer', () async {
    fakeAsync((async) {
      const instanceId = LxdInstanceId('foo');
      const updateInterval = Duration(milliseconds: 10);
      final instance = testInstance(name: instanceId.name);
      final instanceState = testInstanceState();
      final service = MockLxdService();

      when(service.getInstance(instanceId)).thenAnswer((_) async => instance);
      when(service.getInstanceState(instanceId))
          .thenAnswer((_) async => instanceState);
      final model = InstanceInfoModel(
        id: instanceId,
        service: service,
        updateInterval: updateInterval,
      );

      model.init();
      async.elapse(Duration.zero);
      expect(model.instance, instance);
      expect(model.instanceState, instanceState);

      var calls = 0;
      model.addListener(() => calls++);
      async.elapse(updateInterval);
      async.elapse(updateInterval);
      expect(calls, 2);
      model.dispose();
      async.elapse(updateInterval);
      expect(calls, 2);
    });
  });
}
