
import 'package:earth_eye_web/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:earth_eye_web/utils/helpers/helper_functions.dart';

class FormDivder extends StatelessWidget {
  const FormDivder({
    super.key,
    required this.dividerText,
  });

  final String dividerText;

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(
          child: Divider(
              color: dark ? UniColors.darkGrey : UniColors.grey,
              thickness: 0.5,
              indent: 60,
              endIndent: 5),
        ),
        Text(
          dividerText.capitalize!,
          style: Theme.of(context).textTheme.labelMedium,
        ),
        Flexible(
          child: Divider(
              color: dark ? UniColors.darkGrey : UniColors.grey,
              thickness: 0.5,
              indent: 5,
              endIndent: 60),
        ),
      ],
    );
  }
}
