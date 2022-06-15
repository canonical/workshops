import 'dart:convert';
import 'dart:io';

import 'package:meta/meta.dart';

import 'index.dart';
import 'products.dart';

class SimpleStreamClient {
  SimpleStreamClient(
    this.url, {
    String userAgent = 'simplestreams.dart',
    @visibleForTesting HttpClient? client,
  })  : _userAgent = userAgent,
        _client = client ?? HttpClient();

  final HttpClient _client;
  final String url;
  String? _userAgent;

  set userAgent(String? value) => _userAgent = value;

  Future<SimpleStream> getStream() async {
    final json = await _getJson('streams/v1/index.json');
    final stream = SimpleStream.fromJson(json);
    if (stream.format != 'index:1.0') {
      throw UnsupportedError(
          'Unsupported simplestreams index format: ${stream.format}');
    }
    return stream;
  }

  Future<SimpleProducts> getProducts(SimpleStreamIndex index) async {
    final json = await _getJson(index.path);
    return SimpleProducts.fromJson(json);
  }

  Future<Map<String, dynamic>> _getJson(String path) async {
    final request = await _client.getUrl(Uri.parse('$url/$path'));
    _setHeaders(request);
    final response = await request.close();
    final body = await response.transform(utf8.decoder).join();
    return json.decode(body) as Map<String, dynamic>;
  }

  void _setHeaders(HttpClientRequest request) {
    if (_userAgent != null) {
      request.headers.set('User-Agent', _userAgent!);
    }
  }

  void close({bool force = false}) => _client.close(force: force);
}
