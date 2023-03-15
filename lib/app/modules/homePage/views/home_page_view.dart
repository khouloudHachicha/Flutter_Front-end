import 'package:colours/colours.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../../widgets/drawer.dart';
import '../controllers/home_page_controller.dart';

class HomePageView extends GetView<HomePageController> {
  const HomePageView({super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomePageController>(
      builder: (context) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colours.navy,
          ),
             drawer: DrawerCustom(),
          body: SafeArea(
            child: IndexedStack(
              index: controller.tabIndex,
              children:  [
                // ProfileView(),
                // ProfileView(),
                // LoginView(),
               GestureDetector(
                 child: Image.asset(
                   'assets/scanner.gif',
                 ),
                 onTap: () {
                   controller.getImage(ImageSource.camera);
                   },
               )
              ],
            ),
          ),
          bottomNavigationBar: CurvedNavigationBar(
            height: 50,
            backgroundColor: Colors.white,
             color: Colours.navy,
             animationDuration: const Duration(milliseconds:90 ),
             items: const [
               Icon(Icons.history, size: 30,color: Colors.white,),
               Icon(Icons.home, size: 30,color: Colors.white,),
               Icon(Icons.account_circle, size: 30,color: Colors.white,),
             ],
            onTap:
            controller.changeTabIndex,
          ),
            );
      }
    );
  }
}