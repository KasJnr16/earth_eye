import 'package:earth_eye/utils/constants/image_strings.dart';
import 'package:earth_eye/utils/constants/sizes.dart';
import 'package:earth_eye/utils/constants/text_string.dart';
import 'package:flutter/material.dart';

class LoginHeader extends StatelessWidget {
  const LoginHeader({
    super.key,
    required this.IsDark,
  });

  final bool IsDark;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image(
          height: 150,
          image: AssetImage(IsDark ? EarthImages.appLogo : EarthImages.google),
        ),
        Text(
          EarthTexts.loginTitle,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        const SizedBox(height: EarthSizes.sm),
        Text(
          EarthTexts.loginSubTitle,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ],
    );
  }
}
