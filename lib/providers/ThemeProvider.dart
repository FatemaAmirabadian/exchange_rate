import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider with ChangeNotifier {
  bool _isDarkMode = false;
  bool _isSecondTheme = false;

  ThemeProvider() {
    _loadPreferences();
  }

  bool isDarkMode() => _isDarkMode;

  bool isSecondTheme() => _isSecondTheme;

  ThemeData getTheme() {
    if (_isDarkMode) {
      return ThemeData.dark();
    }
    // else if (_isSecondTheme) {
    //   return ThemeData(
    //     primaryColor: Colors.green,
    //     scaffoldBackgroundColor: Colors.greenAccent,
    //   );
    // }
    else {
      return ThemeData.light();
    }
  }

  void toggleDarkMode(bool value) {
    _isDarkMode = value;
    _savePreferences();
    notifyListeners();
  }

  void toggleSecondTheme(bool value) {
    _isSecondTheme = value;
    _savePreferences();
    notifyListeners();
  }

  void _loadPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _isDarkMode = prefs.getBool('isDarkMode') ?? false;
    _isSecondTheme = prefs.getBool('isSecondTheme') ?? false;
    notifyListeners();
  }

  void _savePreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('isDarkMode', _isDarkMode);
    prefs.setBool('isSecondTheme', _isSecondTheme);
  }
}
