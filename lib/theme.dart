import 'package:flutter/material.dart';

ThemeData customTheme() {
  const Color primaryColor = Color(0xFF567189);
  const Color primaryContainerColor = Color(0xFF7B8FA1);
  const Color secondaryColor = Color(0xFFCFB997);
  const Color secondaryContainerColor = Color(0xFFFAD6A5);
  const Color textWhite = Color(0xFFF7F5EB);
  const Color bgColor = Color(0xFF343F49);

  return ThemeData.dark().copyWith(
    primaryColor: primaryColor,
    backgroundColor: bgColor,
    colorScheme: const ColorScheme.dark().copyWith(
      primary: primaryColor,
      primaryContainer: primaryContainerColor,
      onPrimary: textWhite,
      secondary: secondaryColor,
      secondaryContainer: secondaryContainerColor,
      onSecondary: primaryColor,
      background: bgColor,
    ),
    scaffoldBackgroundColor: bgColor,
    textTheme: const TextTheme(
      headlineLarge: TextStyle(
        fontFamily: "Poppins",
        fontSize: 55,
        fontWeight: FontWeight.w700,
        height: 1,
      ),
      headlineMedium: TextStyle(
        fontFamily: "Poppins",
        fontSize: 30,
        fontWeight: FontWeight.w700,
      ),
      headlineSmall: TextStyle(
        fontFamily: "Poppins",
        fontSize: 20,
        fontWeight: FontWeight.w700,
        height: 1,
      ),
      bodyLarge: TextStyle(
        fontFamily: "Poppins",
        fontSize: 20,
        fontWeight: FontWeight.normal,
      ),
      bodyMedium: TextStyle(
        fontFamily: "Poppins",
        fontSize: 18,
        fontWeight: FontWeight.normal,
      ),
      bodySmall: TextStyle(
        fontFamily: "Poppins",
        fontSize: 16,
        fontWeight: FontWeight.normal,
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: secondaryColor,
      enabledBorder: UnderlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(width: 1.5, color: primaryColor),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(width: 1.5, color: primaryColor),
        borderRadius: BorderRadius.circular(15),
      ),
    ),
  );
}
