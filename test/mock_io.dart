import 'dart:convert';
import 'dart:io';

import 'package:mockito/mockito.dart';

final epoch = DateTime.fromMicrosecondsSinceEpoch(0);

class MockDirectory extends Mock implements Directory {
  MockDirectory(this.path);

  @override
  final String path;

  @override
  bool existsSync() {
    return super.noSuchMethod(
      Invocation.method(#existsSync, []),
      returnValue: false,
    ) as bool;
  }

  @override
  Stream<FileSystemEvent> watch({
    int events = FileSystemEvent.all,
    bool recursive = false,
  }) {
    return super.noSuchMethod(
      Invocation.method(#watch, [events, recursive]),
      returnValue: const Stream<FileSystemEvent>.empty(),
    ) as Stream<FileSystemEvent>;
  }
}

class MockFile extends Mock implements File {
  MockFile(this.path);

  @override
  final String path;

  @override
  bool existsSync() {
    return super.noSuchMethod(
      Invocation.method(#existsSync, []),
      returnValue: false,
    ) as bool;
  }

  @override
  DateTime lastModifiedSync() {
    return super.noSuchMethod(
      Invocation.method(#lastModifiedSync, []),
      returnValue: epoch,
    ) as DateTime;
  }

  @override
  String readAsStringSync({Encoding encoding = utf8}) {
    return super.noSuchMethod(
      Invocation.method(#readAsStringSync, []),
      returnValue: '',
    ) as String;
  }

  @override
  Future<File> writeAsString(
    String? contents, {
    FileMode mode = FileMode.write,
    Encoding encoding = utf8,
    bool flush = false,
  }) {
    return super.noSuchMethod(
      Invocation.method(#writeAsString, [contents]),
      returnValue: Future.value(this),
    ) as Future<File>;
  }
}
