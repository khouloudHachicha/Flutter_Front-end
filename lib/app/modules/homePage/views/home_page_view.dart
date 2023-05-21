import 'dart:io';

import 'package:colours/colours.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../../Facture_list/views/facture_list_view.dart';
import '../../Settings/views/settings_view.dart';
import '../controllers/home_page_controller.dart';

class HomePageView extends GetView<HomePageController> {
  const HomePageView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomePageController>(builder: (context) {
      return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: IndexedStack(
            index: controller.tabIndex,
            children: [
              FactureListView(),
              GestureDetector(
                child: Center(
                  child: Obx(() => controller.selectedImagePath.value ==''
                    ?Image.asset('assets/scanner.gif')
                      : Column(
                        children: [
                          Image.file(File(controller.selectedImagePath.value)),
                        ElevatedButton(onPressed:()async=>controller.sendImage(),child: Text("Send"))
                        ],
                      ),
                  ),
                ),
                onTap: ()async {
                  await controller.pickImage();
                },
              ),
              SettingsView(),
            ],
          ),
        ),
        bottomNavigationBar: CurvedNavigationBar(
          index: controller.tabIndex,
          height: 50,
          backgroundColor: Colors.white,
          color: Colours.navy,
          animationDuration: const Duration(milliseconds: 90),
          items: const [
            Icon(
              Icons.inventory_outlined,
              size: 30,
              color: Colors.white,
            ),
            Icon(
              Icons.document_scanner_rounded,
              size: 30,
              color: Colors.white,
            ),
            Icon(
              Icons.settings,
              size: 30,
              color: Colors.white,
            ),
          ],
          onTap: controller.changeTabIndex,
          letIndexChange: (index) => true,

        ),
      );
    });
  }
}