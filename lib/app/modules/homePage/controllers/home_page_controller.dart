import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';

import '../../Facture_list/views/facture_list_view.dart';

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
      final appDir = await getApplicationDocumentsDirectory();
      final fileName = '${DateTime.now()}.png';
      final savedImage = await File(image.path).copy(
          '${appDir.path}/$fileName');
      final bytes = await File(savedImage.path).readAsBytes();
      Get.to(FactureListView(imagePath: savedImage.path));
      // final encoded = base64.encode(bytes);
      // final dio = Dio();
      // final response = await dio.post(
      //   'http://python adresse',
      //   data: {'image': encoded},
      // );
      // if (response.statusCode == 200) {
      //   Get.to(FactureListView(imagePath: savedImage.path));
      } else {
        Get.snackbar("Error", " no image selected",
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.red,
            colorText: Colors.white);
      }
    }
    void goToImagePage(String imagePath) {
      Get.to(FactureListView(imagePath: imagePath));
    }
  }

