import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../routes/app_routes.dart';
import '../services/auth_service.dart';

class AuthMiddleware extends GetMiddleware {
  final _auth = FirebaseAuth.instance;
  final _service = AuthService();

  @override
  RouteSettings? redirect(String? route) {
    final user = _auth.currentUser;

    if (user == null) {
      return const RouteSettings(name: Routes.LOGIN);
    }

    return null;
  }
}
