import 'package:flutter/material.dart';

ThemeData buildTheme() {
  const primaryGreen = Color.fromARGB(255, 66, 151, 70);
  const secondaryGreen = Color.fromARGB(255, 52, 119, 55);

  return ThemeData(
    fontFamily: 'Quicksand',
    appBarTheme: const AppBarTheme(
      backgroundColor: secondaryGreen,
      foregroundColor: Colors.white,
    ),
    textTheme: const TextTheme(
      titleLarge: TextStyle(
        fontFamily: 'OpenSans',
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      bodyLarge: TextStyle(fontFamily: 'Quicksand', fontSize: 16),
    ),
    colorScheme: ColorScheme.fromSeed(
      seedColor: primaryGreen,
      primary: primaryGreen,
    ),
  );
}
