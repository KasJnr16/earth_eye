import 'package:earth_eye_web/data/repositories/authentication/authentication_repository.dart';
import 'package:earth_eye_web/data/repositories/user/user_repository.dart';
import 'package:earth_eye_web/features/auth/models/user_model.dart';
import 'package:earth_eye_web/features/auth/screens/Login/login_screen.dart';
import 'package:earth_eye_web/utils/helpers/network_manager.dart';
import 'package:earth_eye_web/utils/popups/fullscreen_loader.dart';
import 'package:earth_eye_web/utils/popups/loaders.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import 'package:earth_eye_web/utils/constants/image_strings.dart';
import 'package:flutter/material.dart';
import 'package:earth_eye_web/utils/constants/sizes.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();

  final userRepository = Get.put(UserRepository());

  final hidePassword = false.obs;
  final imageUploading = false.obs;
  final profileLoading = false.obs;
  Rx<UserModel> user = UserModel.empty().obs;

  final verifyEmail = TextEditingController();
  final verifyPassword = TextEditingController();
  GlobalKey<FormState> reAuthFormKey = GlobalKey<FormState>();

  final _authInstance = AuthenticationRepository.instance;

  @override
  void onInit() {
    super.onInit();
    fetchUserDetails();
  }

  //get user
  Future<UserModel> fetchUserDetails() async {
    try {
      profileLoading.value = true;
      var user = await userRepository.fetchAdminDetails();
      this.user.value = user;
      profileLoading.value = false;
      return user;
    } catch (e) {
      profileLoading.value = false;
      UniLoaders.errorSnackBar(
          title: "Something went wrong.", message: e.toString());
      return user(UserModel.empty());
    }
  }

  //Delete Account Warning
  void deleteAccountWarningPopup() {
    Get.defaultDialog(
      contentPadding: const EdgeInsets.all(UniSizes.md),
      title: "Delete Account",
      middleText:
          "Are you sure you want to delete your account permanently? This action is not reversible.",
      confirm: ElevatedButton(
        onPressed: () async => deleteUserAccount(),
        style: ElevatedButton.styleFrom(
            backgroundColor: Colors.red,
            side: const BorderSide(color: Colors.red)),
        child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: UniSizes.lg),
          child: Text("Delete"),
        ),
      ),
      cancel: OutlinedButton(
        onPressed: () => Navigator.of(Get.overlayContext!).pop(),
        child: const Text("Cancel"),
      ),
    );
  }

  void logoutWarningPopUp() {
    Get.defaultDialog(
      contentPadding: const EdgeInsets.all(UniSizes.md),
      title: "Logout Account",
      middleText: "Are you sure you want to logout your account?",
      confirm: ElevatedButton(
        onPressed: () async => _authInstance.logout(),
        style: ElevatedButton.styleFrom(
            backgroundColor: Colors.red,
            side: const BorderSide(color: Colors.red)),
        child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: UniSizes.lg),
          child: Text("Logout"),
        ),
      ),
      cancel: OutlinedButton(
        onPressed: () => Navigator.of(Get.overlayContext!).pop(),
        child: const Text("Cancel"),
      ),
    );
  }

  //Delete User Account
  Future<void> deleteUserAccount() async {
    try {
      UniFullScreenLoader.openLoadingDialog("Processing...", UniImages.loading);

      final provider =
          _authInstance.authUser!.providerData.map((e) => e.providerId).first;

      if (provider.isNotEmpty) {
        //re verify
        if (provider == "google.com") {
          await _authInstance.loginWithGoogle();
          await _authInstance.deleteAccount();
          UniFullScreenLoader.stopLoading();
          Get.offAll(() => const LoginScreen());
        } else if (provider == 'password') {
          UniFullScreenLoader.stopLoading();
          // Get.to(() => const ReAuthLoginForm());
        }
      }
    } catch (e) {
      UniFullScreenLoader.stopLoading();
      UniLoaders.warningSnackBar(title: "Oh Snap!", message: e.toString());
    }
  }

  //reAuthUser
  Future<void> reAuthenticateEmailAndPasswordUser() async {
    try {
      UniFullScreenLoader.openLoadingDialog("Processing...", UniImages.loading);

      //check internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        UniFullScreenLoader.stopLoading();
        return;
      }

      if (!reAuthFormKey.currentState!.validate()) {
        UniFullScreenLoader.stopLoading();
        return;
      }

      await _authInstance.reAuthenticateEmailAndPasswordUser(
          verifyEmail.text.trim(), verifyPassword.text.trim());
      await _authInstance.deleteAccount();

      UniFullScreenLoader.stopLoading();
      Get.offAll(() => const LoginScreen());
    } catch (e) {
      UniFullScreenLoader.stopLoading();
      UniLoaders.warningSnackBar(title: "Oh Snap!", message: e.toString());
    }
  }

  //Upload Profile Picture
  uploadUserProfilePicture() async {
    try {
      final image = await ImagePicker().pickImage(
          source: ImageSource.gallery,
          imageQuality: 70,
          maxHeight: 512,
          maxWidth: 512);

      if (image != null) {
        imageUploading.value = true;
        //upload image and return path
        final imageUrl =
            await userRepository.uploadImage("Users/Images/Profile/", image);

        //update userRecord
        Map<String, dynamic> json = {"ProfilePicture": imageUrl};
        await userRepository.updateAdminSingleField(json);

        //passing data to Rx<UserModel>
        user.value.profilePicture = imageUrl;
        user.refresh();

        UniLoaders.successSnackBar(
            title: "Congratulations",
            message: "Your Profile Image has been updated!");
      }
    } catch (e) {
      UniLoaders.warningSnackBar(title: "Oh Snap!", message: e.toString());
    } finally {
      imageUploading.value = false;
    }
  }
}
