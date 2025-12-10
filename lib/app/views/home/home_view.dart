import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("الصفحة الرئيسية"),
      ),
      body: const Center(
        child: Text("تم تسجيل الدخول بنجاح 🎉"),
      ),
    );
  }
}
