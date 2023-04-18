
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../data/Models/User.dart';

class LoginController extends GetxController {

  var isPasswordHidden = true.obs;
  final Dio _dio = Dio();
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _status = Rx<RxStatus>(RxStatus.empty());
  RxStatus get status => _status.value;




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