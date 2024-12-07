import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:earth_eye_web/utils/constants/colors.dart';
import 'package:earth_eye_web/utils/constants/sizes.dart';
import 'package:earth_eye_web/utils/device/device_utility.dart';
import 'package:earth_eye_web/utils/helpers/helper_functions.dart';

class UniSearchContainer extends StatelessWidget {
  const UniSearchContainer({
    super.key,
    required this.text,
    this.icon = Iconsax.search_normal,
    this.showBackground = true,
    this.showBorder = true,
    this.onTap,
    this.padding =
        const EdgeInsets.symmetric(horizontal: UniSizes.defaultSpace),
  });

  final String text;
  final IconData? icon;
  final bool showBackground, showBorder;
  final VoidCallback? onTap;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context);

    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: padding,
        child: Container(
          width: UniDeviceUtility.getScreenWidth(context),
          padding: const EdgeInsets.all(UniSizes.md),
          decoration: BoxDecoration(
            color: showBackground
                ? dark
                    ? UniColors.dark
                    : UniColors.light
                : Colors.transparent,
            borderRadius: BorderRadius.circular(UniSizes.cardRadiusLg),
            border: showBorder ? Border.all(color: UniColors.grey) : null,
          ),
          child: Row(
            children: [
              Icon(icon, color: dark ? UniColors.darkerGrey : Colors.grey),
              const SizedBox(width: UniSizes.spaceBtwItems),
              Text(
                text,
                style: Theme.of(context).textTheme.bodySmall,
              )
            ],
          ),
        ),
      ),
    );
  }
}
