import 'dart:convert';
import 'dart:io';

import 'package:mockito/mockito.dart';
import 'package:osarch/osarch.dart';
import 'package:test/test.dart';

void main() {
  test('os-release', () async {
    await IOOverrides.runZoned(() async {
      expect(await getOsRelease(), {
        'NAME': 'Ubuntu',
        'ID': 'ubuntu',
        'VERSION_ID': '16.04',
      });
    }, createFile: (path) {
      expect(path, '/etc/os-release');
      return MockTextFile('''
NAME="Ubuntu"
ID="ubuntu"
VERSION_ID="16.04"
''');
    });
  });

  test('lsb-release', () async {
    await IOOverrides.runZoned(() async {
      expect(await getLsbRelease(), {
        'NAME': 'Ubuntu',
        'ID': 'ubuntu',
        'VERSION_ID': '16.04',
      });
    }, createFile: (path) {
      expect(path, '/etc/lsb-release');
      return MockTextFile('''
NAME="Ubuntu"
ID="ubuntu"
VERSION_ID="16.04"
''');
    });
  });

  test('single quotes', () async {
    await IOOverrides.runZoned(() async {
      expect(await getOsRelease(), {
        'NAME': 'Ubuntu',
      });
    }, createFile: (_) => MockTextFile('''
NAME='Ubuntu'
'''));
  });

  test('no quotes', () async {
    await IOOverrides.runZoned(() async {
      expect(await getOsRelease(), {
        'NAME': 'Ubuntu',
      });
    }, createFile: (_) => MockTextFile('''
NAME=Ubuntu
'''));
  });

  test('skip comments and empty lines', () async {
    await IOOverrides.runZoned(() async {
      expect(await getOsRelease(), {
        'NAME': 'Ubuntu',
        'ID': 'ubuntu',
        'VERSION_ID': '16.04',
      });
    }, createFile: (_) => MockTextFile('''
NAME="Ubuntu"

ID="ubuntu"
# skip this line
VERSION_ID="16.04"
'''));
  });

  test('invalid line', () async {
    await IOOverrides.runZoned(() async {
      expect(await getOsRelease(), {
        'NAME': 'Ubuntu',
        'ID': 'ubuntu',
      });
    }, createFile: (_) => MockTextFile('''
NAME="Ubuntu"
this is invalid
ID="ubuntu"
'''));
  });
}

class MockTextFile extends Mock implements File {
  MockTextFile(this.content);
  final String content;
  @override
  Future<List<String>> readAsLines({Encoding encoding = utf8}) async {
    return content.split('\n');
  }
}
