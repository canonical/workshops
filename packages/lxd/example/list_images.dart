import 'dart:math';

import 'package:lxd/lxd.dart';

void main(List<String> args) async {
  var rows = <List<String>>[
    [
      'ALIAS',
      'FINGERPRINT',
      'PUBLIC',
      'DESCRIPTION',
      'ARCHITECTURE',
      'TYPE',
      'SIZE',
      'UPLOAD DATE'
    ]
  ];

  var client = LxdClient();
  for (var fingerprint in await client.getImages()) {
    var image = await client.getImage(fingerprint);
    rows.add([
      '',
      image.fingerprint.substring(0, 12),
      'no',
      image.properties['description'] ?? '',
      image.architecture,
      image.type.name,
      image.size.toString(),
      image.uploadedAt.toString()
    ]);
  }
  client.close();

  var widths = <int>[];
  for (var i = 0; i < rows[0].length; i++) {
    widths.add(rows.fold(0, (width, row) => max(width, row[i].length)));
  }
  for (var row in rows) {
    var paddedRow = [];
    for (var i = 0; i < row.length; i++) {
      paddedRow.add(row[i].padLeft(widths[i]));
    }
    print(paddedRow.join(' | '));
  }
}
