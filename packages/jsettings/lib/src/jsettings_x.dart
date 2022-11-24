import 'jsettings.dart';

extension JSettingsX on JSettings {
  bool? getBool(String key) => getValue(key) as bool?;
  int? getInt(String key) => getValue(key) as int?;
  double? getDouble(String key) => getValue(key) as double?;
  String? getString(String key) => getValue(key) as String?;
  List? getList(String key) => getValue(key) as List?;
  Map? getMap(String key) => getValue(key) as Map?;
}
