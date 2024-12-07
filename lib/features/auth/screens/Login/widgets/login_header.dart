import 'package:earth_eye_web/utils/constants/image_strings.dart';
import 'package:earth_eye_web/utils/constants/sizes.dart';
import 'package:earth_eye_web/utils/constants/text_string.dart';
import 'package:flutter/material.dart';

class FormHeader extends StatelessWidget {
  const FormHeader({
    super.key,
    required this.title,
    required this.subTitle,
  });

  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //Logo
          Image.asset(UniImages.lightAppLogo, height: 150, width: 150),
          const SizedBox(width: UniSizes.spaceBtwItems),

          //Texts
          Text(title, style: Theme.of(context).textTheme.headlineLarge),
          Text(subTitle, style: Theme.of(context).textTheme.bodyMedium),
        ],
      ),
    );
  }
}
