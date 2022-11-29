import 'package:lxd/lxd.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import 'lxd_http.dart';

void main() {
  test('get certificates', () async {
    final http = mockHttpClient();
    final uri = unixDomainUrl('/1.0/certificates', {});

    final request =
        mockResponse(['/1.0/certificates/foo', '/1.0/certificates/bar']);
    when(http.openUrl('GET', uri)).thenAnswer((_) async => request);

    final client = LxdClient(client: http);
    final certificates = await client.getCertificates();
    verify(http.openUrl('GET', uri)).called(1);
    verify(request.close()).called(1);

    expect(certificates, equals(['foo', 'bar']));
  });

  test('get certificate', () async {
    const response = {
      'certificate': 'CERTIFICATE',
      'fingerprint': '213394bb',
      'name': 'NAME',
      'projects': [],
      'restricted': true,
      'type': 'server',
    };

    final http = mockHttpClient();
    final uri = unixDomainUrl('/1.0/certificates/213394bb', {});
    final request = mockResponse(response);
    when(http.openUrl('GET', uri)).thenAnswer((_) async => request);

    final client = LxdClient(client: http);
    final certificate = await client.getCertificate('213394bb');
    verify(http.openUrl('GET', uri)).called(1);
    verify(request.close()).called(1);

    expect(certificate.certificate, equals('CERTIFICATE'));
    expect(certificate.fingerprint, equals('213394bb'));
    expect(certificate.name, equals('NAME'));
    expect(certificate.restricted, isTrue);
    expect(certificate.type, LxdCertificateType.server);
  });
}
