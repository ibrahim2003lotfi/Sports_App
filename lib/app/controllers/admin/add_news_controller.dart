import 'package:get/get.dart';
import 'package:uuid/uuid.dart';

import '../../models/news_model.dart';
import '../../services/news_service.dart';

class AddNewsController extends GetxController {
  final title = ''.obs;
  final description = ''.obs;
  final sport = ''.obs;
  final team = ''.obs;
  final player = ''.obs;
  final imageUrl = ''.obs;

  final isLoading = false.obs;

  final _service = NewsService();

  Future<void> addNews() async {
    if (title.isEmpty || description.isEmpty || sport.isEmpty) {
      Get.snackbar("خطأ", "يجب ملء الحقول الأساسية");
      return;
    }

    isLoading.value = true;

    final id = const Uuid().v4();

    final news = NewsModel(
      id: id,
      title: title.value,
      description: description.value,
      sport: sport.value,
      team: team.value.isNotEmpty ? team.value : null,
      player: player.value.isNotEmpty ? player.value : null,
      imageUrl: imageUrl.value,
      createdAt: DateTime.now(),
    );

    await _service.addNews(news);

    isLoading.value = false;

    Get.back();
    Get.snackbar("تم", "تمت إضافة الخبر بنجاح");
  }
}
