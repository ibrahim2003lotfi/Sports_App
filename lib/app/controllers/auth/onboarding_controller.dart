import 'package:get/get.dart';
import '../../services/auth_service.dart';
import '../../routes/app_routes.dart';

class OnboardingController extends GetxController {
  // اختيارات بسيطة كمثال
  var selectedSports = <String>[].obs;
  var selectedLeagues = <String>[].obs;
  var selectedTeams = <String>[].obs;
  var selectedPlayers = <String>[].obs;

  final AuthService _authService = AuthService();

  // Toggle helper
  void toggleSport(String sport) {
    if (selectedSports.contains(sport)) {
      selectedSports.remove(sport);
    } else {
      selectedSports.add(sport);
    }
  }

  // Save interests to Firestore
  Future<void> finishOnboarding(String uid) async {
    try {
      await _authService.updateUserInterests(uid,
          sports: selectedSports.toList(),
          leagues: selectedLeagues.toList(),
          teams: selectedTeams.toList(),
          players: selectedPlayers.toList());
      Get.snackbar('نجاح', 'تم حفظ اختياراتك');
      // اذهب إلى الهوم الافتراضي
      Get.offAllNamed(Routes.HOME);
    } catch (e) {
      Get.snackbar('خطأ', e.toString());
    }
  }
}
