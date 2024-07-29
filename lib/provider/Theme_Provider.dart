import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeData currentTheme;

  ThemeProvider(this.currentTheme);

  void setTheme(ThemeData themeData) {
    currentTheme = themeData;

    notifyListeners();
  }
}

final lightTheme = ThemeData(
  primarySwatch: Colors.blue,
  brightness: Brightness.light,
);

final darkTheme = ThemeData(
  primarySwatch: Colors.blue,
  secondaryHeaderColor: Colors.white,
  brightness: Brightness.dark,
);
