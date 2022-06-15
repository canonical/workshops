import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'test_http.mocks.dart';
export 'test_http.mocks.dart' show MockHttpClient;

@GenerateMocks([HttpClient, HttpClientRequest, HttpClientResponse, HttpHeaders])
MockHttpClientRequest mockRequest(String data, {int statusCode = 200}) {
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
