import 'package:lxd/lxd.dart';

void main(List<String> args) async {
  if (args.isEmpty) {
    print('Need an instance name');
    return;
  }
  var instanceName = args.first;

  var client = LxdClient();

  var operation = await client.startInstance(LxdInstanceId(instanceName));
  operation = await client.waitOperation(operation.id);
  if (operation.status == 'Success') {
    print('Started $instanceName.');
  } else {
    print('Failed: ${operation.error}');
  }

  client.close();
}
