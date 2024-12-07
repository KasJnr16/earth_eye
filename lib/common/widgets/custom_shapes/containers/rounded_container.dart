import 'package:flutter/material.dart';
import 'package:earth_eye_web/utils/constants/colors.dart';
import 'package:earth_eye_web/utils/constants/sizes.dart';

class UniRoundedContainer extends StatelessWidget {
  const UniRoundedContainer(
      {super.key,
      this.width,
      this.height,
      this.radius = UniSizes.cardRadiusLg,
      this.child,
      this.showBorder = false,
      this.borderColor = UniColors.borderPrimary,
      this.backgroundColor = UniColors.white,
      this.padding = const EdgeInsets.all(UniSizes.md),
      this.margin,
      this.showShadow = true,
      this.onTap});

  final double? width, height;
  final double radius;
  final Widget? child;
  final bool showBorder;
  final bool showShadow;
  final Color borderColor;
  final Color? backgroundColor;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        padding: padding,
        margin: margin,
        decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(radius),
            border: showBorder ? Border.all(color: borderColor) : null,
            boxShadow: [
              if (showShadow)
                BoxShadow(
                  color: UniColors.grey.withOpacity(0.1),
                  spreadRadius: 5,
                  blurRadius: 8,
                  offset: const Offset(0, 3),
                ),
            ]),
        child: child,
      ),
    );
  }
}
