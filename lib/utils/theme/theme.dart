import 'package:earth_eye/utils/constants/colors.dart';
import 'package:earth_eye/utils/theme/custom_themes/appbar_theme.dart';
import 'package:earth_eye/utils/theme/custom_themes/bottom_sheet_theme.dart';
import 'package:earth_eye/utils/theme/custom_themes/checkbox_theme.dart';
import 'package:earth_eye/utils/theme/custom_themes/chip_theme.dart';
import 'package:earth_eye/utils/theme/custom_themes/elevated_button_theme.dart';
import 'package:earth_eye/utils/theme/custom_themes/outlined_button_theme.dart';
import 'package:earth_eye/utils/theme/custom_themes/text_field_theme.dart';
import 'package:earth_eye/utils/theme/custom_themes/text_theme.dart';
import 'package:flutter/material.dart';

class EarthAppTheme {
  EarthAppTheme._();

//light
  static final lightTheme = ThemeData(
      fontFamily: "Poppins",
      useMaterial3: true,
      brightness: Brightness.light,
      primaryColor: EarthColors.primary,
      scaffoldBackgroundColor: Colors.white,
      textTheme: EarthTextTheme.lightTextTheme,
      elevatedButtonTheme: EarthElevatedButtonTheme.lightElevatedButtonTheme,
      appBarTheme: EarthAppBarTheme.lightAppBarTheme,
      checkboxTheme: EarthCheckboxTheme.lightCheckboxTheme,
      bottomSheetTheme: EarthBottomSheetTheme.lightBottomSheetTheme,
      chipTheme: EarthChipTheme.lightChipTheme,
      inputDecorationTheme: EarthTextFormFieldTheme.lightInputDecorationTheme,
      outlinedButtonTheme: EarthOutlineButtonTheme.lightOutlineButtonTheme);

//Dark
  static final darkTheme = ThemeData(
      fontFamily: "Poppins",
      useMaterial3: true,
      brightness: Brightness.dark,
      primaryColor: EarthColors.primary,
      scaffoldBackgroundColor: Colors.white,
      textTheme: EarthTextTheme.darkTextTheme,
      elevatedButtonTheme: EarthElevatedButtonTheme.darkElevatedButtonTheme,
      appBarTheme: EarthAppBarTheme.darkAppBarTheme,
      checkboxTheme: EarthCheckboxTheme.darkCheckboxTheme,
      bottomSheetTheme: EarthBottomSheetTheme.darkBottomSheetTheme,
      chipTheme: EarthChipTheme.darkChipTheme,
      inputDecorationTheme: EarthTextFormFieldTheme.darkInputDecorationTheme,
      outlinedButtonTheme: EarthOutlineButtonTheme.darkOutlineButtonTheme);
}
