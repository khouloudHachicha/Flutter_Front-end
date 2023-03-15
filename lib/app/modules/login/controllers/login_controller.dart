
import 'package:dio/dio.dart';
import 'package:get/get.dart';

import '../../../data/Models/User.dart';

class LoginController extends GetxController {

  var isPasswordHidden = true.obs;
  final Dio _dio = Dio();


  @override
  void onInit() {
    super.onInit();
  }

  Future<User> login(String username, String password) async {
    try {
      var response = await _dio.post(
        'http://192.168.137.1/users',
        data: {
          'username': username,
          'password': password
        },
        queryParameters: {'apikey': 'YOUR_API_KEY'},
      );
      return User.fromJson(response.data);
    } on DioError catch (e) {
      return e.response!.data;
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

  String? emptyField(String? e) {
    if (e == null || e.isEmpty) {
      return "Please enter your username";
    } else {
      return null;
    }
  }
}