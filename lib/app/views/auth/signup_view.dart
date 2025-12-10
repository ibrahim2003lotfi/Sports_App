import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_input.dart';
import '../../controllers/auth/signup_controller.dart';

class SignupView extends GetView<SignupController> {
  const SignupView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("أبو طارق و أبو وسيم للأخبار الرياضية"),
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 15),
              const Text(
                "إنشاء حساب",
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff0D47A1),
                ),
              ),
              const SizedBox(height: 20),

              CustomInput(
                label: 'الاسم (اختياري)',
                onChanged: (v) => controller.name.value = v,
              ),
              const SizedBox(height: 12),

              CustomInput(
                label: 'البريد الإلكتروني',
                onChanged: (v) => controller.email.value = v,
              ),
              const SizedBox(height: 12),

              CustomInput(
                label: 'كلمة المرور',
                isPassword: true,
                onChanged: (v) => controller.password.value = v,
              ),
              const SizedBox(height: 12),

              CustomInput(
                label: 'تأكيد كلمة المرور',
                isPassword: true,
                onChanged: (v) => controller.confirmPassword.value = v,
              ),
              const SizedBox(height: 20),

              Obx(() {
                return controller.isLoading.value
                    ? const CircularProgressIndicator()
                    : CustomButton(
                        text: 'إنشاء الحساب',
                        onPressed: controller.signup,
                      );
              }),

              const SizedBox(height: 12),
              TextButton(
                onPressed: () => Get.back(),
                child: const Text('رجوع لتسجيل الدخول'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
