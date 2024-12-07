
import 'package:earth_eye_web/common/styles/spacing_styles.dart';
import 'package:flutter/material.dart';
import 'package:earth_eye_web/utils/constants/colors.dart';
import 'package:earth_eye_web/utils/constants/sizes.dart';

class LoginTemplateDesktopTablet extends StatelessWidget {
  const LoginTemplateDesktopTablet({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: UniColors.softGrey,
      body: Center(
        child: SizedBox(
          width: 550,
          child: SingleChildScrollView(
            child: Container(
              padding: UniSpacingStyle.paddingWithAppBarHeight,
              decoration: BoxDecoration(
                  color: UniColors.white,
                  borderRadius: BorderRadius.circular(UniSizes.cardRadiusLg)),
              child: child,
            ),
          ),
        ),
      ),
    );
  }
}
