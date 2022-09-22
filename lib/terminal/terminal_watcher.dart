import 'dart:async';

import 'package:async_value/async_value.dart';
import 'package:flutter/material.dart';
import 'package:lxd/lxd.dart';
import 'package:lxd_service/lxd_service.dart';
import 'package:meta/meta.dart';
import 'package:safe_change_notifier/safe_change_notifier.dart';

import 'terminal_state.dart';

typedef OperationValue = AsyncValue<LxdOperation?>;

abstract class TerminalWatcher extends SafeChangeNotifier {
  factory TerminalWatcher(TerminalState state, LxdService service) {
    return state.when(
      none: () => throw UnsupportedError('none'),
      create: (_, op) => OperationWatcher(op.id, service),
      init: (instance, _) => InstanceWatcher(instance.name, service),
      config: (instance, _) => InstanceWatcher(instance.name, service),
      stage: (_, op) => OperationWatcher(op.id, service),
      start: (_, op) => OperationWatcher(op.id, service),
      restart: (_, op) => OperationWatcher(op.id, service),
      running: (_, terminal) =>
          throw UnsupportedError(terminal.instance.toString()),
      stop: (_, op) => OperationWatcher(op.id, service),
      error: (message) => throw UnsupportedError(message ?? 'error'),
    );
  }

  TerminalWatcher._(this.service);

  final LxdService service;
  StreamSubscription? _sub;
  var _operation = const OperationValue.data(null);

  OperationValue get operation => _operation;

  @protected
  set operation(OperationValue operation) {
    if (_operation == operation) return;
    _operation = operation;
    notifyListeners();
  }

  Future<void> init() async {
    operation = await load();
    _sub = watch();
  }

  Future<void> cancel() async {
    final op = operation.valueOrNull;
    if (op?.mayCancel == true) {
      return service.cancelOperation(op!.id);
    }
  }

  Future<OperationValue> load();
  StreamSubscription<LxdOperation> watch();

  @override
  void dispose() {
    _sub?.cancel();
    super.dispose();
  }
}

class OperationWatcher extends TerminalWatcher {
  OperationWatcher(this.id, LxdService service) : super._(service);

  final String id;

  @override
  Future<OperationValue> load() {
    operation = const OperationValue.loading().copyWithPrevious(operation);
    return OperationValue.guard(() => service.getOperation(id));
  }

  @override
  StreamSubscription<LxdOperation> watch() {
    return service
        .watchOperation(id)
        .listen((event) => operation = OperationValue.data(event));
  }
}

class InstanceWatcher extends TerminalWatcher {
  InstanceWatcher(this.name, LxdService service) : super._(service);

  final String name;

  @override
  Future<OperationValue> load() async {
    return const OperationValue.loading().copyWithPrevious(operation);
  }

  @override
  StreamSubscription<LxdOperation> watch() {
    return service
        .watchInstance(name)
        .listen((event) => operation = OperationValue.data(event));
  }
}

class StreamWatcher extends TerminalWatcher {
  StreamWatcher(this.stream, LxdService service) : super._(service);

  final Stream<LxdOperation> stream;

  @override
  Future<OperationValue> load() async {
    return const OperationValue.loading().copyWithPrevious(operation);
  }

  @override
  StreamSubscription<LxdOperation> watch() {
    return stream.listen((event) => operation = OperationValue.data(event));
  }
}
