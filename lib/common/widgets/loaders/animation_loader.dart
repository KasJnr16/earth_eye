
import 'package:flutter/material.dart';
import 'package:earth_eye_web/utils/constants/colors.dart';
import 'package:earth_eye_web/utils/constants/sizes.dart';

class UniAnimationLoaderWidget extends StatelessWidget {
  const UniAnimationLoaderWidget({
    super.key,
    required this.text,
    required this.animation,
    this.showAction = false,
    this.actionText,
    this.onActionPressed,
    this.height,
    this.width = 300,
  });

  final String text;
  final String animation;
  final bool showAction;
  final String? actionText;
  final VoidCallback? onActionPressed;
  final double? height, width;

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.all(UniSizes.defaultSpace),
      child: Center(
        child: Column(
          children: [
            // Lottie.asset(animation, width: MediaQuery.of(context).size.width * 0.8),

            Center(
              child: Image.asset(
                // Display the GIF instead of Lottie animation
                animation,
                width: width,
                height: height,
              ),
            ),
            const SizedBox(height: UniSizes.defaultSpace),

            //
            Text(
              text,
              style: textTheme.bodyMedium,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: UniSizes.defaultSpace),

            //
            showAction
                ? SizedBox(
                    width: 250,
                    child: OutlinedButton(
                      style: const ButtonStyle(
                          backgroundColor:
                              WidgetStatePropertyAll(UniColors.dark)),
                      onPressed: onActionPressed,
                      child: Text(
                        actionText!,
                        style:
                            textTheme.bodyMedium!.apply(color: UniColors.light),
                      ),
                    ),
                  )
                : const SizedBox()
          ],
        ),
      ),
    );
  }
}
