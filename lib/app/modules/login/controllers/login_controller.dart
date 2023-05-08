
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ocr_projet_pfe/app/modules/homePage/bindings/home_page_binding.dart';
import 'package:ocr_projet_pfe/app/modules/homePage/views/home_page_view.dart';
import '../../../data/Models/User.dart';

class LoginController extends GetxController {

  var isPasswordHidden = true.obs;
  final Dio _dio = Dio();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _status = Rx<RxStatus>(RxStatus.empty());
  RxStatus get status => _status.value;




  @override
  void onInit() {
    super.onInit();
  }

  Future<void> login() async {
    try {
      var dio = Dio();
      dio.options.headers = {'Content-Type': 'application/json'};
      var url = "http://192.168.137.1:54999/login";

      Map<String, dynamic> body = {
        'email': emailController.text.trim(),
        'password': passwordController.text
      };
      final response = await dio.post(url, data: body);

      if (response.statusCode == 200) {
        emailController.clear();
        passwordController.clear();
        Get.off(() => HomePageView(),binding: HomePageBinding());
      } else {
        throw response.data["message"] ?? "Unknown Error Occured";
      }
    } catch (e) {
      Get.back();
      showDialog(
          context: Get.context!,
          builder: (context) {
            return SimpleDialog(
              title: Text('Error X :'),
              contentPadding: EdgeInsets.all(20),
              children: [Text(e.toString())],
            );
          });
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
  // Future<void> onLogin() async {
  //   if (_isValid()) {
  //     _status.value = RxStatus.loading();
  //     try {
  //       //Perform login logic here
  //       M.showToast('Login successful', status: SnackBarStatus.success);
  //       _status.value = RxStatus.success();
  //     } catch (e) {
  //       e.printError();
  //       M.showToast(e.toString(), status: SnackBarStatus.error);
  //       _status.value = RxStatus.error(e.toString());
  //     }
  //   }

  }