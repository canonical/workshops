import 'package:lxd/lxd.dart';

LxdInstance testInstance({
  required String name,
  int? statusCode,
  Map<String, String>? config,
}) {
  return LxdInstance(
    architecture: 'amd64',
    config: config ?? {},
    createdAt: DateTime.now(),
    description: '',
    devices: {},
    ephemeral: false,
    expandedConfig: {},
    expandedDevices: {},
    lastUsedAt: DateTime.now(),
    location: '',
    name: name,
    profiles: [],
    project: '',
    restore: '',
    stateful: false,
    status: '',
    statusCode: statusCode ?? LxdStatusCode.stopped,
    type: LxdInstanceType.container,
  );
}

LxdOperation testOperation({
  String? description,
  String? id,
  List<String>? instances,
  int? statusCode,
  Map<String, dynamic>? metadata,
}) {
  return LxdOperation(
    createdAt: DateTime.now(),
    description: description ?? '',
    error: '',
    id: id ?? '',
    location: '',
    mayCancel: false,
    metadata: metadata,
    resources: {'instances': instances ?? []},
    status: '',
    statusCode: statusCode ?? 200,
    type: LxdOperationType.task,
    updatedAt: DateTime.now(),
  );
}
