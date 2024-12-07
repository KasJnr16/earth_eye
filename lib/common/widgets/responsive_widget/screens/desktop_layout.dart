
import 'package:earth_eye_web/common/widgets/layout/headers/header.dart';
import 'package:earth_eye_web/common/widgets/layout/sidebars/sidebar.dart';
import 'package:flutter/material.dart';

class DesktopLayout extends StatelessWidget {
  DesktopLayout({super.key, this.body});

  final Widget? body;

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          const Expanded(child: SiderBar()),
          Expanded(
            flex: 5,
            child: Column(
              children: [
                //Header
                const UniHeader(),

                //Body
                Expanded(child: body ?? const SizedBox())
              ],
            ),
          )
        ],
      ),
    );
  }
}
