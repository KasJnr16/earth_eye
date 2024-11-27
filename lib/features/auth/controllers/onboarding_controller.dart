import 'package:earth_eye/features/auth/screens/login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class OnBoardingController extends GetxController {
  static OnBoardingController get instance => Get.find();

  //vars
  final pageController = PageController();
  Rx<int> currentPageIndex = 0.obs;

  final storage = GetStorage();

  //Updating Current Index when page scroll
  void updatePageIndicator(index) => currentPageIndex.value = index;

  //Jump to the specific dot selected
  void dotNavigationClick(index) {
    currentPageIndex.value = index;
    pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  //Move to next page
  void nextPage() {
    if (currentPageIndex.value == 2) {
      storage.write("isFirstTime", false);

      Get.to(() => const LoginScreen());
    } else {
      int page = currentPageIndex.value + 1;
      pageController.jumpToPage(page);
    }
  }

  //Skip and jump to last page
  void skipPage() {
    Get.to(() => const LoginScreen());
  }
}
