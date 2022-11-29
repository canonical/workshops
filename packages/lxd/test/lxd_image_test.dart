import 'package:lxd/lxd.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import 'lxd_http.dart';

void main() {
  test('get images', () async {
    final http = mockHttpClient();
    final uri = unixDomainUrl('/1.0/images', {'project': 'baz'});
    final request = mockResponse(['/1.0/images/foo', '/1.0/images/bar']);
    when(http.openUrl('GET', uri)).thenAnswer((_) async => request);

    final client = LxdClient(client: http);
    final images = await client.getImages(project: 'baz');
    verify(http.openUrl('GET', uri)).called(1);
    verify(request.close()).called(1);

    expect(images, equals(['foo', 'bar']));
  });

  test('get image', () async {
    const response = {
      'aliases': [
        {'name': 'ubuntu-22.04', 'description': 'Our preferred Ubuntu image'},
      ],
      'architecture': 'x86_64',
      'auto_update': true,
      'cached': true,
      'created_at': '2022-05-06T00:00:00Z',
      'expires_at': '2027-04-21T00:00:00Z',
      'filename': 'ubuntu-22.04-server-cloudimg-amd64-lxd.tar.xz',
      'fingerprint':
          '0cf6019706a493d3b7fa9f178d791b7a333c92299864749d018962290bd80453',
      'last_used_at': '2022-05-16T19:37:43.410127112Z',
      'profiles': ['default'],
      'properties': {
        'architecture': 'amd64',
        'description': 'ubuntu 22.04 LTS amd64 (release) (20220506)',
        'label': 'release',
        'os': 'ubuntu',
        'release': 'jammy',
        'serial': '20220506',
        'type': 'disk-kvm.img',
        'version': '22.04'
      },
      'public': false,
      'size': 596771228,
      'type': 'virtual-machine',
      'update_source': {
        'alias': '22.04',
        'certificate': '',
        'image_type': '',
        'protocol': 'simplestreams',
        'server': 'https://cloud-images.ubuntu.com/releases'
      },
      'uploaded_at': '2022-05-16T19:37:43.335699925Z'
    };

    final http = mockHttpClient();
    final uri = unixDomainUrl('/1.0/images/foo', {'project': 'baz'});
    final request = mockResponse(response);
    when(http.openUrl('GET', uri)).thenAnswer((_) async => request);

    final client = LxdClient(client: http);
    final image = await client.getImage('foo', project: 'baz');
    verify(http.openUrl('GET', uri)).called(1);
    verify(request.close()).called(1);

    expect(
        image.aliases,
        equals([
          LxdImageAlias(
              name: 'ubuntu-22.04', description: 'Our preferred Ubuntu image'),
        ]));
    expect(image.architecture, equals('x86_64'));
    expect(image.autoUpdate, isTrue);
    expect(image.cached, isTrue);
    expect(image.createdAt, equals(DateTime.parse('2022-05-06T00:00:00Z')));
    expect(image.expiresAt, equals(DateTime.parse('2027-04-21T00:00:00Z')));
    expect(image.filename,
        equals('ubuntu-22.04-server-cloudimg-amd64-lxd.tar.xz'));
    expect(
        image.fingerprint,
        equals(
            '0cf6019706a493d3b7fa9f178d791b7a333c92299864749d018962290bd80453'));
    expect(image.lastUsedAt,
        equals(DateTime.parse('2022-05-16T19:37:43.410127112Z')));
    expect(image.profiles, equals(['default']));
    expect(
        image.properties,
        equals({
          'architecture': 'amd64',
          'description': 'ubuntu 22.04 LTS amd64 (release) (20220506)',
          'label': 'release',
          'os': 'ubuntu',
          'release': 'jammy',
          'serial': '20220506',
          'type': 'disk-kvm.img',
          'version': '22.04'
        }));
    expect(image.public, isFalse);
    expect(image.size, equals(596771228));
    expect(image.type, equals(LxdImageType.virtualMachine));
    expect(
        image.updateSource,
        equals(LxdImageSource(
            alias: '22.04',
            certificate: '',
            imageType: null,
            protocol: 'simplestreams',
            server: 'https://cloud-images.ubuntu.com/releases')));
    expect(image.uploadedAt,
        equals(DateTime.parse('2022-05-16T19:37:43.335699925Z')));
  });
}
