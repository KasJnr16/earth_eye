import 'package:earth_eye_web/common/widgets/loaders/animation_loader.dart';
import 'package:earth_eye_web/common/widgets/loaders/circular_loader.dart';
import 'package:earth_eye_web/utils/constants/colors.dart';
import 'package:earth_eye_web/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UniFullScreenLoader {
  static void openLoadingDialog(String text, String animation) {
    showDialog(
      context: Get.overlayContext!,
      barrierDismissible: false,
      builder: (_) => PopScope(
        canPop: false,
        child: Container(
          color: HelperFunctions.isDarkMode(Get.context!)
              ? UniColors.dark
              : UniColors.white,
          width: double.infinity,
          height: double.infinity,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              UniAnimationLoaderWidget(text: text, animation: animation),
            ],
          ),
        ),
      ),
    );
  }

  static void popUpCircular() {
    Get.defaultDialog(
        title: "",
        onWillPop: () async => false,
        content: const UniCircularLoader(),
        backgroundColor: Colors.transparent);
  }

  static stopLoading() {
    Navigator.of(Get.overlayContext!).pop();
  }
}
