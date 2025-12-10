import 'package:get/get.dart';
import 'package:sports_app/app/bindings/admin_binding.dart';
import 'package:sports_app/app/controllers/admin/add_news_controller.dart';
import 'package:sports_app/app/controllers/auth/auth_check_controller.dart';
import 'package:sports_app/app/views/admin/add_news_view.dart';
import 'package:sports_app/app/views/admin/admin_dashboard_view.dart';
import 'package:sports_app/app/views/news/news_feed_view.dart';
import 'package:sports_app/app/views/splash/splash_view.dart';
import '../views/auth/login_view.dart';
import '../views/auth/signup_view.dart';
import '../views/auth/onboarding_view.dart';
import '../views/home/home_view.dart';
import '../bindings/auth_binding.dart';

import 'app_routes.dart';

class AppPages {
  AppPages._();
  static const initial = Routes.LOGIN;

  static final routes = [
    GetPage(
      name: Routes.LOGIN,
      page: () => const LoginView(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: Routes.SIGNUP,
      page: () => const SignupView(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: Routes.ONBOARDING,
      page: () => const OnboardingView(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: Routes.HOME,
      page: () => const HomeView(),
     // binding: HomeBinding(),
    ),
    GetPage(
  name: Routes.SPLASH,
  page: () => const SplashView(),
  binding: BindingsBuilder(() {
    Get.put(AuthCheckController());
  }),
),

GetPage(
  name: Routes.ADMIN_DASHBOARD,
 page: () => const AdminDashboardView(),
  binding: AdminBinding(),
  middlewares: [
    // يمكنك ترك RoleMiddleware('admin') أو حتى استبعاده لأن الـ Binding يتحقق
    // RoleMiddleware('admin'),
  ],
),

GetPage(
  name: Routes.ADD_NEWS,
  page: () => const AddNewsView(),
  binding: BindingsBuilder(() {
    Get.put(AddNewsController());
  }),
),
GetPage(
  name: Routes.NEWS_FEED,
  page: () => NewsFeedView(),
),



    // أضف بقية الصفحات (admin/superadmin) لاحقاً
  ];
}
