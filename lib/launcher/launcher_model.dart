import 'dart:async';

import 'package:lxd/lxd.dart';
import 'package:meta/meta.dart';
import 'package:safe_change_notifier/safe_change_notifier.dart';

class LauncherModel extends SafeChangeNotifier {
  final _completer = Completer<LxdInstance?>();

  String? get os => _os;
  String? _os;
  @protected
  set os(String? os) {
    if (_os == os) return;
    _os = os;
    notifyListeners();
  }

  LxdImage? get image => _image;
  LxdImage? _image;
  @protected
  set image(LxdImage? image) {
    if (_image == image) return;
    _image = image;
    notifyListeners();
  }

  Future<LxdInstance?> run() => _completer.future;

  void cancel() => done(null);

  String? next(Object? arguments) {
    if (arguments is LxdImage) {
      image = arguments;
    } else if (arguments is String) {
      os = arguments;
    }
    return null;
  }

  Future<void> done(Object? result) async {
    next(result);
    _completer.complete(result is LxdInstance ? result : null);
  }
}
