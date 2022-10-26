import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'gio_settings.dart';

class GioSettingsChannel {
  GioSettingsChannel()
      : _broadcast = eventChannel
            .receiveBroadcastStream()
            .map((event) => event as Map<String, dynamic>);

  @visibleForTesting
  static const methodChannel = MethodChannel('gio_settings');

  @visibleForTesting
  static const eventChannel = EventChannel('gio_settings/events');

  final Stream<Map<String, dynamic>> _broadcast;

  Future<void> subscribe(GioSettings settings) {
    return methodChannel.invokeMethod('subscribe', settings.toJson());
  }

  Future<void> unsubscribe(GioSettings settings) {
    return methodChannel.invokeMethod('unsubscribe', settings.toJson());
  }

  Stream<List<String>> keysChanged(GioSettings settings) {
    return _broadcast
        .where((event) =>
            settings.schemaId == event['schemaId'] &&
            (settings.path == null || settings.path == event['path']))
        .map((event) => (event['keys'] as List).cast<String>());
  }

  Future<List<String>> list(GioSettings settings) {
    return methodChannel
        .invokeListMethod<String>('list', settings.toJson())
        .then((value) => value!);
  }

  Future<T> get<T>(GioSettings settings, String key) {
    return methodChannel
        .invokeMethod<T>('get', settings.toJson({'key': key}))
        .then((value) => value!);
  }

  Future<T> getDefault<T>(GioSettings settings, String key) {
    return methodChannel
        .invokeMethod<T>('getDefault', settings.toJson({'key': key}))
        .then((value) => value!);
  }

  Future<void> set<T>(GioSettings settings, String key, T value) {
    return methodChannel.invokeMethod(
        'set', settings.toJson({'key': key, 'value': value}));
  }

  Future<void> unset(GioSettings settings, String key) {
    return methodChannel.invokeMethod('unset', settings.toJson({'key': key}));
  }
}

extension _GioSettingsX on GioSettings {
  Map<String, dynamic> toJson([
    Map<String, dynamic> values = const {},
  ]) {
    return {'schemaId': schemaId, 'path': path}..addAll(values);
  }
}
