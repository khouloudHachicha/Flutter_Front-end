import 'dart:convert';
import 'dart:core';
import 'package:dio/dio.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ocr_projet_pfe/app/modules/homePage/bindings/home_page_binding.dart';
import 'package:ocr_projet_pfe/app/modules/homePage/views/home_page_view.dart';

class SignUpController extends GetxController {
  final formKey = GlobalKey<FormState>();
  var email = ''.obs;
  var isPasswordHidden = true.obs;
  final Dio _dio = Dio();
  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final cinController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  final RxBool isPasswordVisible = true.obs;
  RxnString errorText = RxnString(null);
  Rxn<Function()> submitFunc = Rxn<Function()>(null);
  var username = ''.obs;
  var cin = ''.obs;
  var phone = ''.obs;
  var password = ''.obs;


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
  void Validate(String email) {
    bool isvalid = EmailValidator.validate(email);
    print(isvalid);
  }

   isValidCin() {
    if (cin.value.isEmpty) {
      Get.snackbar('Error', 'CIN field cannot be empty');
      return false;
    } else if (!GetUtils.isNumericOnly(cin.value)) {
      Get.snackbar('Error', 'CIN should contain only numbers');
      return false;
    } else if (cin.value.length != 8) {
      Get.snackbar('Error', 'CIN should be exactly 8 digits long');
      return false;
    } else {
      return true;
    }
  }

   isValidPhone() {
    if (phone.value.isEmpty) {
      Get.snackbar('Error', 'Phone number field cannot be empty');
      return false;
    } else if (!GetUtils.isPhoneNumber(phone.value)) {
      Get.snackbar('Error', 'Please enter a valid phone number');
      return false;
    } else {
      return true;
    }
  }
   isValidPassword() {
    if (password.value.isEmpty) {
      Get.snackbar('Error', 'Password field cannot be empty');
      return false;
    } else if (password.value.length < 6) {
      Get.snackbar('Error', 'Password should be at least 6 characters long');
      return false;
    } else {
      return true;
    }
  }
   isValidEmail() {
    if (email.value.isEmpty) {
      Get.snackbar('Error', 'Email field cannot be empty');
      return false;
    } else if (!GetUtils.isEmail(email.value)) {
      Get.snackbar('Error', 'Please enter a valid email');
      return false;
    } else {
      return true;
    }
  }

 emailvalidation(value) {
  if (!GetUtils.isEmail(value!)) {
    return 'email is not valid';
  }
}
  Future<void> register() async {
    try {
      var dio = Dio();
      dio.options.headers = {'Content-Type': 'application/json'};
      var url = "http://192.168.137.1:54999/register";

      Map body = {
        'username': usernameController.text,
        'email': emailController.text.trim(),
        'cin':cinController.text,
        'phone':phoneController.text,
        'password': passwordController.text,
      };
      final response = await dio.post(url, data: body);
      if (response.statusCode == 200) {
        usernameController.clear();
        emailController.clear();
        cinController.clear();
        phoneController.clear();
        passwordController.clear();
        Get.offAll(()=>HomePageView(),binding: HomePageBinding());
      } else {
        throw jsonDecode(response.data)["message"] ?? "Unknown Error Occured";
      }
    } catch (e) {
      print(e);
      Get.back();
      showDialog(
          context: Get.context!,
          builder: (context) {
            return SimpleDialog(
              title: Text('Error'),
              contentPadding: EdgeInsets.all(20),
              children: [Text(e.toString())],
            );
          });
    }
  }


  Future<bool> Function() submitFunction() {
    return () async {
      print('Make database call to create ${usernameController.value} account');
      await Future.delayed(const Duration(seconds: 1), () => print('User account created'));
      return true;
    };

  }


}

