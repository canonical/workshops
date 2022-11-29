import 'package:lxd/lxd.dart';

void main() async {
  var client = LxdClient();

  print('Looking for image...');
  var images = await client.getImages();
  if (images.isEmpty) {
    print("Can't find image");
    return;
  }
  var image = await client.getImage(images.first);
  print('Creating instance...');
  var operation = await client.createInstance(source: image);
  operation = await client.waitOperation(operation.id);
  if (operation.status == 'Success') {
    print('Instance ${operation.resources?['instances']} created.');
  } else {
    print('Failed: ${operation.error}');
  }

  client.close();
}
