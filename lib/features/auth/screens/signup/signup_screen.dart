import 'package:earth_eye_web/common/widgets/layout/templates/site_layout.dart';
import 'package:earth_eye_web/features/auth/screens/signup/responsive/signup_desktop_tablet_screen.dart';
import 'package:earth_eye_web/features/auth/screens/signup/responsive/signup_mobile_screen.dart';
import 'package:flutter/material.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const UniSiteTemplate(
      useLayout: false,
      desktop: SignupDesktopTabletScreen(),
      mobile: SignupMobileScreen(),
    );
  }
}
