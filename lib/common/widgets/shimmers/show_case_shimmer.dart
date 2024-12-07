
import 'package:earth_eye_web/common/widgets/shimmers/box_shimmer.dart';
import 'package:earth_eye_web/common/widgets/shimmers/list_tile_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:earth_eye_web/utils/constants/sizes.dart';

class ShowCaseShimmer extends StatelessWidget {
  const ShowCaseShimmer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        UniListTileShimmer(),
        SizedBox(height: UniSizes.spaceBtwItems),
        UniBoxesShimmer(),
        SizedBox(height: UniSizes.spaceBtwItems)
      ],
    );
  }
}