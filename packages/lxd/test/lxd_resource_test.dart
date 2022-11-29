import 'package:lxd/lxd.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import 'lxd_http.dart';

void main() {
  test('get resources', () async {
    const response = {
      'cpu': {'architecture': 'arm64', 'sockets': []},
      'memory': {'used': 4125806592, 'total': 17179869184},
      'gpu': {
        'cards': [
          {
            'driver': 'i915',
            'driver_version': '5.8.0-36-generic',
            'vendor': 'Intel Corporation',
            'vendor_id': '8086'
          }
        ]
      },
      'network': {
        'cards': [
          {
            'driver': 'atlantic',
            'driver_version': '5.8.0-36-generic',
            'vendor': 'Aquantia Corp.',
            'vendor_id': '1d6a'
          }
        ]
      },
      'storage': {
        'disks': [
          {
            'id': 'nvme0n1',
            'model': 'INTEL SSDPEKKW256G7',
            'serial': 'BTPY63440ARH256D',
            'size': 256060514304,
            'type': 'nvme'
          }
        ]
      },
      'usb': {
        'devices': [
          {
            'bus_address': 1,
            'device_address': 3,
            'product': 'Hermon USB hidmouse Device',
            'product_id': '2221',
            'speed': 12,
            'vendor': 'ATEN International Co., Ltd',
            'vendor_id': '0557'
          }
        ]
      },
      'pci': {
        'devices': [
          {
            'driver': 'mgag200',
            'driver_version': '5.8.0-36-generic',
            'pci_address': '0000:07:03.0',
            'product': 'MGA G200eW WPCM450',
            'product_id': '0532',
            'vendor': 'Matrox Electronics Systems Ltd.',
            'vendor_id': '102b'
          }
        ]
      },
      'system': {
        'uuid': 'SYSTEM-UUID',
        'vendor': 'SYSTEM-VENDOR',
        'product': 'SYSTEM-PRODUCT',
        'family': 'SYSTEM-FAMILY',
        'version': '1.0',
        'sku': 'SYSTEM-SKU',
        'serial': 'SYSTEM-SERIAL',
        'type': 'physical',
        'firmware': {
          'date': '10/08/2021',
          'vendor': 'FIRMWARE-VENDOR',
          'version': '1.0'
        },
        'chassis': {
          'serial': 'CHASSIS-SERIAL',
          'type': 'Notebook',
          'vendor': 'CHASSIS-VENDOR',
          'version': '1.0'
        },
        'motherboard': {
          'product': 'MOTHERBOARD-PRODUCT',
          'serial': 'MOTHERBOARD-SERIAL',
          'vendor': 'MOTHERBOARD-VENDOR',
          'version': '1.0'
        }
      }
    };

    final http = mockHttpClient();
    final uri = unixDomainUrl('/1.0/resources', {});
    final request = mockResponse(response);
    when(http.openUrl('GET', uri)).thenAnswer((_) async => request);

    final client = LxdClient(client: http);
    final resources = await client.getResources();
    verify(http.openUrl('GET', uri)).called(1);
    verify(request.close()).called(1);

    expect(resources.cpu.architecture, equals('arm64'));
    expect(resources.memory.used, equals(4125806592));
    expect(resources.memory.total, equals(17179869184));
    expect(resources.system.uuid, equals('SYSTEM-UUID'));
    expect(resources.system.firmware.date, equals('10/08/2021'));
    expect(resources.system.firmware.vendor, equals('FIRMWARE-VENDOR'));
    expect(resources.system.firmware.version, equals('1.0'));
    expect(resources.system.chassis.serial, equals('CHASSIS-SERIAL'));
    expect(resources.system.chassis.type, equals('Notebook'));
    expect(resources.system.chassis.vendor, equals('CHASSIS-VENDOR'));
    expect(resources.system.chassis.version, equals('1.0'));
    expect(resources.system.motherboard.product, equals('MOTHERBOARD-PRODUCT'));
    expect(resources.system.motherboard.serial, equals('MOTHERBOARD-SERIAL'));
    expect(resources.system.motherboard.vendor, equals('MOTHERBOARD-VENDOR'));
    expect(resources.system.motherboard.version, equals('1.0'));
  });
}
