import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:earth_eye_web/data/repositories/authentication/authentication_repository.dart';
import 'package:earth_eye_web/features/auth/models/user_model.dart';
import 'package:earth_eye_web/utils/exceptions/custom_exceptions.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';


class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();

  final FirebaseFirestore _db = FirebaseFirestore.instance;
  final _authRepository = AuthenticationRepository.instance;

  //save user
  Future<void> saveUserDetails(UserModel user) async {
    try {
      await _db.collection("Users").doc(user.id).set(user.toJson());
    } on FirebaseException catch (e) {
      throw UniFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw UniFormatException(code: "Invalid_format").message;
    } on PlatformException catch (e) {
      throw UniPlatformException(e.code).message;
    } catch (e) {
      throw e.toString();
    }
  }

  Future<UserModel> fetchAdminDetails() async {
    try {
      final documentSnapshot = await _db
          .collection("Users")
          .doc(_authRepository.authUser?.uid)
          .get();
      return UserModel.fromSnapshot(documentSnapshot);
    } on FirebaseException catch (e) {
      throw UniFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw UniFormatException(code: "Invalid_format").message;
    } on PlatformException catch (e) {
      throw UniPlatformException(e.code).message;
    } catch (e) {
      throw e.toString();
    }
  }

  Future<void> updateAdminDetails(UserModel updateUser) async {
    try {
      await _db
          .collection("Users")
          .doc(updateUser.id)
          .update(updateUser.toJson());
    } on FirebaseException catch (e) {
      throw UniFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw UniFormatException(code: "Invalid_format").message;
    } on PlatformException catch (e) {
      throw UniPlatformException(e.code).message;
    } catch (e) {
      throw e.toString();
    }
  }

  Future<void> updateAdminSingleField(Map<String, dynamic> json) async {
    try {
      await _db
          .collection("Users")
          .doc(_authRepository.authUser?.uid)
          .update(json);
    } on FirebaseException catch (e) {
      throw UniFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw UniFormatException(code: "Invalid_format").message;
    } on PlatformException catch (e) {
      throw UniPlatformException(e.code).message;
    } catch (e) {
      throw e.toString();
    }
  }

  Future<void> removeAdminDetails(String userId) async {
    try {
      await _db.collection("Users").doc(userId).delete();
    } on FirebaseException catch (e) {
      throw UniFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw UniFormatException(code: "Invalid_format").message;
    } on PlatformException catch (e) {
      throw UniPlatformException(e.code).message;
    } catch (e) {
      throw e.toString();
    }
  }

  //Upload any Image
  Future<String> uploadImage(String path, XFile image) async {
    try {
      //creating image reference
      final ref = FirebaseStorage.instance.ref(path).child(image.name);

      //Stores image form device in the the ref
      await ref.putFile(File(image.path));

      //returns image as a network image
      final url = await ref.getDownloadURL();

      return url;
    } on FirebaseException catch (e) {
      throw UniFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw UniFormatException(code: "Invalid_format").message;
    } on PlatformException catch (e) {
      throw UniPlatformException(e.code).message;
    } catch (e) {
      throw e.toString();
    }
  }
}
