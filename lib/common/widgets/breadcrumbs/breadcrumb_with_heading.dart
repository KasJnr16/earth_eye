import 'package:earth_eye_web/common/widgets/appbar/page_heading.dart';
import 'package:earth_eye_web/common/widgets/breadcrumbs/breadcrumb.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:earth_eye_web/utils/constants/sizes.dart';

class UniBreadcrumbWithHeading extends StatelessWidget {
  const UniBreadcrumbWithHeading(
      {super.key,
      required this.heading,
      this.breadcrumbItems,
      this.returnToPreviousScreen = false});

  final String heading;
  final List<String>? breadcrumbItems;
  final bool returnToPreviousScreen;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //Breadcrumb trail
        UniBreadcrumb(heading: heading, breadcrumbItems: breadcrumbItems),
        const SizedBox(height: UniSizes.sm),

        //Heading of the page
        Row(
          children: [
            if (returnToPreviousScreen)
              IconButton(
                  onPressed: () => Get.back(),
                  icon: const Icon(Iconsax.arrow_left)),
            if (returnToPreviousScreen)
              const SizedBox(width: UniSizes.spaceBtwItems),
            UniPageHeading(heading: heading)
          ],
        )
      ],
    );
  }
}
