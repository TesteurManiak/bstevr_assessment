import 'package:flutter/material.dart';

class MyThemes {
  static final _baseDark = ThemeData.dark();
  static final _baseLight = ThemeData.light();

  static ThemeData get dark {
    final _dark = _baseDark.copyWith();
    return _dark;
  }

  static ThemeData get light {
    final _light = _baseLight.copyWith(
      appBarTheme: _baseLight.appBarTheme.copyWith(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        titleTextStyle: TextStyle(color: Colors.black),
      ),
      tabBarTheme: _baseLight.tabBarTheme.copyWith(
        labelStyle: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
        labelPadding: const EdgeInsets.all(8),
      ),
      scaffoldBackgroundColor: Colors.grey[200],
    );
    return _light;
  }
}
