import 'package:flutter/material.dart';
import 'package:perla_test/core/constants/colors/app_colors.dart';
import 'package:sizer/sizer.dart';

class AppTheme {
  static final lightTheme = ThemeData.light().copyWith(
    brightness: Brightness.light,
    primaryColor: AppColors.purple,
    textTheme: TextTheme(
      displayLarge: TextStyle(
        fontSize: 15.sp,
        color: AppColors.purple,
        fontWeight: FontWeight.w600,
      ),
      displayMedium: TextStyle(fontSize: 12.5.sp, color: AppColors.darkGrey),
      displaySmall: TextStyle(fontSize: 12.5.sp, color: AppColors.purple),
      bodySmall: TextStyle(fontSize: 12.5.sp, color: AppColors.black),
      bodyLarge: TextStyle(
        fontSize: 11.sp,
        color: AppColors.black,
        fontWeight: FontWeight.w300,
      ),
      bodyMedium: TextStyle(fontSize: 11.5.sp, color: AppColors.white),
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.white,
      elevation: 0,
      iconTheme: const IconThemeData(color: AppColors.black),
      toolbarTextStyle: TextStyle(
        color: AppColors.black,
        fontSize: 14.sp,
        fontWeight: FontWeight.bold,
      ),
    ),
    scaffoldBackgroundColor: AppColors.white,
    inputDecorationTheme: InputDecorationTheme(
      iconColor: AppColors.darkGrey,
      hintStyle: const TextStyle(color: AppColors.darkGrey),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: AppColors.greyAccent),
      ),
      suffixIconColor: AppColors.purple,
      prefixIconColor: AppColors.darkGrey,
      filled: true,
      fillColor: AppColors.greyAccent,
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: AppColors.greyAccent, width: 1),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: AppColors.red, width: 1.6),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: AppColors.red, width: 1),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: AppColors.purple, width: 1.6),
      ),
      labelStyle: const TextStyle(color: AppColors.purple),
      errorStyle: const TextStyle(color: AppColors.red),
      counterStyle: const TextStyle(color: AppColors.black),
      isDense: true,
      helperStyle: const TextStyle(color: AppColors.black),
      suffixStyle: const TextStyle(color: AppColors.black),
      prefixStyle: const TextStyle(color: AppColors.black),
    ),
    buttonTheme: const ButtonThemeData(
      buttonColor: AppColors.purple,
    ),
    snackBarTheme: SnackBarThemeData(
      backgroundColor: AppColors.purple.withOpacity(0.8),
      contentTextStyle: const TextStyle(color: AppColors.white),
      actionTextColor: AppColors.white,
    ),
  );

  static final darkTheme = ThemeData.dark().copyWith(
    brightness: Brightness.dark,
    primaryColor: AppColors.purple,
    textTheme: TextTheme(
      displayLarge: TextStyle(
        fontSize: 15.sp,
        color: AppColors.white,
        fontWeight: FontWeight.w600,
      ),
      bodySmall: TextStyle(fontSize: 12.5.sp, color: AppColors.white),
      displayMedium: TextStyle(fontSize: 12.5.sp, color: AppColors.white),
      displaySmall: TextStyle(fontSize: 12.5.sp, color: AppColors.purple),
      bodyLarge: TextStyle(fontSize: 11.sp, color: AppColors.white),
      bodyMedium: TextStyle(fontSize: 11.sp, color: AppColors.black),
    ),
    scaffoldBackgroundColor: AppColors.black,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.black,
      elevation: 0,
      iconTheme: const IconThemeData(color: Colors.white),
      toolbarTextStyle: TextStyle(
        color: AppColors.white,
        fontSize: 14.sp,
        fontWeight: FontWeight.bold,
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      iconColor: AppColors.darkGrey,
      hintStyle: const TextStyle(color: AppColors.darkGrey),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: AppColors.greyAccent),
      ),
      suffixIconColor: AppColors.purple,
      prefixIconColor: AppColors.darkGrey,
      filled: true,
      fillColor: AppColors.greyAccent,
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: AppColors.greyAccent, width: 1),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: AppColors.red, width: 1.6),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: AppColors.red, width: 1),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: AppColors.purple, width: 1.6),
      ),
      isDense: true,
    ),
    buttonTheme: const ButtonThemeData(
      buttonColor: AppColors.purple,
    ),
    snackBarTheme: const SnackBarThemeData(
      backgroundColor: AppColors.darkGrey,
      contentTextStyle: TextStyle(color: AppColors.white),
      actionTextColor: AppColors.purple,
    ),
  );
}
