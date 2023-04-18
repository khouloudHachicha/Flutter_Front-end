import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ocr_projet_pfe/app/modules/homePage/bindings/home_page_binding.dart';
import 'package:path_provider/path_provider.dart';

import '../../Facture_list/views/facture_list_view.dart';
import '../views/home_page_view.dart';

class HomePageController extends GetxController {
  var tabIndex =1;
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
    String path = '';
    try {
      final getImage = await picker.pickImage(source: ImageSource.camera);
      if (getImage != null) {
        path = getImage.path;
      } else {
        path = '';
      }
    } catch (e) {
      log(e.toString());
    }
    return path;
  }

  void getImage(ImageSource imageSource) async {
    final image = await ImagePicker().getImage(source: ImageSource.camera);
    if (image != null) {
      // final appDir = await getApplicationDocumentsDirectory();
      // final fileName = '${DateTime.now()}.png';
       // final savedImage = await File(image.path).copy(
       //     '${appDir.path}/$fileName');
      final imageBytes = await image.readAsBytes();
       // final bytes = await File(savedImage.path).readAsBytes();
      // Get.to(FactureListView(imagePath: savedImage.path));
      final base64Image = base64Encode(imageBytes);
      final dio = Dio();
      final response = await dio.post(
        'http://172.16.0.118:5000/scan',
        data: {'image': base64Image},
      );
      if (response.statusCode == 200) {
        Get.to(HomePageView(),binding: HomePageBinding());
        //Get.to(FactureListView(imagePath: savedImage.path));
      } else {
        Get.snackbar("Error", " no image selected",
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.red,
            colorText: Colors.white);
      }
    }
    // void goToImagePage(String imagePath) {
    //   Get.to(FactureListView(imagePath: imagePath));
    // }
  }
}
