import 'api/event.dart';
import 'api/image.dart';
import 'api/instance.dart';
import 'api/network.dart';
import 'api/operation.dart';
import 'instance_id.dart';
import 'status_code.dart';

extension LxdEventX on LxdEvent {
  bool get isOperation => type == LxdEventType.operation;
  LxdOperation toOperation() {
    return LxdOperation.fromJson(metadata ?? <String, dynamic>{});
  }
}

extension LxdImageX on LxdImage {
  String? get description => properties['description'];
  String? get name => properties['name'];
  String? get os => properties['os'];
  String? get project => properties['project'];
  String? get release => properties['release'];
  String? get variant => properties['variant'];
}

extension LxdInstanceX on LxdInstance {
  String? get os => config['image.os'];

  bool get isBusy => isStarting || isStopping;
  bool get isStarting => statusCode == LxdStatusCode.starting;
  bool get isStarted => statusCode == LxdStatusCode.started;
  bool get isRunning => statusCode == LxdStatusCode.running;
  bool get isStopping => statusCode == LxdStatusCode.stopping;
  bool get isStopped => statusCode == LxdStatusCode.stopped;
}

extension LxdNetworkAddressX on LxdNetworkAddress {
  bool get isIPv4 => family == 'inet' && !isLinkLocal;
  bool get isIPv6 => family == 'inet6' && !isLinkLocal;
  bool get isLinkLocal => scope == 'link' || scope == 'local';
}

extension LxdNetworkStateX on LxdNetworkState {
  bool get isLoopback => type == 'loopback';

  List<LxdNetworkAddress> get ipv4s {
    return addresses.where((address) => address.isIPv4).toList();
  }

  List<LxdNetworkAddress> get ipv6s {
    return addresses.where((address) => address.isIPv6).toList();
  }
}

extension LxdOperationX on LxdOperation {
  List<LxdInstanceId>? getInstances({String? project}) {
    final instances = resources?['instances']?.map(LxdInstanceId.fromPath);
    return instances
        ?.map((id) => LxdInstanceId(id.name, project: project ?? id.project))
        .toList();
  }

  bool get isRunning => statusCode == LxdStatusCode.running;
  bool get isPending => statusCode == LxdStatusCode.pending;

  String? get downloadProgress => metadata?['download_progress'] as String?;
  String? get unpackProgress =>
      metadata?['create_instance_from_image_unpack_progress'] as String?;
}
