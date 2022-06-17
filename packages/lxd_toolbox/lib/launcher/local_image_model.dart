import 'package:async_value/async_value.dart';
import 'package:flutter/foundation.dart';
import 'package:lxd/lxd.dart';
import 'package:meta/meta.dart';
import 'package:safe_change_notifier/safe_change_notifier.dart';

typedef AsyncLxdImageList = AsyncValue<List<LxdImage>>;

class LocalImageModel extends SafeChangeNotifier {
  LocalImageModel();

  LxdClient? _client;

  LxdClient? get client => _client;

  AsyncLxdImageList? _images;

  AsyncLxdImageList? get images => _images;

  @protected
  set images(AsyncLxdImageList? images) {
    if (_images == images) return;
    _images = images;
    notifyListeners();
  }

  Future<void> init(LxdClient? client) async {
    if (client == null) return;
    _client = client;
    images = const AsyncLxdImageList.loading();
    images = await AsyncLxdImageList.guard(() async {
      final fingerprints = await _client!.getImages();
      return Future.wait(fingerprints.map((fp) => _client!.getImage(fp)));
    });
  }

  @override
  void dispose() {
    super.dispose();
    _client?.close();
  }
}
