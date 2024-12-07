import 'package:earth_eye_web/common/widgets/custom_shapes/containers/circular_container.dart';
import 'package:earth_eye_web/common/widgets/custom_shapes/curved_edges/curved_edges_widget.dart';
import 'package:flutter/material.dart';
import 'package:earth_eye_web/utils/constants/colors.dart';

class UniPrimaryHeaderContainer extends StatelessWidget {
  const UniPrimaryHeaderContainer({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return UniCurvedEdgeWidget(
      child: Container(
        color: UniColors.primary,
        padding: const EdgeInsets.all(0),

        //size.isFinite is not true error might occur
        child: Stack(
          children: [
            // the custom shapes at the background
            Positioned(
              top: -150,
              right: -250,
              child: UniCircularContainer(
                backgroundColor: UniColors.textWhite.withOpacity(0.1),
              ),
            ),
            Positioned(
              top: 100,
              right: -300,
              child: UniCircularContainer(
                backgroundColor: UniColors.textWhite.withOpacity(0.1),
              ),
            ),
            child,
          ],
        ),
      ),
    );
  }
}
