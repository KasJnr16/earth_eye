import 'package:flutter/material.dart';
import 'package:earth_eye_web/utils/constants/colors.dart';

class UniCircularContainer extends StatelessWidget {
  const UniCircularContainer({
    super.key,
    this.width = 400,
    this.height = 400,
    this.radius = 400,
    this.padding,
    this.child,
    this.backgroundColor = UniColors.white,
    this.margin,
    this.showBorder = false,
    this.borderColor = UniColors.borderPrimary,
  });

  final Widget? child;
  final double? width;
  final double? height;
  final double radius;
  final bool showBorder;
  final Color borderColor;
  final Color backgroundColor;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: margin,
      padding: padding,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        color: backgroundColor,
        border: showBorder ? Border.all(color: borderColor) : null,
      ),
      child: child,
    );
  }
}
