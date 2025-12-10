import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:sports_app/app/services/auth_service.dart';
import '../../routes/app_routes.dart';

class AuthCheckController extends GetxController {
  final _auth = FirebaseAuth.instance;
  final _service = AuthService();

  @override
  void onReady() {
    super.onReady();
    _check();
  }

  Future<void> _check() async {
    final user = _auth.currentUser;

    if (user == null) {
      Get.offAllNamed(Routes.LOGIN);
      return;
    }

    final model = await _service.getUserModel(user.uid);

    if (model == null) {
      Get.offAllNamed(Routes.LOGIN);
      return;
    }

    if (model.isDisabled) {
      Get.snackbar("تنبيه", "تم تعطيل حسابك من قبل الإدارة");
      await _auth.signOut();
      Get.offAllNamed(Routes.LOGIN);
      return;
    }

    // Navigate based on role
    switch (model.role) {
      case "superadmin":
        Get.offAllNamed(Routes.SUPER_ADMIN_DASHBOARD);
        break;
      case "admin":
        Get.offAllNamed(Routes.ADMIN_DASHBOARD);
        break;
      default:
        Get.offAllNamed(Routes.HOME);
    }
  }
}
