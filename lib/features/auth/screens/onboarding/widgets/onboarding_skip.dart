import 'package:earth_eye/features/auth/controllers/onboarding_controller.dart';
import 'package:earth_eye/utils/constants/sizes.dart';
import 'package:earth_eye/utils/device/device_utility.dart';
import 'package:flutter/material.dart';

class OnBoaringSkip extends StatelessWidget {
  const OnBoaringSkip({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: DeviceUtility.getAppBarHeight(),
      right: EarthSizes.defaultSpace,
      child: ElevatedButton(
          onPressed: () => OnBoardingController.instance.skipPage(),
          child: const Text("Skip")),
    );
  }
}
