import 'package:earth_eye/features/auth/controllers/onboarding_controller.dart';
import 'package:earth_eye/utils/constants/colors.dart';
import 'package:earth_eye/utils/constants/sizes.dart';
import 'package:earth_eye/utils/device/device_utility.dart';
import 'package:earth_eye/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class OnBoardingNextButton extends StatelessWidget {
  const OnBoardingNextButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context);

    return Positioned(
      right: EarthSizes.defaultSpace,
      bottom: DeviceUtility.getBottomNavigationBarHeight(),
      child: ElevatedButton(
          onPressed: () => OnBoardingController.instance.nextPage(),
          style: ElevatedButton.styleFrom(
              backgroundColor: dark ? EarthColors.black : EarthColors.primary,
              shape: const CircleBorder()),
          child: const Icon(Iconsax.arrow_right_3)),
    );
  }
}
