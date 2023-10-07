import 'package:flutter/material.dart';

class AppTheme {
  final int selectedColor;
  final bool darkMode;

  static const Color _customColor = Color(0xFF5611D4);

  final List<Color> _colorThemes = [
    _customColor,
    Colors.blue,
    Colors.teal,
    Colors.green,
    Colors.yellow,
    Colors.orange,
    Colors.pink,
  ];

  AppTheme({this.darkMode = false, this.selectedColor = 0});

  ThemeData theme() {
    return ThemeData(
      useMaterial3: true,

      // Loop through colors without Index out of range or any other assertion
      colorSchemeSeed: _colorThemes[selectedColor % _colorThemes.length],

      brightness: darkMode ? Brightness.dark : Brightness.light,
    );
  }
}
