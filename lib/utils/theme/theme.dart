import 'package:earth_eye_web/utils/theme/custom_themes/appbar_theme.dart';
import 'package:earth_eye_web/utils/theme/custom_themes/bottom_sheet_theme.dart';
import 'package:earth_eye_web/utils/theme/custom_themes/checkbox_theme.dart';
import 'package:earth_eye_web/utils/theme/custom_themes/chip_theme.dart';
import 'package:earth_eye_web/utils/theme/custom_themes/elevated_button_theme.dart';
import 'package:earth_eye_web/utils/theme/custom_themes/outlined_button_theme.dart';
import 'package:earth_eye_web/utils/theme/custom_themes/text_field_theme.dart';
import 'package:flutter/material.dart';

import 'custom_themes/text_theme.dart';

class UniAppTheme {
  UniAppTheme._();

//light
  static final lightTheme = ThemeData(
      fontFamily: "Poppins",
      useMaterial3: true,
      brightness: Brightness.light,
      primaryColor: Colors.blue,
      scaffoldBackgroundColor: Colors.white,
      textTheme: UniTextTheme.lightTextTheme,
      elevatedButtonTheme: UniElevatedButtonTheme.lightElevatedButtonTheme,
      appBarTheme: UniAppBarTheme.lightAppBarTheme,
      checkboxTheme: UniCheckboxTheme.lightCheckboxTheme,
      bottomSheetTheme: UniBottomSheetTheme.lightBottomSheetTheme,
      chipTheme: UniChipTheme.lightChipTheme,
      inputDecorationTheme: UniTextFormFieldTheme.lightInputDecorationTheme,
      outlinedButtonTheme: UniOutlineButtonTheme.lightOutlineButtonTheme);

//Dark
  static final darkTheme = ThemeData(
    fontFamily: "Poppins",
    useMaterial3: true,
    brightness: Brightness.dark,
    primaryColor: Colors.blue,
    scaffoldBackgroundColor: Colors.black,
    textTheme: UniTextTheme.darkTextTheme,
    elevatedButtonTheme: UniElevatedButtonTheme.darkElevatedButtonTheme,
    appBarTheme: UniAppBarTheme.darkAppBarTheme,
    checkboxTheme: UniCheckboxTheme.darkCheckboxTheme,
    bottomSheetTheme: UniBottomSheetTheme.darkBottomSheetTheme,
    chipTheme: UniChipTheme.darkChipTheme,
    inputDecorationTheme: UniTextFormFieldTheme.darkInputDecorationTheme,
    outlinedButtonTheme: UniOutlineButtonTheme.darkOutlineButtonTheme,
  );
}
