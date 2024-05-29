import 'package:flutter/material.dart';

class AppColors {
  static const primaryColor = Color(0xff0e537b);
  static const mainColor = Color(0xff0e537b);
  static const lightGreyColor = Color(0xffF4F6FF);

  static const darkColor = Color(0xff202b3f);
  static const lessdarkColor = Color(0xff424242);
  static const greyColor = Color(0xff6a7081);
  static const starColor = Color(0xfffae263);

  // Color to Material Color
  static MaterialColor createMaterialColor(Color color) {
    List strengths = <double>[0.05];
    final swatch = <int, Color>{};
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
