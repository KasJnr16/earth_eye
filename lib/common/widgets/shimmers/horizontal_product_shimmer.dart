
import 'package:earth_eye_web/common/widgets/shimmers/shimmer.dart';
import 'package:flutter/material.dart';
import 'package:earth_eye_web/utils/constants/sizes.dart';

class UniHorizontalProductShimmer extends StatelessWidget {
  const UniHorizontalProductShimmer({super.key, this.itemCount = 4});

  final int itemCount;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: UniSizes.spaceBtwSections),
      height: 129,
      child: ListView.separated(
        itemCount: itemCount,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        separatorBuilder: (_, __) =>
            const SizedBox(width: UniSizes.spaceBtwItems),
        itemBuilder: (_, __) => const Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            //image
            UniShimmerEffect(width: 120, height: 120),
            SizedBox(width: UniSizes.spaceBtwItems),

            //text
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: UniSizes.spaceBtwItems / 2),
                UniShimmerEffect(width: 120, height: 15),
                SizedBox(height: UniSizes.spaceBtwItems / 2),
                UniShimmerEffect(width: 80, height: 10),
              ],
            )
          ],
        ),
      ),
    );
  }
}
