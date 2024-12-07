import 'package:earth_eye_web/utils/exceptions/custom_exceptions.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class UnicloudHelperFuctions {
  //Check for single record
  static Widget? checkingSingleRecordState<T>(
      AsyncSnapshot<T> snapshot, Widget? loader) {
    if (snapshot.connectionState == ConnectionState.waiting) {
      return loader ?? const Center(child: CircularProgressIndicator());
    }

    if (!snapshot.hasData || snapshot.data == null) {
      return const Center(child: Text("No Data Found!"));
    }

    if (snapshot.hasError) {
      return const Center(child: Text("Something went wrong."));
    }

    return null;
  }

  //check for multiple records
  static Widget? checkingMultipleRecordState<T>(
      {required AsyncSnapshot<List<T>> snapshot,
      Widget? loader,
      Widget? error,
      Widget? nothingFound}) {
    if (snapshot.connectionState == ConnectionState.waiting) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: loader ??
                const Column(
                  children: [
                    // UniShimmerEffect(width: double.infinity, height: 100),
                    // SizedBox(height: UniSizes.spaceBtwItems),
                    // UniShimmerEffect(width: double.infinity, height: 100),
                  ],
                ),
          ),
        ),
      );
    }

    if (!snapshot.hasData || snapshot.data == null || snapshot.data!.isEmpty) {
      return nothingFound ?? const Center(child: Text("No Data Found!"));
    }

    if (snapshot.hasError) {
      return error ?? const Center(child: Text("Something went wrong."));
    }
    return null;
  }

  //Create a reference with an initial file path and name and retrieve the download URL.
  static Future<String> getURLFromFilePathAndName(String path) async {
    try {
      if (path.isEmpty) return "";
      final ref = FirebaseStorage.instance.ref().child(path);
      final url = await ref.getDownloadURL();
      return url;
    } on FirebaseException catch (e) {
      throw UniFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw UniPlatformException(e.code).message;
    } catch (e) {
      throw "Something went wrong";
    }
  }
}
