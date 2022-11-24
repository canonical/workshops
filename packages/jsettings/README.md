# jsettings.dart

[![pub](https://img.shields.io/pub/v/jsettings.svg)](https://pub.dev/packages/jsettings)
[![license: MPL](https://img.shields.io/badge/license-MPL-magenta.svg)](https://opensource.org/licenses/MPL-2.0)
[![CI](https://github.com/ubuntu-flutter-community/jsettings.dart/actions/workflows/ci.yaml/badge.svg)](https://github.com/ubuntu-flutter-community/jsettings.dart/actions/workflows/ci.yaml)
[![codecov](https://codecov.io/gh/ubuntu-flutter-community/jsettings.dart/branch/main/graph/badge.svg?token=mbiIcV10qb)](https://codecov.io/gh/ubuntu-flutter-community/jsettings.dart)


A simple JSON key-value store for Dart.

Similar to [shared_preferences](https://pub.dev/packages/shared_preferences) on
Linux and Windows but uses a filesystem watcher to provide change notifications.

```dart
import 'package:jsettings/jsettings.dart';
```

```dart
final settings = JSettings('/path/to/settings.json');
await settings.init();

print('Keys: ${settings.getKeys()}');

if (settings.hasKey('key')) {
  print(settings.getValue('key'));
}

settings.added.listen((key) => print('Added: $key'));
settings.changed.listen((key) => print('Changed: $key'));
settings.removed.listen((key) => print('Removed: $key'))

await settings.setValue('key', 'value');
await settings.resetValue('key');

await settings.close();
```
