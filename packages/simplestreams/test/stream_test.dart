import 'dart:convert';

import 'package:mockito/mockito.dart';
import 'package:simplestreams/simplestreams.dart';
import 'package:test/test.dart';

import 'test_http.dart';

void main() {
  test('index', () async {
    const response = {
      'index': {
        'images': {
          'datatype': 'image-downloads',
          'path': 'streams/v1/images.json',
          'format': 'products:1.0',
          'products': ['foo', 'bar', 'baz']
        },
        'ids': {
          'datatype': 'image-ids',
          'path': 'streams/v1/ids.json',
          'format': 'products:1.0',
          'products': ['foo', 'bar', 'baz']
        },
      },
      'format': 'index:1.0'
    };

    final http = MockHttpClient();
    final uri = Uri.https('127.0.0.1', '/streams/v1/index.json');
    final request = mockRequest(jsonEncode(response));
    when(http.getUrl(uri)).thenAnswer((_) async => request);

    final client = SimpleStreamClient('https://127.0.0.1', client: http);
    final stream = await client.getStream();
    verify(http.getUrl(uri)).called(1);
    verify(request.close()).called(1);

    expect(
      stream,
      const SimpleStream(
        format: 'index:1.0',
        index: {
          'images': SimpleStreamIndex(
            datatype: 'image-downloads',
            format: 'products:1.0',
            path: 'streams/v1/images.json',
            products: ['foo', 'bar', 'baz'],
          ),
          'ids': SimpleStreamIndex(
            datatype: 'image-ids',
            format: 'products:1.0',
            path: 'streams/v1/ids.json',
            products: ['foo', 'bar', 'baz'],
          ),
        },
      ),
    );
  });

  test('format', () async {
    const response = {'index': {}, 'format': 'index:5.0'};

    final http = MockHttpClient();
    final uri = Uri.https('127.0.0.1', '/streams/v1/index.json');
    final request = mockRequest(jsonEncode(response));
    when(http.getUrl(uri)).thenAnswer((_) async => request);

    final client = SimpleStreamClient('https://127.0.0.1', client: http);

    await expectLater(client.getStream, throwsA(isA<UnsupportedError>()));
  });

  test('updated', () async {
    const response = {
      'index': {},
      'updated': 'Wed, 01 Jun 2022 11:29:48 +0000',
      'format': 'index:1.0'
    };

    final http = MockHttpClient();
    final uri = Uri.https('127.0.0.1', '/streams/v1/index.json');
    final request = mockRequest(jsonEncode(response));
    when(http.getUrl(uri)).thenAnswer((_) async => request);

    final client = SimpleStreamClient('https://127.0.0.1', client: http);
    final stream = await client.getStream();
    verify(http.getUrl(uri)).called(1);
    verify(request.close()).called(1);

    expect(stream.updated, DateTime.utc(2022, 06, 01, 11, 29, 48));
  });
}
