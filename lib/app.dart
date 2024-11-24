import 'package:earth_eye/features/auth/screens/onboarding/onboarding_screen.dart';
import 'package:earth_eye/utils/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      themeMode: ThemeMode.system,
      darkTheme: EarthAppTheme.darkTheme,
      theme: EarthAppTheme.lightTheme,
      home: const OnBoardingScreen(),
    );
  }
}
