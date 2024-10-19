import 'package:flutter/material.dart';
import 'package:jala_verification/app/utils/colors.dart';

class AppTheme {
  static final appTheme = ThemeData(
    scaffoldBackgroundColor: whiteColor,
    fontFamily: 'Poppins',
    appBarTheme: const AppBarTheme(
      backgroundColor: primaryColor,
      titleTextStyle: TextStyle(
        color: whiteColor,
        fontSize: 18,
        fontFamily: 'Poppins',
        fontWeight: FontWeight.w700,
        letterSpacing: 0.5,
      ),
      iconTheme: IconThemeData(
        color: whiteColor,
      ),
    ),
  );
}