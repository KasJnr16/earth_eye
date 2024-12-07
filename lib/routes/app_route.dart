import 'package:earth_eye_web/features/auth/screens/Login/login_screen.dart';
import 'package:earth_eye_web/features/auth/screens/signup/signup_screen.dart';
import 'package:earth_eye_web/routes/route.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

class UniAppRoute {
  static final List<GetPage> pages = [
    GetPage(
      name: "/login",
      page: () => const LoginScreen(),
    ),
    GetPage(
      name: UniRoutes.signup,
      page: () => const SignupScreen(),
    ),
    // GetPage(
    //   name: UniRoutes.resetPassword,
    //   page: () => const ResetPasswordScreen(),
    // ),
    // GetPage(
    //     name: UniRoutes.dashboard,
    //     page: () => const DashboardScreen(),
    //     middlewares: [UniRoutesMiddleware()]),
    // GetPage(
    //     name: UniRoutes.media,
    //     page: () => const MediaScreen(),
    //     middlewares: [UniRoutesMiddleware()]),
    // GetPage(
    //   name: UniRoutes.banners,
    //   page: () => const BannersScreen(),
    // ),
    // GetPage(
    //   name: UniRoutes.createBanner,
    //   page: () => const CreateBannerScreen(),
    // ),
    // GetPage(
    //   name: UniRoutes.editBanner,
    //   page: () => const EditBannerScreen(),
    // ),
    // GetPage(
    //   name: UniRoutes.products,
    //   page: () => const ProductsScreen(),
    // ),
    // GetPage(
    //   name: UniRoutes.createProuduct,
    //   page: () => const CreateProductScreen(),
    // ),
    // GetPage(
    //   name: UniRoutes.editProduct,
    //   page: () => const EditProductScreen(),
    // ),
    // GetPage(
    //   name: UniRoutes.categories,
    //   page: () => const CategoriesScreen(),
    // ),
    // GetPage(
    //   name: UniRoutes.editCategory,
    //   page: () => const EditCategoryScreen(),
    // ),
    // GetPage(
    //   name: UniRoutes.createCategory,
    //   page: () => const CreateCategoryScreen(),
    // ),
    // GetPage(
    //   name: UniRoutes.brands,
    //   page: () => const BrandsScreen(),
    // ),
    // GetPage(
    //   name: UniRoutes.editBrands,
    //   page: () => const EditBrandScreen(),
    // ),
    // GetPage(
    //   name: UniRoutes.createBrands,
    //   page: () => const CreateBrandScreen(),
    // ),
    // GetPage(
    //   name: UniRoutes.customers,
    //   page: () => const CustomersScreen(),
    // ),
    // GetPage(
    //   name: UniRoutes.customerDetails,
    //   page: () => const CustomerDetailsScreen(),
    // ),
    // GetPage(
    //   name: UniRoutes.createCustomer,
    //   page: () => const CreateCustomerScreen(),
    // ),
    // GetPage(
    //   name: UniRoutes.orders,
    //   page: () => const OrderScreen(),
    // ),
  ];
}
