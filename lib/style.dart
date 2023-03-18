import 'package:flutter/material.dart';

class SCol {
  static Color primary = const Color(0xffFFEC00);
  static Color secondary = const Color(0xff009EE2);
  static Color background = Colors.white;
  static Color onBackground = Colors.black;
  static Color onPrimary = Colors.black;
  static Color onSecondary = Colors.black;

  static Color foreground = Colors.grey[800]!;

  static MaterialColor createMaterialColor(Color color) {
    List strengths = <double>[.05];
    Map<int, Color> swatch = {};
    final int r = color.red, g = color.green, b = color.blue;

    for (int i = 1; i < 10; i++) {
      strengths.add(0.1 * i);
    }
    for (var strength in strengths) {
      final double ds = 0.5 - strength;
      swatch[(strength * 1000).round()] = Color.fromRGBO(
        r + ((ds < 0 ? r : (255 - r)) * ds).round(),
        g + ((ds < 0 ? g : (255 - g)) * ds).round(),
        b + ((ds < 0 ? b : (255 - b)) * ds).round(),
        1,
      );
    }
    return MaterialColor(color.value, swatch);
  }
}

class Style {}
