import 'dart:convert';
import 'dart:io';

import 'package:mockito/mockito.dart';

DateTime unixTime(int msec) => DateTime.fromMillisecondsSinceEpoch(msec);

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
  Stream<FileSystemEntity> list({
    bool recursive = false,
    bool followLinks = true,
  }) {
    return super.noSuchMethod(
      Invocation.method(#list, [], {
        #recursive: recursive,
        #followLinks: followLinks,
      }),
      returnValue: const Stream<FileSystemEntity>.empty(),
    ) as Stream<FileSystemEntity>;
  }

  @override
  Stream<FileSystemEvent> watch({
    int events = FileSystemEvent.all,
    bool recursive = false,
  }) {
    return super.noSuchMethod(
      Invocation.method(#watch, [], {
        #events: events,
        #recursive: recursive,
      }),
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
      returnValue: unixTime(0),
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

class FakeFileSystemEvent extends Fake implements FileSystemEvent {
  FakeFileSystemEvent(this.type, this.path);
  factory FakeFileSystemEvent.create(String path) =>
      FakeFileSystemEvent(FileSystemEvent.create, path);
  factory FakeFileSystemEvent.modify(String path) =>
      FakeFileSystemEvent(FileSystemEvent.modify, path);
  factory FakeFileSystemEvent.delete(String path) =>
      FakeFileSystemEvent(FileSystemEvent.delete, path);

  @override
  final int type;

  @override
  final String path;

  @override
  bool get isDirectory => false;
}
