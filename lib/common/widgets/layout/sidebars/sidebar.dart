
import 'package:earth_eye_web/common/widgets/images/circular_image.dart';
import 'package:earth_eye_web/common/widgets/layout/sidebars/menu/menu_item.dart';
import 'package:earth_eye_web/utils/constants/enums.dart';
import 'package:earth_eye_web/utils/constants/image_strings.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:earth_eye_web/routes/route.dart';
import 'package:earth_eye_web/utils/constants/colors.dart';
import 'package:earth_eye_web/utils/constants/sizes.dart';

class SiderBar extends StatelessWidget {
  const SiderBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      shape: const BeveledRectangleBorder(),
      child: Container(
        decoration: const BoxDecoration(
          color: UniColors.white,
          border: Border(right: BorderSide(color: UniColors.grey, width: 1)),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              //image
              const UniCircularImage(
                imageType: ImageType.asset,
                width: 100,
                height: 100,
                image: UniImages.darkAppLogo,
                backgroundColor: Colors.transparent,
              ),
              const SizedBox(height: UniSizes.spaceBtwSections),
              Padding(
                padding: const EdgeInsets.all(UniSizes.spaceBtwItems),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "MENU",
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall!
                          .apply(letterSpacingDelta: 1.2),
                    ),
                    const Divider(),

                    //Menu Items
                    const UniMenuItem(
                        route: UniRoutes.dashboard,
                        icon: Iconsax.status,
                        itemName: "Dashboard"),
                    const UniMenuItem(
                        route: UniRoutes.media,
                        icon: Iconsax.image,
                        itemName: "Media"),

                    //Others
                    Text(
                      "Others",
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall!
                          .apply(letterSpacingDelta: 1.2),
                    ),
                    const Divider(),
                    const UniMenuItem(
                        route: UniRoutes.settings,
                        icon: Iconsax.setting,
                        itemName: "Settings"),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
