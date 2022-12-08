import 'package:flutter/services.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:yaml/yaml.dart';

part 'config_schema.freezed.dart';
part 'config_schema.g.dart';

@freezed
class ConfigSchemaEntry with _$ConfigSchemaEntry {
  const factory ConfigSchemaEntry({
    @JsonKey(name: 'Default', defaultValue: '') required String defaultValue,
    @JsonKey(name: 'Description', defaultValue: '') required String description,
    @JsonKey(name: 'Type') required String type,
  }) = _ConfigSchemaEntry;

  factory ConfigSchemaEntry.fromJson(Map<String, dynamic> json) =>
      _$ConfigSchemaEntryFromJson(json);
}

class JsonStringToType implements JsonConverter<Type, String> {
  const JsonStringToType();
  @override
  Type fromJson(String json) {
    switch (json.toLowerCase()) {
      case 'string':
        return String;
      case 'bool':
        return bool;
      case 'integer':
        return int;
      default:
        return Object;
    }
  }

  @override
  String toJson(Type object) => object.toString();
}

Future<Map<String, ConfigSchemaEntry>> loadConfigSchema(
    String assetName) async {
  final yamlData = loadYaml(await rootBundle.loadString(assetName)) as YamlMap;
  final configSchema = <String, ConfigSchemaEntry>{};
  yamlData.forEach((key, value) {
    final json = {
      for (final entry in (value as YamlMap).entries)
        entry.key as String: entry.value
    };
    configSchema[key as String] = ConfigSchemaEntry.fromJson(json);
  });
  return configSchema;
}
