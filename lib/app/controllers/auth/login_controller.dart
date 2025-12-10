import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../services/auth_service.dart';
import '../../routes/app_routes.dart';

class LoginController extends GetxController {
  var email = ''.obs;
  var password = ''.obs;
  var isLoading = false.obs;

  final AuthService _authService = AuthService();

  Future<void> login() async {
    if (email.value.isEmpty || password.value.isEmpty) {
      Get.snackbar('خطأ', 'الرجاء إدخال البريد وكلمة المرور');
      return;
    }
    try {
      isLoading.value = true;
      final user = await _authService.login(email.value, password.value);
      isLoading.value = false;
      if (user != null) {
        // جلب بيانات المستخدم لتحديد الدور
        final model = await _authService.getUserModel(user.uid);
        final role = model?.role ?? 'user';

        // توجيه بسيط بناء على الدور
        if (role == 'superadmin') {
          Get.offAllNamed(Routes.SUPER_ADMIN_DASHBOARD);
        } else if (role == 'admin') {
          Get.offAllNamed(Routes.ADMIN_DASHBOARD);
        } else {
          Get.offAllNamed(Routes.HOME);
        }
      }
    } catch (e) {
      isLoading.value = false;
      Get.snackbar('خطأ', e.toString());
    }
  }

  Future<void> forgotPassword() async {
  if (email.value.isEmpty) {
    Get.snackbar("خطأ", "الرجاء إدخال البريد الإلكتروني");
    return;
  }

  try {
    await _authService.resetPassword(email.value);
    Get.snackbar("تم", "تم إرسال رابط إعادة التعيين إلى بريدك");
  } catch (e) {
    Get.snackbar("خطأ", e.toString());
  }
}

}
