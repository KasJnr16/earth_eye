import 'package:earth_eye_web/data/repositories/user/user_repository.dart';
import 'package:earth_eye_web/routes/route.dart';
import 'package:earth_eye_web/utils/exceptions/custom_exceptions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';


class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  //vars
  final deviceStorage = GetStorage();
  final _auth = FirebaseAuth.instance;

  User? get authUser => _auth.currentUser;

  bool get isAuthenticated => _auth.currentUser != null;

  //Called from main on app lunch
  @override
  void onReady() {
    _auth.setPersistence(Persistence.LOCAL);
  }

  //function to show Relevant screen
  void screenRedirect() async {
    //get user
    final user = _auth.currentUser;
    if (user != null) {
      Get.offAllNamed(UniRoutes.dashboard);
    } else {
      Get.offAllNamed(UniRoutes.login);
    }

    //checks if user email is verified
  }

  /*-------------------Email and Password sign up-----------------------*/

  //register
  Future<UserCredential> registerWithEmailAndPassword(
      String email, String password) async {
    try {
      return await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw UniFirebaseAuthException(e.code).message;
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

  //Email Verification
  Future<void> sendEmailVerification() async {
    try {
      await _auth.currentUser?.sendEmailVerification();
    } on FirebaseAuthException catch (e) {
      throw UniFirebaseAuthException(e.code).message;
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

  /*--------------------Social Sigin------------------*/

  Future<UserCredential> loginWithGoogle() async {
    try {
      //Popup to select account
      final GoogleSignInAccount? userAccount = await GoogleSignIn().signIn();

      //Obtain details
      final GoogleSignInAuthentication? googleAuth =
          await userAccount?.authentication;

      //create a new credentials
      final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth?.accessToken, idToken: googleAuth?.idToken);

      //return credentials
      return await _auth.signInWithCredential(credential);
    } on FirebaseAuthException catch (e) {
      throw UniFirebaseAuthException(e.code).message;
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

  /*-------------------Sign in-----------------------*/

  Future<UserCredential> loginWithEmailAndPassword(
      String email, String password) async {
    try {
      return await _auth.signInWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw UniFirebaseAuthException(e.code).message;
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

  /*-------------------Log out----------------------*/

  //logout
  Future<void> logout() async {
    try {
      await FirebaseAuth.instance.signOut();
      Get.offAllNamed(UniRoutes.login);
    } on FirebaseAuthException catch (e) {
      throw UniFirebaseAuthException(e.code).message;
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

  /*-------------------Management---------------------*/

  //Reset Password
  Future<void> sendPasssowrdResetEmail(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      throw UniFirebaseAuthException(e.code).message;
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

  //delete user
  Future<void> deleteAccount() async {
    try {
      //Remove user data from db
      await UserRepository.instance.removeAdminDetails(_auth.currentUser!.uid);
      //Remove user from app
      await _auth.currentUser?.delete();
    } on FirebaseAuthException catch (e) {
      throw UniFirebaseAuthException(e.code).message;
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

  //ReAuthenticate User
  Future<void> reAuthenticateEmailAndPasswordUser(
      String email, String password) async {
    try {
      //create a credential
      AuthCredential credential =
          EmailAuthProvider.credential(email: email, password: password);
      //reAuth
      await _auth.currentUser!.reauthenticateWithCredential(credential);
    } on FirebaseAuthException catch (e) {
      throw UniFirebaseAuthException(e.code).message;
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
