// lib/app/bindings/admin_binding.dart
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:sports_app/app/services/auth_service.dart';
import '../controllers/admin/admin_dashboard_controller.dart';
import '../routes/app_routes.dart';

class AdminBinding extends Bindings {
  @override
  void dependencies() {
    // نضع الـ controller في البداية
    Get.put(AdminDashboardController());

    // ثم نقوم بالتحقق async من الدور فور تحميل الـ Binding
    _checkRole();
  }

  void _checkRole() async {
    final auth = FirebaseAuth.instance;
    final user = auth.currentUser;
    final authService = AuthService();
    if (user == null) {
      // لو ما مسجّل، نوجه لتسجيل الدخول
      Get.offAllNamed(Routes.LOGIN);
      return;
    }

    final model = await authService.getUserModel(user.uid);
    if (model == null) {
      Get.offAllNamed(Routes.LOGIN);
      return;
    }

    if (model.role != 'admin') {
      // لو مش admin نوجهه للـ home
      Get.offAllNamed(Routes.HOME);
      return;
    }

    // إذا مرّ، يبقى الكل طبيعيًا: Binding يسمح بتحميل الصفحة والـ controller
  }
}
