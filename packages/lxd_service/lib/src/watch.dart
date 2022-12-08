import 'dart:async';

import 'package:lxd/lxd.dart';
import 'package:lxd_x/lxd_x.dart';

mixin LxdWatchService on LxdClient {
  Stream<LxdOperation> watchInstance(LxdInstanceId id) {
    return getEvents(project: id.project)
        .where((event) => event.isOperation)
        .map((event) => LxdOperation.fromJson(event.metadata!))
        .where((op) => op.getInstances()?.contains(id) == true);
  }

  Stream<LxdOperation> watchOperation(String id) {
    return getEvents()
        .where((event) => event.isOperation && event.metadata?['id'] == id)
        .map((event) => LxdOperation.fromJson(event.metadata!));
  }
}
