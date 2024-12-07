import 'package:flutter/material.dart';
import 'package:earth_eye_web/utils/constants/colors.dart';
import 'package:earth_eye_web/utils/constants/sizes.dart';
import 'package:earth_eye_web/utils/helpers/helper_functions.dart';

class UniCircularIcon extends StatelessWidget {
  const UniCircularIcon({
    super.key,
    this.width,
    this.height,
    this.size = UniSizes.lg,
    required this.icon,
    this.color,
    this.backgroundColor,
    this.onPressed,
  });

  final double? width, height, size;
  final IconData icon;
  final Color? color;
  final Color? backgroundColor;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    final isDark = HelperFunctions.isDarkMode(context);

    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: backgroundColor != null
            ? backgroundColor!
            : isDark
                ? UniColors.black.withOpacity(0.9)
                : UniColors.white.withOpacity(0.5),
      ),
      child: IconButton(
          onPressed: onPressed,
          icon: Icon(
            icon,
            color: color,
            size: size,
          )),
    );
  }
}
