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
      appBar: AppBar(
        title: const Text(" أبو طارق و أبو وسيم للأخبار الرياضية"),
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const Text(
                  "تسجيل الدخول",
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff0D47A1),
                  ),
                ),
                const SizedBox(height: 20),

                // كرة قدم صغيرة كستايل
                const Icon(
                  Icons.sports_soccer,
                  size: 60,
                  color: Color(0xff0D47A1),
                ),

                const SizedBox(height: 35),

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
                  onPressed: () => Get.toNamed('/signup'),
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
