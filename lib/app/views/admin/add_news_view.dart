import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/admin/add_news_controller.dart';
import '../../widgets/custom_input.dart';
import '../../widgets/custom_button.dart';

class AddNewsView extends GetView<AddNewsController> {
  const AddNewsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("إضافة خبر رياضي")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              CustomInput(
                label: "عنوان الخبر",
                onChanged: (v) => controller.title.value = v,
              ),
              const SizedBox(height: 12),
              CustomInput(
                label: "الوصف",
                maxLines: 4,
                onChanged: (v) => controller.description.value = v,
              ),
              const SizedBox(height: 12),
              CustomInput(
                label: "الرياضة (مثال: Football)",
                onChanged: (v) => controller.sport.value = v,
              ),
              const SizedBox(height: 12),
              CustomInput(
                label: "الفريق (اختياري)",
                onChanged: (v) => controller.team.value = v,
              ),
              const SizedBox(height: 12),
              CustomInput(
                label: "اللاعب (اختياري)",
                onChanged: (v) => controller.player.value = v,
              ),
              const SizedBox(height: 12),
              CustomInput(
                label: "رابط الصورة (اختياري)",
                onChanged: (v) => controller.imageUrl.value = v,
              ),
              const SizedBox(height: 20),
              Obx(() {
                return controller.isLoading.value
                    ? const CircularProgressIndicator()
                    : CustomButton(
                        text: "إضافة الخبر",
                        onPressed: controller.addNews,
                      );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
