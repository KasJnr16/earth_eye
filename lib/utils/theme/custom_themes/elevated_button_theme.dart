import 'package:earth_eye/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class EarthElevatedButtonTheme {
  EarthElevatedButtonTheme._();

  static final lightElevatedButtonTheme = ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
          elevation: 0,
          foregroundColor: Colors.white,
          backgroundColor: EarthColors.primary,
          disabledForegroundColor: Colors.grey,
          disabledBackgroundColor: Colors.grey,
          side: const BorderSide(color: EarthColors.primary),
          padding: const EdgeInsets.symmetric(vertical: 18),
          textStyle: const TextStyle(
              fontSize: 16, color: Colors.white, fontWeight: FontWeight.w600),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))));

  static final darkElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
          elevation: 0,
          foregroundColor: Colors.white,
          backgroundColor: EarthColors.primary,
          disabledForegroundColor: Colors.grey,
          disabledBackgroundColor: Colors.grey,
          side: const BorderSide(color: EarthColors.primary),
          padding: const EdgeInsets.symmetric(vertical: 18),
          textStyle: const TextStyle(
              fontSize: 16, color: Colors.white, fontWeight: FontWeight.w600),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)))
  );
}
