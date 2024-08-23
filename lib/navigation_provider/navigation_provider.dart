// import 'package:flutter/material.dart';
//
// class NavigationProvider extends ChangeNotifier {
//   int screenIndex = 0;
//   int get fetchCurrentScreenIndex {
//     return screenIndex;
//   }
//
//   void updateScreenIndex(int newIndex) {
//     screenIndex = newIndex;
//     notifyListeners();
//   }
// }
import 'package:flutter/cupertino.dart';

class NavigationProvider with ChangeNotifier {
  int _currentScreenIndex = 0;

  int get fetchCurrentScreenIndex => _currentScreenIndex;

  void updateScreenIndex(int index) {
    _currentScreenIndex = index;
    notifyListeners();
  }
}
