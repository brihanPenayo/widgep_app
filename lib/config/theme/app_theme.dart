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
  final bool darkMode;

  AppTheme({this.selectedColor = 0, this.darkMode = false})
      : assert(selectedColor >= 0 && selectedColor < colors.length);

  ThemeData theme() {
    return ThemeData(
        useMaterial3: true,
        brightness: darkMode ? Brightness.dark : Brightness.light,
        colorSchemeSeed: colors[selectedColor],
        appBarTheme: const AppBarTheme(
          centerTitle: true,
        ));
  }

  AppTheme copyWith({
    int? selectedColor,
    bool? darkMode,
  }) {
    return AppTheme(
        selectedColor: selectedColor ?? this.selectedColor,
        darkMode: darkMode ?? this.darkMode);
  }
}
