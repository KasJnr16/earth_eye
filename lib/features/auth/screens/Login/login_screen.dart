import 'package:earth_eye_web/common/widgets/layout/templates/site_layout.dart';
import 'package:earth_eye_web/features/auth/screens/Login/responsive/login_desktop_tablet_screen.dart';
import 'package:earth_eye_web/features/auth/screens/Login/responsive/login_mobile_screen.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const UniSiteTemplate(
      useLayout: false,
      desktop: LoginDesktopTabletScreen(),
      mobile: LoginMobileScreen(),
    );
  }
}
