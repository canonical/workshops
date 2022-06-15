import 'dart:convert';

import 'package:mockito/mockito.dart';
import 'package:simplestreams/simplestreams.dart';
import 'package:test/test.dart';

import 'test_http.dart';

void main() {
  test('downloads', () async {
    const response = {
      'content_id': 'images',
      'datatype': 'image-downloads',
      'format': 'products:1.0',
      'products': {
        'ubuntu:jammy:amd64:default': {
          'aliases':
              'ubuntu/jammy/default,ubuntu/22.04/default,ubuntu/jammy,ubuntu/22.04',
          'arch': 'amd64',
          'os': 'Ubuntu',
          'release': 'jammy',
          'release_title': 'jammy',
          'variant': 'default',
          'versions': {
            '20220530_08:32': {
              'items': {
                'lxd.tar.xz': {
                  'ftype': 'lxd.tar.xz',
                  'sha256':
                      '11d27ad8e79e2bbbf99d461060551b23aca96fd7ef09ed65f53f5eb5b1058265',
                  'size': 676,
                  'path':
                      'images/ubuntu/jammy/amd64/default/20220530_08:32/lxd.tar.xz',
                  'combined_sha256':
                      '72cad2fb283fa2cc64807ebd874e7c4e3ed667cfc3a7889c02536de590744971',
                  'combined_rootxz_sha256':
                      '72cad2fb283fa2cc64807ebd874e7c4e3ed667cfc3a7889c02536de590744971',
                  'combined_squashfs_sha256':
                      '2ff79bf2006a1d8952cc84fef0a4ff152b79946a8f796e9bd0e451be125b6713',
                  'combined_disk-kvm-img_sha256':
                      'dddb4c8d1b25ad693722babbc4726da56ccfcb307859b59070206f78547fcd13'
                },
                'root.tar.xz': {
                  'ftype': 'root.tar.xz',
                  'sha256':
                      '343d3e0a95c571915133e082bd2a81b3116f5f5355ee125b4e2ba9803d2d016c',
                  'size': 106404360,
                  'path':
                      'images/ubuntu/jammy/amd64/default/20220530_08:32/rootfs.tar.xz'
                },
                'root.squashfs': {
                  'ftype': 'squashfs',
                  'sha256':
                      'f5063894318917b18df7df857bd6e539d4458821a02da1fc89f50d4140b4e53a',
                  'size': 117616640,
                  'path':
                      'images/ubuntu/jammy/amd64/default/20220530_08:32/rootfs.squashfs'
                },
                'disk.qcow2': {
                  'ftype': 'disk-kvm.img',
                  'sha256':
                      'e904f854fb9aa3feccbcf0da6e7ac585578b5adc658c11ca90519357835666d2',
                  'size': 258605056,
                  'path':
                      'images/ubuntu/jammy/amd64/default/20220530_08:32/disk.qcow2'
                },
                'root.20220529_07:43.vcdiff': {
                  'ftype': 'squashfs.vcdiff',
                  'sha256':
                      '0fb4afcf598c573a817038f35dcac9f9224fb07525e07743f17a825fa05bc5fd',
                  'size': 742691,
                  'path':
                      'images/ubuntu/jammy/amd64/default/20220530_08:32/delta-20220529_07:43.vcdiff',
                  'delta_base': '20220529_07:43'
                },
              },
            },
          },
        },
      },
    };

    final http = MockHttpClient();
    final uri = Uri.https('127.0.0.1', '/streams/v1/images.json');
    final request = mockRequest(jsonEncode(response));
    when(http.getUrl(uri)).thenAnswer((_) async => request);

    final client = SimpleStreamClient('https://127.0.0.1', client: http);
    const index = SimpleStreamIndex(
      datatype: 'image-downloads',
      path: 'streams/v1/images.json',
      products: [],
    );
    final products = await client.getProducts(index);
    verify(http.getUrl(uri)).called(1);
    verify(request.close()).called(1);

    expect(
      products,
      const SimpleProducts(
        contentId: 'images',
        datatype: 'image-downloads',
        format: 'products:1.0',
        products: {
          'ubuntu:jammy:amd64:default': SimpleProduct(
            aliases: [
              'ubuntu/jammy/default',
              'ubuntu/22.04/default',
              'ubuntu/jammy',
              'ubuntu/22.04',
            ],
            arch: 'amd64',
            os: 'Ubuntu',
            release: 'jammy',
            releaseTitle: 'jammy',
            variant: 'default',
            versions: {
              '20220530_08:32': SimpleVersion(
                items: {
                  'lxd.tar.xz': SimpleDownload(
                    ftype: 'lxd.tar.xz',
                    sha256:
                        '11d27ad8e79e2bbbf99d461060551b23aca96fd7ef09ed65f53f5eb5b1058265',
                    size: 676,
                    path:
                        'images/ubuntu/jammy/amd64/default/20220530_08:32/lxd.tar.xz',
                    combinedSha256:
                        '72cad2fb283fa2cc64807ebd874e7c4e3ed667cfc3a7889c02536de590744971',
                    combinedRootxzSha256:
                        '72cad2fb283fa2cc64807ebd874e7c4e3ed667cfc3a7889c02536de590744971',
                    combinedSquashfsSha256:
                        '2ff79bf2006a1d8952cc84fef0a4ff152b79946a8f796e9bd0e451be125b6713',
                    combinedDiskKvmImgSha256:
                        'dddb4c8d1b25ad693722babbc4726da56ccfcb307859b59070206f78547fcd13',
                  ),
                  'root.tar.xz': SimpleDownload(
                    ftype: 'root.tar.xz',
                    sha256:
                        '343d3e0a95c571915133e082bd2a81b3116f5f5355ee125b4e2ba9803d2d016c',
                    size: 106404360,
                    path:
                        'images/ubuntu/jammy/amd64/default/20220530_08:32/rootfs.tar.xz',
                  ),
                  'root.squashfs': SimpleDownload(
                    ftype: 'squashfs',
                    sha256:
                        'f5063894318917b18df7df857bd6e539d4458821a02da1fc89f50d4140b4e53a',
                    size: 117616640,
                    path:
                        'images/ubuntu/jammy/amd64/default/20220530_08:32/rootfs.squashfs',
                  ),
                  'disk.qcow2': SimpleDownload(
                    ftype: 'disk-kvm.img',
                    sha256:
                        'e904f854fb9aa3feccbcf0da6e7ac585578b5adc658c11ca90519357835666d2',
                    size: 258605056,
                    path:
                        'images/ubuntu/jammy/amd64/default/20220530_08:32/disk.qcow2',
                  ),
                  'root.20220529_07:43.vcdiff': SimpleDownload(
                    ftype: 'squashfs.vcdiff',
                    sha256:
                        '0fb4afcf598c573a817038f35dcac9f9224fb07525e07743f17a825fa05bc5fd',
                    size: 742691,
                    path:
                        'images/ubuntu/jammy/amd64/default/20220530_08:32/delta-20220529_07:43.vcdiff',
                    deltaBase: '20220529_07:43',
                  ),
                },
              ),
            },
          ),
        },
      ),
    );
  });

  test('ids', () async {
    const response = {
      'content_id': 'images',
      'datatype': 'image-ids',
      'format': 'products:1.0',
      'products': {
        'com.ubuntu.cloud:server:22.04:amd64': {
          'versions': {
            '20220420': {
              'items': {
                'apne3hs': {
                  'root_store': 'ssd',
                  'virt': 'hvm',
                  'crsn': 'ap-northeast-3',
                  'id': 'ami-0d6dbe860474011f3'
                },
                'eucc1hs': {
                  'root_store': 'ssd',
                  'virt': 'hvm',
                  'crsn': 'eu-central-1',
                  'id': 'ami-015c25ad8763b2f11'
                },
              },
              'pubname': 'ubuntu-jammy-22.04-amd64-server-20220420',
              'label': 'release'
            },
            '20220506': {
              'items': {
                'euww2hs': {
                  'root_store': 'ssd',
                  'virt': 'hvm',
                  'crsn': 'eu-west-2',
                  'id': 'ami-033c8ef001424a6d3'
                },
                'usww1hs': {
                  'root_store': 'ssd',
                  'virt': 'hvm',
                  'crsn': 'us-west-1',
                  'id': 'ami-09596c63850a1bd49'
                }
              },
              'pubname': 'ubuntu-jammy-22.04-amd64-server-20220506',
              'label': 'release'
            },
          },
          'arch': 'amd64',
          'supported': true,
          'release_title': '22.04 LTS',
          'release_codename': 'Jammy Jellyfish',
          'version': '22.04',
          'release': 'jammy',
          'aliases': '22.04,j,jammy',
          'os': 'ubuntu',
          'support_eol': '2027-04-21'
        },
      },
    };

    final http = MockHttpClient();
    final uri = Uri.https('127.0.0.1', '/streams/v1/images.json');
    final request = mockRequest(jsonEncode(response));
    when(http.getUrl(uri)).thenAnswer((_) async => request);

    final client = SimpleStreamClient('https://127.0.0.1', client: http);
    const index = SimpleStreamIndex(
      datatype: 'image-ids',
      path: 'streams/v1/images.json',
      products: [],
    );
    final products = await client.getProducts(index);
    verify(http.getUrl(uri)).called(1);
    verify(request.close()).called(1);

    expect(
      products,
      SimpleProducts(
        contentId: 'images',
        datatype: 'image-ids',
        format: 'products:1.0',
        products: {
          'com.ubuntu.cloud:server:22.04:amd64': SimpleProduct(
            versions: {
              '20220420': const SimpleVersion(
                items: {
                  'apne3hs': SimpleId(
                    rootStore: 'ssd',
                    virt: 'hvm',
                    crsn: 'ap-northeast-3',
                    id: 'ami-0d6dbe860474011f3',
                  ),
                  'eucc1hs': SimpleId(
                    rootStore: 'ssd',
                    virt: 'hvm',
                    crsn: 'eu-central-1',
                    id: 'ami-015c25ad8763b2f11',
                  ),
                },
                pubname: 'ubuntu-jammy-22.04-amd64-server-20220420',
                label: 'release',
              ),
              '20220506': const SimpleVersion(
                items: {
                  'euww2hs': SimpleId(
                    rootStore: 'ssd',
                    virt: 'hvm',
                    crsn: 'eu-west-2',
                    id: 'ami-033c8ef001424a6d3',
                  ),
                  'usww1hs': SimpleId(
                    rootStore: 'ssd',
                    virt: 'hvm',
                    crsn: 'us-west-1',
                    id: 'ami-09596c63850a1bd49',
                  )
                },
                pubname: 'ubuntu-jammy-22.04-amd64-server-20220506',
                label: 'release',
              ),
            },
            arch: 'amd64',
            supported: true,
            releaseTitle: '22.04 LTS',
            releaseCodename: 'Jammy Jellyfish',
            version: '22.04',
            release: 'jammy',
            aliases: ['22.04', 'j', 'jammy'],
            os: 'ubuntu',
            supportEol: DateTime(2027, 4, 21),
          ),
        },
      ),
    );
  });
}
