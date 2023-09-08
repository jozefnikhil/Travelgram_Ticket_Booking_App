import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode themeMode = ThemeMode.light;

  bool get isDarkMode => themeMode == ThemeMode.dark;

  void toggleTheme(bool isOff) {
    themeMode = isOff ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }
}

class Themeclass {
  static ThemeData lighttheme = ThemeData(
    appBarTheme: const AppBarTheme(
        color: Colors.white,
        elevation: 0,
        titleTextStyle: TextStyle(color: Colors.black, fontSize: 24)),
    primaryColor: ThemeData.light().scaffoldBackgroundColor,
    colorScheme: const ColorScheme.light().copyWith(
      primary: const Color.fromARGB(255, 0, 0, 0),
      secondary: const Color.fromARGB(0, 0, 0, 0),
      background: Colors.white,
    ),
    iconTheme: const IconThemeData(
      color: Colors.black,
    ),
  );

  static ThemeData darktheme = ThemeData(
    appBarTheme: const AppBarTheme(
      elevation: 0,
    ),
    primaryColor: ThemeData.dark().scaffoldBackgroundColor,
    colorScheme: const ColorScheme.dark().copyWith(
        primary: const Color.fromARGB(255, 255, 255, 255),
        secondary: const Color.fromARGB(255, 65, 64, 64),
        background: Colors.black),
    iconTheme: const IconThemeData(color: Colors.white),
  );
}

// Themeclass _themeclass = Themeclass();
