import 'package:earth_eye_web/common/widgets/layout/sidebars/sidebar_controller.dart';
import 'package:earth_eye_web/routes/route.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:earth_eye_web/utils/constants/sizes.dart';

class UniBreadcrumb extends StatelessWidget {
  const UniBreadcrumb({
    super.key,
    required this.heading,
    this.breadcrumbItems,
  });

  final String heading;
  final List<String>? breadcrumbItems;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        //Dashboard link
        InkWell(
          onTap: () {
            SidebarController.instance.changeActiveItem(UniRoutes.dashboard);
            Get.offAllNamed(UniRoutes.dashboard);
          },
          child: Padding(
            padding: const EdgeInsets.all(UniSizes.xs),
            child: Text(
              "Dashboard",
              style: Theme.of(context)
                  .textTheme
                  .bodySmall!
                  .apply(fontWeightDelta: -1),
            ),
          ),
        ),

        //loop thru
        if (breadcrumbItems != null && breadcrumbItems!.isNotEmpty)
          for (int i = 0; i < breadcrumbItems!.length; i++)
            Row(
              children: [
                const Text("/"), //separator
                InkWell(
                  onTap: i == breadcrumbItems!.length - 1
                      ? null
                      : () {
                          SidebarController.instance
                              .changeActiveItem((breadcrumbItems![i]));
                          Get.toNamed(breadcrumbItems![i]);
                        },
                  child: Padding(
                    padding: const EdgeInsets.all(UniSizes.xs),
                    child: Text(
                      formatBreadcrumb(breadcrumbItems![i].toString()),
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall!
                          .apply(fontWeightDelta: -1),
                    ),
                  ),
                )
              ],
            )
      ],
    );
  }
}

String formatBreadcrumb(String s) {
  if (s.startsWith('/')) s = s.substring(1);
  return capitalize(s);
}

String capitalize(String s) {
  return s.isEmpty ? "" : s[0].toUpperCase() + s.substring(1);
}
