import 'package:earth_eye_web/bindings/general_bindings.dart';
import 'package:earth_eye_web/routes/app_route.dart';
import 'package:earth_eye_web/routes/route.dart';
import 'package:earth_eye_web/utils/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EarthApp extends StatelessWidget {
  const EarthApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      //Defining themes for app
      themeMode: ThemeMode.system,
      theme: UniAppTheme.lightTheme,
      darkTheme: UniAppTheme.darkTheme,

      //dependencies
      initialBinding: GeneralBindings(),

      //routes to widgets for GetX
      getPages: UniAppRoute.pages,
      initialRoute: UniRoutes.login,
      unknownRoute: GetPage(
          name: "/page-not-found",
          page: () =>
              const Scaffold(body: Center(child: Text("Page not found")))),
    );
  }
}
