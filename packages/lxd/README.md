[![Pub Package](https://img.shields.io/pub/v/lxd.svg)](https://pub.dev/packages/lxd)
[![codecov](https://codecov.io/gh/canonical/lxd.dart/branch/main/graph/badge.svg?token=SIMIT5LCTH)](https://codecov.io/gh/canonical/lxd.dart)

Provides a client to access lxd, which allows you to manage containers on a Linux system.

## Example

```dart
import 'package:lxd/lxd.dart';

var client = LxdClient();

print('Looking for image...');
var image = await client.findRemoteImage('https://cloud-images.ubuntu.com/releases', '20.04');
if (image == null) {
  print("Can't find image");
  return;
}
print('Creating instance...');
var operation = await client.createInstance(image: image);
operation = await client.waitOperation(operation.id);
if (operation.status == 'Success') {
  print('Instance ${operation.instanceNames.first} created.');
} else {
  print('Failed: ${operation.error}');
}

client.close();
```

## Contributing to lxd.dart

We welcome contributions! See the [contribution guide](CONTRIBUTING.md) for more details.
