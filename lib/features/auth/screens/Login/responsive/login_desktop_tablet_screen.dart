import 'package:earth_eye_web/common/widgets/layout/templates/login_template_desktop_tablet.dart';
import 'package:earth_eye_web/features/auth/screens/Login/widgets/login_form.dart';
import 'package:earth_eye_web/features/auth/screens/Login/widgets/login_header.dart';
import 'package:earth_eye_web/utils/constants/sizes.dart';
import 'package:earth_eye_web/utils/constants/text_string.dart';
import 'package:flutter/material.dart';

class LoginDesktopTabletScreen extends StatelessWidget {
  const LoginDesktopTabletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const LoginTemplateDesktopTablet(
      child: Column(
        children: [
          //Form header
          FormHeader(
            title: UniTexts.loginTitle,
            subTitle: UniTexts.loginSubTitle,
          ),

          SizedBox(height: UniSizes.spaceBtwSections),

          //form
          LoginForm(),
        ],
      ),
    );
  }
}
