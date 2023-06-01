import 'package:dio/dio.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  final count = 0.obs;
  final Dio _dio = Dio();

  @override
  void onInit() {
    super.onInit();
  }

  Future<void> getUserProfileData() async {
    const String url = 'http://192.168.137.1/users';
    try {
      var response = await Dio().get(url);
      if (response.statusCode == 200) {
        print("Data obtained successfully");
        print(response.data);
      } else {
        print("Issues with APIs");
      }
    } catch (e) {
      print("Error: $e");
    }
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}

