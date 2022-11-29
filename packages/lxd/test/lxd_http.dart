import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'lxd_http.mocks.dart';

Uri unixDomainUrl(String path, [Map<String, dynamic>? queryParameters]) {
  return Uri(
    scheme: 'unix',
    host: 'localhost',
    path: path,
    queryParameters: queryParameters,
  );
}

@GenerateMocks([HttpClient, HttpClientRequest, HttpClientResponse, HttpHeaders])
MockHttpClient mockHttpClient() {
  const hostInfo = {
    'config': {},
    'api_extensions': [],
    'api_status': 'stable',
    'api_version': '1.0',
    'auth': 'trusted',
    'public': false,
    'auth_methods': ['tls'],
    'environment': {}
  };
  final client = MockHttpClient();
  when(client.openUrl('GET', unixDomainUrl('/1.0', {})))
      .thenAnswer((_) async => mockResponse(hostInfo));
  return client;
}

MockHttpClientRequest mockResponse(dynamic metadata, {int statusCode = 200}) {
  return _mockRequest(jsonEncode({
    'type': 'sync',
    'status': 'Success',
    'status_code': statusCode,
    'metadata': metadata,
  }));
}

MockHttpClientRequest mockOperation({
  required String id,
  String type = 'task',
  String description = 'DESCRIPTION',
  String createdAt = '2021-03-23T20:00:00-04:00',
  String updatedAt = '2021-03-23T20:00:00-04:00',
  String status = 'STATUS',
  int statusCode = 200,
}) {
  return _mockRequest(jsonEncode({
    'type': 'async',
    'status': '',
    'status_code': statusCode,
    'operation': '/1.0/operations/$id',
    'metadata': {
      'class': type,
      'created_at': createdAt,
      'description': description,
      'err': '',
      'id': id,
      'location': 'none',
      'may_cancel': false,
      'resources': {},
      'status': status,
      'status_code': statusCode,
      'updated_at': updatedAt,
    },
  }));
}

MockHttpClientRequest mockError(String message, {required int statusCode}) {
  return _mockRequest(jsonEncode({
    'type': 'error',
    'error_code': statusCode,
    'error': message,
  }));
}

MockHttpClientRequest _mockRequest(String data, {int statusCode = 200}) {
  final response = MockHttpClientResponse();
  when(response.statusCode).thenReturn(statusCode);
  when(response.transform(utf8.decoder)).thenAnswer((_) => Stream.value(data));

  final headers = MockHttpHeaders();
  when(headers.contentType).thenReturn(ContentType('application', 'json'));
  when(headers.contentLength).thenReturn(data.length);

  final request = MockHttpClientRequest();
  when(request.headers).thenReturn(headers);
  when(request.done).thenAnswer((_) async => response);
  when(request.close()).thenAnswer((_) async => response);
  return request;
}
