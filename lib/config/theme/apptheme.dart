import 'package:flutter/material.dart';

const List<Color> colors = [
  Colors.amber,
  Colors.teal,
  Colors.deepPurple,
  Colors.lime,
  Colors.indigo,
  Colors.orange,
  Colors.pink,
];

class AppTheme {
  final int selectedColor;

  AppTheme({this.selectedColor = 0})
      : assert(selectedColor >= 0 && selectedColor < colors.length);

  ThemeData getTheme() =>
      ThemeData(useMaterial3: true, colorSchemeSeed: colors[selectedColor]);
}
