import 'package:lxd/lxd.dart';

Future<void> main() async {
  final client = LxdClient();

  print('Listening 30s for events...');

  client
      .getEvents(types: {LxdEventType.operation})
      .timeout(const Duration(seconds: 30), onTimeout: (sink) => sink.close())
      .listen((event) => print(event));
}
