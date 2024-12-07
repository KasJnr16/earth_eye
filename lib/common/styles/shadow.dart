import 'package:earth_eye_web/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class UniShadowStyle {
  static final verticalProductShadow = BoxShadow(
      color: UniColors.darkGrey.withOpacity(0.1),
      blurRadius: 50,
      spreadRadius: 7,
      offset: const Offset(0, 2));

  static final horizontalProductShadow = BoxShadow(
      color: UniColors.darkGrey.withOpacity(0.1),
      blurRadius: 50,
      spreadRadius: 7,
      offset: const Offset(0, 2));
}
