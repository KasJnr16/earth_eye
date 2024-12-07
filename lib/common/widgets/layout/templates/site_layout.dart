
import 'package:earth_eye_web/common/widgets/responsive_widget/responsive_widget.dart';
import 'package:earth_eye_web/common/widgets/responsive_widget/screens/desktop_layout.dart';
import 'package:earth_eye_web/common/widgets/responsive_widget/screens/mobile_layout.dart';
import 'package:earth_eye_web/common/widgets/responsive_widget/screens/tablet_layout.dart';
import 'package:flutter/material.dart';

class UniSiteTemplate extends StatelessWidget {
  const UniSiteTemplate({
    super.key,
    this.desktop,
    this.tablet,
    this.mobile,
    this.useLayout = true,
  });

  final Widget? desktop, tablet, mobile;
  final bool useLayout;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: UniResponsiveWidget(
        desktop:
            useLayout ? DesktopLayout(body: desktop) : desktop ?? Container(),
        tablet: useLayout
            ? TabletLayout(body: tablet ?? desktop)
            : tablet ?? desktop ?? Container(),
        mobile: useLayout
            ? MobileLayout(body: mobile ?? desktop)
            : mobile ?? desktop ?? Container(),
      ),
    );
  }
}
