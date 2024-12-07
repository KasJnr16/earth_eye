
import 'package:earth_eye_web/common/widgets/layout/headers/header.dart';
import 'package:earth_eye_web/common/widgets/layout/sidebars/sidebar.dart';
import 'package:flutter/material.dart';

class MobileLayout extends StatelessWidget {
  MobileLayout({super.key, this.body});

  final Widget? body;

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      drawer: const SiderBar(),
      appBar: UniHeader(scaffoldKey: scaffoldKey),
      body: body ?? const SizedBox(),
    );
  }
}
