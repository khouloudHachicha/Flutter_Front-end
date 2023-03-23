import 'package:colours/colours.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../../Facture_list/views/facture_list_view.dart';
import '../../Settings/views/settings_view.dart';
import '../../profile/views/profile_view.dart';
import '../../widgets/drawer.dart';
import '../controllers/home_page_controller.dart';

class HomePageView extends GetView<HomePageController> {
  const HomePageView({super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomePageController>(
      builder: (context) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colours.navy,
            title: Text("Scan"),
          ),
          body: SafeArea(
            child: IndexedStack(
              index: controller.tabIndex,
              children:  [
                FactureListView(imagePath: '',),
               GestureDetector(
                 child: Center(
                   child: Image.asset(
                     'assets/scanner.gif',
                   ),
                 ),
                 onTap: () {
                   controller.getImage(ImageSource.camera);
                   },
               ),
                SettingsView()
                // page settings
              ],
            ),
          ),
          bottomNavigationBar: CurvedNavigationBar(
            height: 50,
            backgroundColor: Colors.white,
             color: Colours.navy,
             animationDuration: const Duration(milliseconds:90 ),
             items: const [
               Icon(Icons.inventory_outlined, size: 30,color: Colors.white,),
               Icon(Icons.document_scanner_rounded, size: 30,color: Colors.white,),
               Icon(Icons.settings, size: 30,color: Colors.white,),
             ],
            onTap:
            controller.changeTabIndex,
          ),
            );
      }
    );
  }
}