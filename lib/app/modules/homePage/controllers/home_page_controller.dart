import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ocr_projet_pfe/app/modules/homePage/bindings/home_page_binding.dart';
import 'package:path_provider/path_provider.dart';

import '../../../data/AppUrl.dart';
import '../../Facture_list/views/facture_list_view.dart';
import '../views/home_page_view.dart';

class HomePageController extends GetxController {
  var tabIndex = 1;
  var selectedImagePath = ''.obs;
  var selectedImageSize = ''.obs;

  @override
  void onClose() {
    super.onClose();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void changeTabIndex(int index) {
    tabIndex = index;
    update();
  }

  Future pickImage() async {
    final picker = ImagePicker();
    final getImage = await picker.pickImage(source: ImageSource.camera);
    if (getImage != null) {
      selectedImagePath.value = getImage.path;
      selectedImageSize.value =
          "${(File(selectedImagePath.value).lengthSync() / 1024 / 1024).toStringAsFixed(2)}Mb";
    } else {
      Get.snackbar("Error", " no image selected",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white);
    }
  }

  sendImage() async {
    final imageBytes = File(selectedImagePath.value).readAsBytesSync();

    final base64Image = base64Encode(imageBytes);
    final dio = Dio();
    final response = await dio.post(
      "${AppUrl.baseUrl_python}${AppUrl.scan}",
      data: {'file': base64Image},
    );
    if (response.statusCode == 200) {
      print(response.data);
      Get.off(HomePageView(), binding: HomePageBinding());
    } else {
      Get.snackbar("Error", " no image selected",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white);
    }
  }
}
