import 'package:get/get.dart';

class SettingsController extends GetxController {
  var isDarkMode = false.obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
  void toggleTheme() {
    isDarkMode.value = !isDarkMode.value;
  }

}

