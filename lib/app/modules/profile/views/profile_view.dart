import 'package:colours/colours.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../homePage/bindings/home_page_binding.dart';
import '../../homePage/views/home_page_view.dart';
import '../../widgets/background.dart';
import '../../widgets/elevated_button.dart';
import '../../widgets/text_field.dart';
import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap:() {
          FocusScope.of(context).unfocus();
        },
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Background(
              text: 'Profile',
              onpressed:(){
        Get.off(()=>const HomePageView(),binding: HomePageBinding());
        },
        ),
              const MyTextField(
                label: 'Username',
              ),
              const SizedBox(height: 20),
              const MyTextField(
                label: 'Email',
              ),
              const SizedBox(height: 20),
              const MyTextField(
                label: 'phone',
              ),
              const SizedBox(height: 20),
              const MyTextField(
                label: 'Password',
              ),
              const SizedBox(height: 20),
              const SizedBox(height: 40,),
              Center(
                child: MyElevatedButton(
                  text: 'Edit',
                  onPressed: () {
                    Get.off(() => const HomePageView(), binding: HomePageBinding());
                  },
                ),
              ),
    ],
              ),
        ),
        ),
    );
  }
}
