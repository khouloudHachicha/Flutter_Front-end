import 'package:colours/colours.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:ocr_projet_pfe/app/modules/homePage/bindings/home_page_binding.dart';
import 'package:ocr_projet_pfe/app/modules/homePage/views/home_page_view.dart';

import '../../../data/AppUrl.dart';
import '../../../data/UserDataStorage.dart';

class LoginController extends GetxController {
  final RxBool isPasswordHidden = true.obs;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final _status = Rx<RxStatus>(RxStatus.empty());

  RxStatus get status => _status.value;
  var dio = Dio();

  @override
  void onInit() {
    super.onInit();
    GetStorage.init();
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

  Future<void> login() async {
    try {
      dio.options.headers = {'Content-Type': 'application/json'};
      String url = ("${AppUrl.baseUrl}${AppUrl.login}");

      Map<String, dynamic> body = {
        'email': emailController.text.trim(),
        'password': passwordController.text
      };
      final response = await dio.post(url, data: body);

      if (response.statusCode == 200) {
        emailController.clear();
        passwordController.clear();
        UserDataStorage.setUserData(response.data);
        print(response.data.toString() );
        Get.off(() => const HomePageView(), binding: HomePageBinding());
        showDialog(
            context: Get.context!,
            builder: (context) {
              Future.delayed(const Duration(seconds: 2), () {
                Navigator.pop(context);
              });
              return SimpleDialog(
                backgroundColor: Colors.white,
                contentPadding: const EdgeInsets.all(20),
                children: [
                  Text(
                    "You have been logged successfully",
                    style: TextStyle(color: Colours.navy),
                  )
                ],
              );
            });
      } else if (response.statusCode == 500) {
        showDialog(
            context: Get.context!,
            builder: (context) {
              Future.delayed(const Duration(seconds: 2), () {
                Navigator.pop(context);
              });
              return const SimpleDialog(
                backgroundColor: Colors.red,
                contentPadding: EdgeInsets.all(20),
                children: [
                  Text(
                    "Network problem, please try again!",
                    style: TextStyle(color: Colors.white),
                  )
                ],
              );
            });
      } else {
        throw response.data["message"] ?? "Unknown Error Occurred";
      }
    } catch (e) {
      print(e);
      showDialog(
          context: Get.context!,
          builder: (context) {
            Future.delayed(const Duration(seconds: 2), () {
              Navigator.pop(context);
            });
            return const SimpleDialog(
              backgroundColor: Colors.red,
              contentPadding: EdgeInsets.all(20),
              children: [
                Text(
                  "Can you check again please!",
                  style: TextStyle(color: Colors.white),
                )
              ],
            );
          });
    }
  }

}
