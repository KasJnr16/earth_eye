import 'package:earth_eye_web/utils/constants/colors.dart';
import 'package:earth_eye_web/utils/constants/sizes.dart';
import 'package:earth_eye_web/utils/device/device_utility.dart';
import 'package:earth_eye_web/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class UniAppBar extends StatelessWidget implements PreferredSizeWidget {
  const UniAppBar(
      {super.key,
      this.title,
      this.showBackArrow = false,
      this.leadingIcon,
      this.actions,
      this.leadingOnPressed});

  final Widget? title;
  final bool showBackArrow;
  final IconData? leadingIcon;
  final List<Widget>? actions;
  final VoidCallback? leadingOnPressed;

  @override
  Widget build(BuildContext context) {
    final isDark = HelperFunctions.isDarkMode(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: UniSizes.md),
      child: AppBar(
        automaticallyImplyLeading: false,
        leading: showBackArrow
            ? IconButton(
                onPressed: () => Get.back(),
                icon: Icon(Iconsax.arrow_left,
                    color: isDark ? UniColors.white : UniColors.dark))
            : leadingIcon != null
                ? IconButton(
                    onPressed: leadingOnPressed, icon: Icon(leadingIcon))
                : null,
        title: title,
        actions: actions,
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(UniDeviceUtility.getAppBarHeight());
}
