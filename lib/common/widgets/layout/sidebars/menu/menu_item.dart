
import 'package:flutter/material.dart';
import 'package:earth_eye_web/common/widgets/layout/sidebars/sidebar_controller.dart';
import 'package:get/get.dart';
import 'package:earth_eye_web/utils/constants/colors.dart';
import 'package:earth_eye_web/utils/constants/sizes.dart';

class UniMenuItem extends StatelessWidget {
  const UniMenuItem({
    super.key,
    required this.route,
    required this.icon,
    required this.itemName,
    this.action
  });

  final String route;
  final IconData icon;
  final String itemName;
  final VoidCallback? action;

  @override
  Widget build(BuildContext context) {
    final menuController = Get.put(SidebarController());

    return InkWell(
      onTap: action ?? () => menuController.menuOnTap(route),
      onHover: (hovering) => hovering
          ? menuController.changeHoverItem(route)
          : menuController.changeHoverItem(""),
      child: Obx(
        () => Padding(
          padding: const EdgeInsets.symmetric(vertical: UniSizes.xs),
          child: Container(
            decoration: BoxDecoration(
              color: menuController.isHovering(route) ||
                      menuController.isActive(route)
                  ? UniColors.primary
                  : Colors.transparent,
              borderRadius: BorderRadius.circular(UniSizes.cardRadiusMd),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                //Icon
                Padding(
                  padding: const EdgeInsets.only(
                    left: UniSizes.lg,
                    top: UniSizes.md,
                    bottom: UniSizes.md,
                    right: UniSizes.md,
                  ),
                  child: Icon(
                    icon,
                    color: menuController.isActive(route) ||
                            menuController.isHovering(route)
                        ? UniColors.white
                        : UniColors.darkGrey,
                    size: 22,
                  ),
                ),

                //Text
                if (menuController.isHovering(route) ||
                    menuController.isActive(route))
                  Flexible(
                    child: Text(
                      itemName,
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .apply(color: UniColors.white),
                    ),
                  )
                else
                  Flexible(
                    child: Text(
                      itemName,
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .apply(color: UniColors.darkerGrey),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
