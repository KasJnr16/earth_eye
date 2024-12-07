
// class RouteObserver extends GetObserver {
//   //used when a route is selected from the sidebar
//   @override
//   void didPop(Route route, Route? previousRoute) {
//     final sidebarController = Get.put(SidebarController());

//     if (previousRoute != null) {
//       //Check the route name and update the active item in the sidebar accordingly
//       for (var routeName in UniRoutes.sideMenuItems) {
//         if (previousRoute.settings.name == routeName) {
//           sidebarController.activeItem.value = routeName;
//         }
//       }
//     }
//   }

//   @override
//   void didPush(Route? route, Route? previousRoute) {
//     final sidebarController = Get.put(SidebarController());

//     if (route != null) {
//       //Check the route name and update the active item in the sidebar accordingly
//       for (var routeName in UniRoutes.sideMenuItems) {
//         if (route.settings.name == routeName) {
//           sidebarController.activeItem.value = routeName;
//         }
//       }
//     }
//   }
// }
