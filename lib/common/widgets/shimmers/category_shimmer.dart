
import 'package:earth_eye_web/common/widgets/shimmers/shimmer.dart';
import 'package:flutter/material.dart';
import 'package:earth_eye_web/utils/constants/sizes.dart';

class UniCategoryShimmer extends StatelessWidget {
  const UniCategoryShimmer({super.key, this.itemCount = 6});

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.separated(
          shrinkWrap: true,
          itemCount: itemCount,
          scrollDirection: Axis.horizontal,
          separatorBuilder: (_, __) =>
              const SizedBox(width: UniSizes.spaceBtwItems),
          itemBuilder: (_, __) {
            return const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //image Shimmer
                UniShimmerEffect(width: 55, height: 55, radius: 55),
                SizedBox(height: UniSizes.spaceBtwItems / 2),

                //Text Shimmer
                UniShimmerEffect(width: 55, height: 8)
              ],
            );
          }),
    );
  }
}
