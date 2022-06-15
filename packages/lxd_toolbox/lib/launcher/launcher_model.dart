import 'package:lxd/lxd.dart';
import 'package:safe_change_notifier/safe_change_notifier.dart';

class LauncherModel extends SafeChangeNotifier {
  String? _selectedOs;
  LxdImage? _selectedImage;

  bool get hasSelection => _selectedOs != null && _selectedImage != null;

  String? get selectedOs => _selectedOs;
  void selectOs(String? value) {
    if (_selectedOs == value) return;
    _selectedOs = value;
    notifyListeners();
  }

  LxdImage? get selectedImage => _selectedImage;
  void selectImage(LxdImage? value) {
    if (_selectedImage == value) return;
    _selectedImage = value;
    notifyListeners();
  }
}
