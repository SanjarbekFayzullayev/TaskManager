import 'package:flutter/foundation.dart';

class MainProvider extends ChangeNotifier {
  void updateList() {
    notifyListeners();
  }
}
