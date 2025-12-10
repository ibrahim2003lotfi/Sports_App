// lib/app/middleware/role_middleware.dart
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sports_app/app/routes/app_routes.dart';

class RoleMiddleware extends GetMiddleware {
  final String requiredRole;
  RoleMiddleware(this.requiredRole);

  final FirebaseAuth _auth = FirebaseAuth.instance;

  // فقط نتحقق من كون المستخدم مسجّل (sync)
  @override
  RouteSettings? redirect(String? route) {
    final user = _auth.currentUser;
    if (user == null) {
      // إذا ما في user، أعد توجيه لتسجيل الدخول
      return const RouteSettings(name: Routes.LOGIN);
    }
    // لا نتحقق من الدور هنا (لانها تتطلب async).
    // سنقوم بالتحقق الفعلي في الـ Binding أو Controller.
    return null;
  }
}
