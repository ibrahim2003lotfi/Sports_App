import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/auth/login_controller.dart';
import '../../widgets/custom_input.dart';
import '../../widgets/custom_button.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const Text(
                  "تسجيل الدخول",
                  style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 30),
                CustomInput(
                  label: "البريد الإلكتروني",
                  onChanged: (v) => controller.email.value = v,
                ),
                const SizedBox(height: 15),
                CustomInput(
                  label: "كلمة المرور",
                  isPassword: true,
                  onChanged: (v) => controller.password.value = v,
                ),
                const SizedBox(height: 25),
                Obx(() {
                  return controller.isLoading.value
                      ? const CircularProgressIndicator()
                      : CustomButton(
                          text: "تسجيل الدخول",
                          onPressed: controller.login,
                        );
                }),
                TextButton(
                  onPressed: controller.forgotPassword,
                  child: const Text("نسيت كلمة المرور؟"),
                ),
                TextButton(
                  onPressed: () {
                    Get.toNamed(
                        '/signup'); // أو Routes.SIGNUP حسب ملف الراوتس عندك
                  },
                  child: const Text("إنشاء حساب جديد"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
