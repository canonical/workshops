/// A simple JSON key-value store.
///
/// Similar to [shared_preferences](https://pub.dev/packages/shared_preferences) on
/// Linux and Windows but uses a filesystem watcher to provide change notifications.
///
/// ```dart
/// import 'package:flutter_jsettings/flutter_jsettings.dart';
/// ```
///
/// ```dart
/// ChangeNotifierProvider(
///   create: (_) => JSettingsNotifier('/path/to/settings.json'),
///   child: MyApp(),
/// )
/// ```
///
/// ```dart
/// Checkbox(
///   value: context.watch<JSettingsNotifier>().getBool('key') ?? false,
///   onChanged: (v) => context.read<JSettingsNotifier>().setValue('key', v),
/// ),
/// ```
library flutter_jsettings;

export 'package:jsettings/jsettings.dart';

export 'src/jsettings_mixin.dart';
export 'src/jsettings_notifier.dart';
