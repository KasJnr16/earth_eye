import 'package:earth_eye/features/auth/controllers/onboarding_controller.dart';
import 'package:earth_eye/utils/constants/colors.dart';
import 'package:earth_eye/utils/constants/sizes.dart';
import 'package:earth_eye/utils/device/device_utility.dart';
import 'package:earth_eye/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingDotNavigation extends StatelessWidget {
  const OnBoardingDotNavigation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = OnBoardingController.instance;
    final dark = HelperFunctions.isDarkMode(context);

    return Positioned(
      bottom: DeviceUtility.getBottomNavigationBarHeight() + 25,
      left: EarthSizes.defaultSpace,
      child: SmoothPageIndicator(
        controller: controller.pageController,
        onDotClicked: controller.dotNavigationClick,
        count: 3,
        effect: ExpandingDotsEffect(
            activeDotColor: dark ? EarthColors.light : EarthColors.dark,
            dotHeight: 6),
      ),
    );
  }
}
