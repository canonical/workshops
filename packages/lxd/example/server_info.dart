import 'dart:convert';

import 'package:lxd/lxd.dart';

Future<void> main() async {
  final client = LxdClient();

  final info = await client.getServerInfo();
  print(prettyFormatJson(info.toJson()));

  client.close();
}

String prettyFormatJson(Map<String, dynamic> json) {
  return JsonEncoder.withIndent('  ').convert(json);
}
