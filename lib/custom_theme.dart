import 'package:flutter/material.dart';

class CustomTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      primaryColor: Colors.purple,
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
        primaryColor: Colors.grey[900]
    );
  }
}

