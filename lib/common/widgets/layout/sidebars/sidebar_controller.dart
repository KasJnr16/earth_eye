
import 'package:get_storage/get_storage.dart';
import 'package:earth_eye_web/routes/route.dart';
import 'package:get/get.dart';
import 'package:earth_eye_web/utils/device/device_utility.dart';

class SidebarController extends GetxController {
  static SidebarController get instance => Get.find();

  final activeItem = UniRoutes.dashboard.obs;
  final hoverItem = "".obs;

  final localStorage = GetStorage();

  SidebarController() {
    _loadActiveItem();
  }

  void _loadActiveItem() {
    activeItem.value =
        localStorage.read<String>('activeRoute') ?? UniRoutes.dashboard;
  }

  void _saveActiveItem(String route) {
    localStorage.write('activeRoute', route);
  }

  void changeActiveItem(String route) {
    activeItem.value = route;
    _saveActiveItem(route);
  }

  void changeHoverItem(String route) {
    if (!isActive(route)) {
      hoverItem.value = route;
    }
  }

  bool isActive(String route) => activeItem.value == route;
  bool isHovering(String route) => hoverItem.value == route;

  void menuOnTap(String route) {
    if (!isActive(route)) {
      //change
      changeActiveItem(route);

      //Close Drawer
      if (UniDeviceUtility.isMobileScreen(Get.context!) ||
          UniDeviceUtility.isTabletScreen(Get.context!)) Get.back();

      //redirect
      Get.toNamed(route);
    }
  }
}
