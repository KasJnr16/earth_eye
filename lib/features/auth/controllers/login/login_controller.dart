// import 'package:earth_eye_web/data/repositories/authentication/authentication_repository.dart';
// import 'package:earth_eye_web/data/repositories/user/user_repository.dart';
// import 'package:earth_eye_web/features/auth/controllers/user/user_controller.dart';
// import 'package:earth_eye_web/features/auth/models/user_model.dart';
// import 'package:earth_eye_web/utils/helpers/network_manager.dart';
// import 'package:earth_eye_web/utils/popups/fullscreen_loader.dart';
// import 'package:earth_eye_web/utils/popups/loaders.dart';
// import 'package:get/get.dart';
// import 'package:get_storage/get_storage.dart';

// import 'package:earth_eye_web/utils/constants/enums.dart';
// import 'package:earth_eye_web/utils/constants/image_strings.dart';
// import 'package:flutter/material.dart';

// class LoginController extends GetxController {
//   static LoginController get instance => Get.find();
//   final userController = Get.put(UserController());

//   String gif = UniImages.loading;

//   //vars
//   final email = TextEditingController();
//   final password = TextEditingController();
//   final rememberMe = false.obs;
//   final hidePaswword = true.obs;

//   GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

//   //storage
//   final localStorage = GetStorage();

//   @override
//   void onInit() {
//     //auto load creds
//     email.text = localStorage.read("REMEMBER_ME_EMAIL") ?? "";
//     password.text = localStorage.read("REMEMBER_ME_PASSWORD") ?? "";
//     super.onInit();
//   }

//   registerAdmin() async {
//     try {
//       UniFullScreenLoader.openLoadingDialog(
//           "Registering Admin Account...", gif);

//       //check internet Connectivity
//       final isConnected = await NetworkManager.instance.isConnected();
//       if (!isConnected) {
//         UniFullScreenLoader.stopLoading();
//         return;
//       }

//       //register admin
//       await AuthenticationRepository.instance
//           .registerWithEmailAndPassword("admin@admin.com", "Admin@123");

//       final userRepository = Get.put(UserRepository());
//       userRepository.saveUserDetails(
//         UserModel(
//             id: AuthenticationRepository.instance.authUser!.uid,
//             email: "admin@admin.com",
//             firstName: "Uni",
//             lastName: "Admin",
//             role: AppRole.admin,
//             createdAt: DateTime.now()),
//       );

//       //Remove loader
//       UniFullScreenLoader.stopLoading();

//       //redirct
//       AuthenticationRepository.instance.screenRedirect();
//     } catch (e) {
//       UniFullScreenLoader.stopLoading();
//       UniLoaders.errorSnackBar(title: "Oh Snap!", message: e.toString());
//     }
//   }

//   loginWithEmailAndPassword() async {
//     try {
//       //start loading
//       UniFullScreenLoader.openLoadingDialog("Logging you in...", gif);

//       //check internet Connectivity
//       final isConnected = await NetworkManager.instance.isConnected();
//       if (!isConnected) {
//         UniFullScreenLoader.stopLoading();
//         return;
//       }

//       //form validation
//       if (!loginFormKey.currentState!.validate()) {
//         UniFullScreenLoader.stopLoading();
//         return;
//       }

//       //Check
//       if (rememberMe.value) {
//         localStorage.write("REMEMBER_ME_EMAIL", email.text.trim());
//         localStorage.write("REMEMBER_ME_PASSWORD", password.text.trim());
//       }

//       //login user
//       await AuthenticationRepository.instance
//           .loginWithEmailAndPassword(email.text.trim(), password.text.trim());

//       final user = await UserController.instance.fetchUserDetails();

//       //Remove loader
//       UniFullScreenLoader.stopLoading();

//       //if user is not admin, logout and return
//       if (user.role != AppRole.admin) {
//         await AuthenticationRepository.instance.logout();
//         UniLoaders.errorSnackBar(
//             title: "Not Authorized",
//             message:
//                 "You do not have the right privillages. Contact Admin Provider");
//       } else {
//         AuthenticationRepository.instance.screenRedirect();
//       }
//     } catch (e) {
//       UniFullScreenLoader.stopLoading();
//       UniLoaders.errorSnackBar(title: "Oh Snap!", message: e.toString());
//     }
//   }
  
// }
