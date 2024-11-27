import 'package:earth_eye/common/styles/spacing_style.dart';
import 'package:earth_eye/features/auth/screens/login/widgets/login_header.dart';
import 'package:earth_eye/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final IsDark = HelperFunctions.isDarkMode(context);

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: SpacingStyle.paddingWithAppBarHeight,
          child: Column(
            children: [
              LoginHeader(IsDark: IsDark),
              const Column(
                children: [
                  
                ]
              )
            ],
          ),
        ),
      ),
    );
  }
}
