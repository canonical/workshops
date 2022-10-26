import 'dart:async';

import 'package:flutter/foundation.dart';

import 'gio_settings_channel.dart';

class GioSettings {
  GioSettings(this.schemaId, {this.path}) {
    channel.subscribe(this);
  }

  final String schemaId;
  final String? path;

  @visibleForTesting
  static GioSettingsChannel channel = GioSettingsChannel();

  Stream<List<String>> get keysChanged => channel.keysChanged(this);

  Future<void> close() => channel.unsubscribe(this);
  Future<List<String>> list() => channel.list(this);
  Future<T> get<T>(String key) => channel.get(this, key);
  Future<T> getDefault<T>(String key) => channel.getDefault(this, key);
  Future<void> set<T>(String key, T value) => channel.set(this, key, value);
  Future<void> unset(String key) => channel.unset(this, key);
}
