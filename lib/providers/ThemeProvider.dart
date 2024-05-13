import 'package:flutter/material.dart';

class ThemeProvider with ChangeNotifier {
  bool _isDarkMode = false;
  bool _isSecondTheme = false;

  ThemeData getTheme() {
    if (_isDarkMode) {
      return ThemeData.dark();
    }
    // else if (_isSecondTheme) {
    //   return ThemeData(primaryColor: Colors.green);
    // }
    else {
      return ThemeData.light();
    }
  }

  bool isDarkMode() => _isDarkMode;

  bool isSecondTheme() => _isSecondTheme;

  void toggleDarkMode(bool value) {
    _isDarkMode = value;
    notifyListeners();
  }

  void toggleSecondTheme(bool value) {
    _isSecondTheme = value;
    notifyListeners();
  }
}
