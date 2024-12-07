import 'package:earth_eye_web/common/widgets/images/rounded_image.dart';
import 'package:earth_eye_web/common/widgets/shimmers/shimmer.dart';
import 'package:earth_eye_web/features/auth/controllers/user/user_controller.dart';
import 'package:earth_eye_web/utils/constants/enums.dart';
import 'package:earth_eye_web/utils/constants/image_strings.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:get/get.dart';
import 'package:earth_eye_web/utils/constants/colors.dart';
import 'package:earth_eye_web/utils/constants/sizes.dart';
import 'package:earth_eye_web/utils/device/device_utility.dart';

class UniHeader extends StatelessWidget implements PreferredSizeWidget {
  const UniHeader({super.key, this.scaffoldKey});

  //GlobalKey to access the Scaffold state
  final GlobalKey<ScaffoldState>? scaffoldKey;

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;

    return Container(
      decoration: const BoxDecoration(
        color: UniColors.white,
        border: Border(
          bottom: BorderSide(color: UniColors.grey, width: 1),
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: UniSizes.md),
      child: AppBar(
        //Mobile Menu
        leading: !UniDeviceUtility.isDesktopScreen(context)
            ? IconButton(
                onPressed: () => scaffoldKey?.currentState?.openDrawer(),
                icon: const Icon(Iconsax.menu),
              )
            : null,

        //Search Field
        title: UniDeviceUtility.isDesktopScreen(context)
            ? SizedBox(
                width: 400,
                child: TextFormField(
                  decoration: const InputDecoration(
                      prefixIcon: Icon(Iconsax.search_normal),
                      hintText: "Search..."),
                ),
              )
            : null,

        //Actions
        actions: [
          //Search Icon
          if (!UniDeviceUtility.isDesktopScreen(context))
            IconButton(
                onPressed: () {}, icon: const Icon(Iconsax.search_normal)),

          //Notification Icon
          IconButton(onPressed: () {}, icon: const Icon(Iconsax.notification)),
          const SizedBox(width: UniSizes.spaceBtwItems / 2),

          //User Data
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //Image
              Obx(
                () => UniRoundedImage(
                  width: 40,
                  height: 40,
                  padding: 2,
                  imageType: controller.user.value.profilePicture.isNotEmpty
                      ? ImageType.network
                      : ImageType.asset,
                  image: controller.user.value.profilePicture.isNotEmpty
                      ? controller.user.value.profilePicture
                      : UniImages.emptyCart,
                ),
              ),
              const SizedBox(width: UniSizes.spaceBtwItems / 2),

              //Name and Email
              if (!UniDeviceUtility.isMobileScreen(context))
                Obx(
                  () => Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      controller.profileLoading.value
                          ? const UniShimmerEffect(width: 50, height: 13)
                          : Text(controller.user.value.fullName,
                              style: Theme.of(context).textTheme.titleLarge),
                      controller.profileLoading.value
                          ? const UniShimmerEffect(width: 50, height: 13)
                          : Text(controller.user.value.email,
                              style: Theme.of(context).textTheme.labelMedium),
                    ],
                  ),
                )
            ],
          )
        ],
      ),
    );
  }

  @override
  Size get preferredSize =>
      Size.fromHeight(UniDeviceUtility.getAppBarHeight() + 15);
}
