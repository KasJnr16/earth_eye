import 'package:earth_eye_web/data/repositories/authentication/authentication_repository.dart';
import 'package:earth_eye_web/routes/route.dart';
import 'package:flutter/src/widgets/navigator.dart';
import 'package:get/get.dart';

class UniRoutesMiddleware extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    return AuthenticationRepository.instance.isAuthenticated
        ? null
        : const RouteSettings(name: UniRoutes.login);
  }
}
