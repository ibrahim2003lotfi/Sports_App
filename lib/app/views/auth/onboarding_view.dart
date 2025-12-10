import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/auth/onboarding_controller.dart';

class OnboardingView extends GetView<OnboardingController> {
  const OnboardingView({super.key});

  // مثال قائمه رياضات بسيطة — لاحقاً يمكن جلبها من Firestore
  final List<String> sampleSports = const [
    'Football',
    'Basketball',
    'Tennis',
    'Cricket',
    'Volleyball'
  ];

  @override
  Widget build(BuildContext context) {
    final args = Get.arguments as Map<String, dynamic>? ?? {};
    final uid = args['uid'] as String? ?? '';

    return Scaffold(
      appBar: AppBar(title: const Text('اختر رياضاتك المفضلة')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const Text('اختر الرياضات التي تهمك'),
            const SizedBox(height: 12),
            Obx(() {
              return Wrap(
                spacing: 8,
                runSpacing: 8,
                children: sampleSports.map((s) {
                  final selected = controller.selectedSports.contains(s);
                  return ChoiceChip(
                    label: Text(s),
                    selected: selected,
                    onSelected: (_) => controller.toggleSport(s),
                  );
                }).toList(),
              );
            }),
            const Spacer(),
            ElevatedButton(
              onPressed: () {
                if (uid.isEmpty) {
                  Get.snackbar('خطأ', 'لا يوجد UID للمستخدم');
                  return;
                }
                controller.finishOnboarding(uid);
              },
              child: const Text('حفظ والانتقال'),
            )
          ],
        ),
      ),
    );
  }
}
