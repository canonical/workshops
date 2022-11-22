# jsettings.dart

A simple JSON key-value store for Dart and Flutter.

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
