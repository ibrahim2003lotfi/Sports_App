import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/auth/onboarding_controller.dart';

class OnboardingView extends GetView<OnboardingController> {
  const OnboardingView({super.key});

  final List<String> sampleSports = const [
    'كرة القدم',
    'كرة السلة',
    'تنس',
    'كرة الطائرة',
    'كريكت'
  ];

  @override
  Widget build(BuildContext context) {
    final args = Get.arguments as Map<String, dynamic>? ?? {};
    final uid = args['uid'] as String? ?? '';

    return Scaffold(
      appBar: AppBar(
        title: const Text("أبو طارق و أبو وسيم للأخبار الرياضية"),
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const Text(
              'اختر الرياضات التي تهمك',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Color(0xff0D47A1),
              ),
            ),
            const SizedBox(height: 20),

            Obx(() {
              return Wrap(
                spacing: 10,
                runSpacing: 10,
                children: sampleSports.map((s) {
                  final selected = controller.selectedSports.contains(s);
                  return ChoiceChip(
                    label: Text(s),
                    selected: selected,
                    selectedColor: const Color(0xff0D47A1),
                    onSelected: (_) => controller.toggleSport(s),
                  );
                }).toList(),
              );
            }),

            const Spacer(),

            ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
              ),
              onPressed: () {
                if (uid.isEmpty) {
                  Get.snackbar('خطأ', 'لا يوجد UID للمستخدم');
                  return;
                }
                controller.finishOnboarding(uid);
              },
              child: const Text(
                'حفظ والانتقال',
                style: TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
