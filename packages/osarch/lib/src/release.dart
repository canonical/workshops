// os-release & lsb-release reading borrowed from device_info_plus_linux:
// https://github.com/fluttercommunity/plus_plugins/blob/main/packages/device_info_plus/device_info_plus_linux/lib/src/device_info.dart
//
// MIT License
//
// Copyright (c) 2020 The Flutter Community Plus Plugin Authors
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.

import 'dart:io';

Future<Map<String, String?>?> getOsRelease() {
  return _tryReadKeyValues('/etc/os-release').then(
      (value) async => value ?? await _tryReadKeyValues('/usr/lib/os-release'));
}

Future<Map<String, String?>?> getLsbRelease() {
  return _tryReadKeyValues('/etc/lsb-release');
}

Future<Map<String, String?>?> _tryReadKeyValues(String path) {
  return File(path)
      .readAsLines()
      .then((lines) => lines.toKeyValues(), onError: (_) => null);
}

extension _Unquote on String {
  String removePrefix(String prefix) {
    if (!startsWith(prefix)) return this;
    return substring(prefix.length);
  }

  String removeSuffix(String suffix) {
    if (!endsWith(suffix)) return this;
    return substring(0, length - suffix.length);
  }

  String unquote() {
    return removePrefix('"')
        .removePrefix("'")
        .removeSuffix('"')
        .removeSuffix("'");
  }
}

extension _KeyValues on List<String> {
  Map<String, String?> toKeyValues() {
    return Map.fromEntries(
      where((line) => !line.startsWith('#'))
          .map((line) => line.split('='))
          .where((parts) => parts.length == 2)
          .map((parts) => MapEntry(parts.first, parts.last.unquote())),
    );
  }
}
