// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:iconsax/iconsax.dart';
// import 'package:unisell_admin_panel/common/widgets/custom_shapes/containers/circular_container.dart';
// import 'package:unisell_admin_panel/common/widgets/custom_shapes/containers/rounded_container.dart';
// import 'package:unisell_admin_panel/common/widgets/custom_shapes/curved_edges/curved_edges_widget.dart';
// import 'package:unisell_admin_panel/common/widgets/images/circular_image.dart';
// import 'package:unisell_admin_panel/common/widgets/shimmers/shimmer.dart';
// import 'package:unisell_admin_panel/utils/constants/colors.dart';
// import 'package:unisell_admin_panel/utils/constants/image_strings.dart';
// import 'package:unisell_admin_panel/utils/constants/sizes.dart';
// import 'package:unisell_admin_panel/utils/device/device_utility.dart';
// import 'package:unisell_admin_panel/utils/helpers/helper_functions.dart';

// class SocialButtons extends StatelessWidget {
//   const SocialButtons({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     final controller = Get.put(LoginController());
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         Container(
//           decoration: BoxDecoration(
//               border: Border.all(color: UniColors.grey),
//               borderRadius: BorderRadius.circular(100)),
//           child: IconButton(
//               onPressed: () => controller.googleSignIn(),
//               icon: const Image(
//                 width: UniSizes.iconMd,
//                 height: UniSizes.iconMd,
//                 image: AssetImage(UniImages.google),
//               )),
//         )
//       ],
//     );
//   }
// }
