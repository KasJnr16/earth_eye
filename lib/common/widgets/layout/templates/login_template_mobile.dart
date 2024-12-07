
import 'package:flutter/material.dart';
import 'package:earth_eye_web/utils/constants/sizes.dart';

class LoginTemplateMobile extends StatelessWidget {
  const LoginTemplateMobile({
    super.key,
    required this.child,
  });

  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(UniSizes.defaultSpace),
          child: child,
        ),
      ),
    );
  }
}
