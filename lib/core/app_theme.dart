import 'package:flutter/material.dart';
import 'package:posts_app_clean/core/app_colors.dart';
import 'package:posts_app_clean/core/app_text_styles.dart';

class AppThemes {
  // Light theme
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: AppColors.primaryColor,
    textTheme: AppTextStyles.lightTextTheme,
    appBarTheme: const AppBarTheme(
        color: AppColors.primaryColor, //Color(0xff303030)
        centerTitle: true),
    textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
            foregroundColor:
                MaterialStateProperty.all(AppColors.lightGreyColor))),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
        foregroundColor: AppColors.lightGreyColor,
        backgroundColor: AppColors.primaryColor),
    inputDecorationTheme: const InputDecorationTheme(
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.primaryColor)),
        floatingLabelStyle: TextStyle(color: AppColors.primaryColor),
        border: OutlineInputBorder()),
    elevatedButtonTheme: const ElevatedButtonThemeData(
        style: ButtonStyle(
            backgroundColor: MaterialStatePropertyAll(AppColors.primaryColor))),
  );

  // Dark theme
  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: AppColors.darkColor,
    scaffoldBackgroundColor: AppColors.darkColor,
    textTheme: AppTextStyles.darkTextTheme,
    appBarTheme: const AppBarTheme(
        color: AppColors.darkColor, //Color(0xff303030)
        centerTitle: true),
    textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
            foregroundColor:
                MaterialStateProperty.all(AppColors.lightGreyColor),
            elevation: MaterialStateProperty.all(0.0))),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
        foregroundColor: AppColors.lightGreyColor,
        backgroundColor: AppColors.darkColor),
    inputDecorationTheme: const InputDecorationTheme(
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.primaryColor)),
        floatingLabelStyle: TextStyle(color: AppColors.lightGreyColor),
        border: OutlineInputBorder()),
    elevatedButtonTheme: const ElevatedButtonThemeData(
        style: ButtonStyle(
            backgroundColor: MaterialStatePropertyAll(AppColors.primaryColor))),
  );
}


//  floatingActionButtonTheme: const FloatingActionButtonThemeData(
//         backgroundColor: AppColors.primaryColor,
//         foregroundColor: AppColors.lightGreyColor),
    // appBarTheme: const AppBarTheme(
    //     color: AppColors.darkColor, //Color(0xff303030)
    //     iconTheme: IconThemeData(color: AppColors.lightGreyColor),
    //     centerTitle: true),
    // inputDecorationTheme: const InputDecorationTheme(
    //   focusedBorder: OutlineInputBorder(
    //       borderSide: BorderSide(color: AppColors.primaryColor)),
    //   floatingLabelStyle: TextStyle(color: AppColors.primaryColor),
    //   border: OutlineInputBorder(),
    // ),
//     elevatedButtonTheme: ElevatedButtonThemeData(
//       style: ButtonStyle(
//         backgroundColor: MaterialStateProperty.all(AppColors.darkColor),
//         elevation: MaterialStateProperty.all(0.0),
//         shape: MaterialStateProperty.all(RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(10.0),
//         )),
//       ),
//     ),