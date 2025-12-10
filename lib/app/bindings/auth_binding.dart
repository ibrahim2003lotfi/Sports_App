import 'package:get/get.dart';
import '../controllers/auth/login_controller.dart';
import '../controllers/auth/signup_controller.dart';
import '../controllers/auth/onboarding_controller.dart';

class AuthBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(LoginController());
    Get.put(SignupController());
    Get.put(OnboardingController());
  }
}
