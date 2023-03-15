import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class HomePageController extends GetxController {
var tabIndex=0;
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
void changeTabIndex(int index){
    tabIndex=index;
    update();
}
  Future pickImage() async{
    final picker= ImagePicker();
    String path='';
    try{
      final getImage= await picker.pickImage(source: ImageSource.camera);
      if(getImage != null){
        path=getImage.path;
      }else{
        path='';
      }
    }catch(e){
      log(e.toString());
    }
    return path;
  }

void getImage(ImageSource imageSource) async {
  print('>>>>${imageSource.name}');

  final pickedFile = await ImagePicker().getImage(source: imageSource);
  if (pickedFile != null) {
    selectedImagePath.value = pickedFile.path;
    selectedImageSize.value =
        ((File(selectedImagePath.value)).lengthSync() / 1024 / 1024)
            .toString();
  } else {
    Get.snackbar("Error", "image selected",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white);
  }

}
}
