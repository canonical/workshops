import 'package:lxd/lxd.dart';

LxdImage testImage({
  String? architecture,
  String? filename,
  required String fingerprint,
  List<String>? profiles,
  Map<String, String>? properties,
  int? size,
  LxdImageType? type,
}) {
  final epoch = DateTime.fromMillisecondsSinceEpoch(0);
  return LxdImage(
    architecture: architecture ?? '',
    createdAt: epoch,
    expiresAt: epoch,
    filename: filename ?? '',
    fingerprint: fingerprint,
    profiles: profiles ?? [],
    properties: properties ?? {},
    size: size ?? 0,
    type: type ?? LxdImageType.container,
    uploadedAt: epoch,
  );
}

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

LxdInstanceState testInstanceState({
  LxdInstanceStatus? status,
}) {
  return LxdInstanceState(
    status: status ?? LxdInstanceStatus.stopped,
    statusCode: 0,
    pid: 0,
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
