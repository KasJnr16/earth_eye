
import 'package:earth_eye_web/common/widgets/text/brand_title_text.dart';
import 'package:earth_eye_web/utils/constants/enums.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:earth_eye_web/utils/constants/colors.dart';
import 'package:earth_eye_web/utils/constants/sizes.dart';

class BrandTitleWithVerifiedIcon extends StatelessWidget {
  const BrandTitleWithVerifiedIcon({
    super.key,
    required this.title,
    this.maxLines = 1,
    this.textColor,
    this.iconColor = UniColors.primary,
    this.textAlign = TextAlign.center,
    this.brandTextSize = TextSizes.small,
  });

  final String title;
  final int maxLines;
  final Color? textColor, iconColor;
  final TextAlign? textAlign;
  final TextSizes brandTextSize;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Flexible(
          child: BrandTitleText(
              textAlign: textAlign,
              title: title,
              color: textColor,
              maxLines: maxLines,
              brandTextSize: brandTextSize),
        ),
        const SizedBox(width: UniSizes.xs),
        Icon(
          Iconsax.verify5,
          color: iconColor,
          size: UniSizes.iconXs,
        )
      ],
    );
  }
}
