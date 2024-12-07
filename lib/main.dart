import 'package:earth_eye_web/app.dart';
import 'package:earth_eye_web/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:url_strategy/url_strategy.dart';

import 'data/repositories/authentication/authentication_repository.dart';

void main() async {
  //Remove # sign from url
  setPathUrlStrategy();

  //Initialize GETX local Storage
  await GetStorage.init();

  //Initialize Firebase & Authentication Repository
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform)
      .then((_) => Get.put(AuthenticationRepository()));

  runApp(const EarthApp());
}
