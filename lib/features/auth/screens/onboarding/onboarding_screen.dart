import 'package:earth_eye/features/auth/controllers/onboarding_controller.dart';
import 'package:earth_eye/features/auth/screens/onboarding/widgets/onboarding_dot_navigation.dart';
import 'package:earth_eye/features/auth/screens/onboarding/widgets/onboarding_next_btn.dart';
import 'package:earth_eye/features/auth/screens/onboarding/widgets/onboarding_page.dart';
import 'package:earth_eye/features/auth/screens/onboarding/widgets/onboarding_skip.dart';
import 'package:earth_eye/utils/constants/image_strings.dart';
import 'package:earth_eye/utils/constants/text_string.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnBoardingController());

    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: controller.pageController,
            onPageChanged: controller.updatePageIndicator,
            children: const [
              OnBoardingPage(
                image: EarthImages.onBoardingImage1,
                title: EarthTexts.onBoardingTitle1,
                subTitle: EarthTexts.onBoardingSubTitle1,
              ),
              OnBoardingPage(
                image: EarthImages.onBoardingImage2,
                title: EarthTexts.onBoardingTitle2,
                subTitle: EarthTexts.onBoardingSubTitle2,
              ),
              OnBoardingPage(
                image: EarthImages.onBoardingImage3,
                title: EarthTexts.onBoardingTitle3,
                subTitle: EarthTexts.onBoardingSubTitle3,
              ),
            ],
          ),
          const OnBoaringSkip(),
          const OnBoardingDotNavigation(),
          const OnBoardingNextButton(),
        ],
      ),
    );
  }
}
