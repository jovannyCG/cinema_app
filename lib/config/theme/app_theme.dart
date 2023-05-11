import 'package:flutter/material.dart';

const colorList = [
  Colors.blue,
  Colors.teal,
  Colors.green,
  Colors.red,
  Colors.purple,
  Colors.deepPurple,
  Colors.orange,
  Colors.pinkAccent,
];

class AppTheme {
  final int selectedColor;
  final bool isDarkmode;

  AppTheme({this.isDarkmode = false, this.selectedColor = 0})
      : assert(selectedColor >= 0, ' Selected color must be greater than 0'),
        assert(selectedColor <= colorList.length - 1,
            ' Selected color must be less or equal than ${colorList.length}');

  ThemeData getTheme() => ThemeData(
      useMaterial3: true,
      brightness: isDarkmode ? Brightness.dark : Brightness.light,
      colorSchemeSeed: Colors.blue,
      appBarTheme: const AppBarTheme(centerTitle: true));

  AppTheme copyWith({int? selectedColor, bool? isDarkmode}) => AppTheme(
        selectedColor: selectedColor ?? this.selectedColor,
        isDarkmode: isDarkmode ?? this.isDarkmode,
      );
}
