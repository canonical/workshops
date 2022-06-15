import 'package:intl/intl.dart';
import 'package:json_annotation/json_annotation.dart';

import 'products.dart';

// %a, %d %b %Y %H:%M:%S +0000
final dateFormat = DateFormat('EEE, dd MMM yyyy hh:mm:ss +0000');

class AliasConverter implements JsonConverter<List<String>?, String?> {
  const AliasConverter();

  @override
  List<String>? fromJson(String? json) => json?.split(',').toList();

  @override
  String? toJson(List<String>? aliases) => aliases?.join(',');
}

class DateTimeConverter implements JsonConverter<DateTime?, String?> {
  const DateTimeConverter();

  @override
  DateTime? fromJson(String? json) {
    try {
      return json != null ? dateFormat.parseUtc(json) : null;
    } on FormatException {
      return DateTime.tryParse(json!);
    }
  }

  @override
  String? toJson(DateTime? date) =>
      date != null ? dateFormat.format(date) : null;
}

class SimpleItemConverter
    implements JsonConverter<SimpleItem, Map<String, dynamic>> {
  const SimpleItemConverter();

  @override
  SimpleItem fromJson(Map<String, dynamic> json) {
    if (json['id'] != null) {
      return SimpleId.fromJson(json);
    } else if (json['ftype'] != null) {
      return SimpleDownload.fromJson(json);
    } else {
      throw UnsupportedError(json.toString());
    }
  }

  @override
  Map<String, dynamic> toJson(SimpleItem data) => data.toJson();
}
