import 'package:flutter/material.dart';

class UIProvider extends ChangeNotifier {
  int _index = 0;
  set index(int index) {
    _index = index;
    print(_index);
    notifyListeners();
  }

  int get index {
    return _index;
  }
}
