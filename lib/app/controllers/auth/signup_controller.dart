import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../services/auth_service.dart';
import '../../routes/app_routes.dart';

class SignupController extends GetxController {
  var name = ''.obs;
  var email = ''.obs;
  var password = ''.obs;
  var confirmPassword = ''.obs;
  var isLoading = false.obs;

  final AuthService _authService = AuthService();

  Future<void> signup() async {
    if (email.value.isEmpty || password.value.isEmpty) {
      Get.snackbar('خطأ', 'الرجاء إدخال البريد وكلمة المرور');
      return;
    }
    if (password.value != confirmPassword.value) {
      Get.snackbar('خطأ', 'كلمة المرور والتأكيد غير متطابقين');
      return;
    }

    try {
      isLoading.value = true;
      final user = await _authService.signup(
        email: email.value,
        password: password.value,
        name: name.value.isEmpty ? null : name.value,
      );
      isLoading.value = false;

      if (user != null) {
        Get.snackbar('تم', 'تم إنشاء الحساب بنجاح');
        // بعد التسجيل نودي المستخدم لصفحة onboarding ليحدد اهتماماته
        Get.offAllNamed(Routes.ONBOARDING, arguments: {'uid': user.uid});
      }
    } catch (e) {
      isLoading.value = false;
      Get.snackbar('خطأ', e.toString());
    }
  }
}
