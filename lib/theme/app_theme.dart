import 'package:flutter/material.dart';
import 'package:todo/theme/app_colors.dart';
import 'package:todo/theme/app_styles.dart';

ThemeData lightTheme() => ThemeData(
      textTheme: TextTheme(
        titleLarge: AppStyles.lightPoppins70018,
        bodyMedium: AppStyles.lightRoboto40012,
        titleMedium: AppStyles.lightInter40020,
      ),

      // colorScheme
      // Light colorScheme to background of container
      colorScheme: const ColorScheme(
        brightness: Brightness.light,
        primary: AppColors.primaryLightColor,
        secondary: AppColors.secondaryLightColor,
        onPrimary: AppColors.textLightColor,
        onSecondary: Colors.white,
        surface: Colors.transparent,
        onSurface: Colors.blueAccent,
        error: AppColors.secondaryLightColor,
        onError: AppColors.secondaryLightColor,
      ),

      // AppBar
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.primaryLightColor,
        titleTextStyle: AppStyles.lightPoppins70022,
      ),

      // scaffoldBackgroundColor
      scaffoldBackgroundColor: AppColors.backgroundLightColor,

      // floatingActionButtonTheme
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: AppColors.primaryLightColor,
      ),

      // bottomNavigationBarTheme
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        selectedItemColor: AppColors.primaryLightColor,
        unselectedItemColor: AppColors.bottomNavigationBarIconColor,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.shifting,
      ),

      // bottomSheetTheme
      bottomSheetTheme: const BottomSheetThemeData(
        backgroundColor: AppColors.secondaryDarkColor,
      ),
    );
ThemeData darkTheme() => ThemeData(
      // textTheme
      textTheme: TextTheme(
        titleLarge: AppStyles.darkPoppins70018,
        bodyMedium: AppStyles.darkRoboto40012,
        titleMedium: AppStyles.darkInter40020,
      ),

      // colorScheme
      // colorScheme to background of container
      colorScheme: const ColorScheme(
        brightness: Brightness.dark,
        primary: AppColors.primaryDarkColor,
        secondary: AppColors.secondaryDarkColor,
        onPrimary: AppColors.textDarkColor,
        onSecondary: Color.fromARGB(255, 30, 37, 49),
        surface: Colors.transparent,
        onSurface: Colors.white,
        error: AppColors.secondaryDarkColor,
        onError: AppColors.secondaryDarkColor,
      ),

      // AppBar
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.primaryDarkColor,
        titleTextStyle: AppStyles.darkPoppins70022,
      ),

      // scaffoldBackgroundColor
      scaffoldBackgroundColor: AppColors.backgroundDarkColor,

      // floatingActionButtonTheme
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: AppColors.primaryDarkColor,
      ),

      // bottomNavigationBarTheme
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        selectedItemColor: AppColors.primaryDarkColor,
        unselectedItemColor: AppColors.bottomNavigationBarIconColor,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.shifting,
      ),

      // bottomSheetTheme
      bottomSheetTheme: const BottomSheetThemeData(
        backgroundColor: AppColors.secondaryLightColor,
      ),
    );
