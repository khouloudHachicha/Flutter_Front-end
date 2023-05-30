import 'package:colours/colours.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:ocr_projet_pfe/app/data/UserDataStorage.dart';
import '../../homePage/bindings/home_page_binding.dart';
import '../../homePage/views/home_page_view.dart';
import '../../widgets/background.dart';
import '../../widgets/elevated_button.dart';
import '../../widgets/text_field.dart';
import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
    ProfileView({super.key});
  final userData = GetStorage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: GestureDetector(
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
                Container(
                  padding: const EdgeInsets.symmetric(
                      vertical: 16.0, horizontal: 16.0),
                  child: Form(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 50,
                          child: TextFormField(
                            enabled: false,
                            controller: controller.usernameController,
                            decoration:   InputDecoration(
                              focusColor: Colors.blueAccent,
                              fillColor: Colors.blueAccent,
                              label: Text(
                                UserDataStorage.userData.username,
                                style: TextStyle(
                                  color: Colors.black54,
                                ),
                              ),
                              prefixIcon: Icon(
                                Icons.person_outline_outlined,
                                size: 20,
                                color: Colours.navy,
                              ),
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20.0,),
                        SizedBox(
                          height: 50,
                          child: TextFormField(
                            autovalidateMode: AutovalidateMode.onUserInteraction,
                            validator: (value) {
                             if (value!.isEmail == false) {
                                return 'Your email must be valid !';
                              }
                            },
                            controller: controller.emailController,
                            decoration:   InputDecoration(
                              focusColor: Colors.blueAccent,
                              fillColor: Colors.blueAccent,
                              label: Text(
                                controller.emailController.text.isNotEmpty ? controller.emailController.text.trim() : UserDataStorage.userData.email,
                                style: TextStyle(
                                  color: Colors.black54,
                                ),
                              ),
                              prefixIcon: Icon(
                                Icons.email,
                                size: 20,
                                color: Colours.navy,
                              ),
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        SizedBox(
                          height: 50,
                          child: TextFormField(
                            enabled: false,
                            autovalidateMode: AutovalidateMode.onUserInteraction,
                            keyboardType: TextInputType.phone,
                            validator: (value) {
                              if (value!.isNum || value.length!=8) {
                                return 'Your ID must be valid !';
                              }
                            },
                            controller: controller.cinController,
                            decoration:   InputDecoration(
                              focusColor: Colors.blueAccent,
                              fillColor: Colors.blueAccent,
                              label: Text(
                                UserDataStorage.userData.cin,
                                style: TextStyle(
                                  color: Colors.black54,
                                ),
                              ),
                              prefixIcon: Icon(
                                Icons.credit_card,
                                size: 20,
                                color: Colours.navy,
                              ),
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        SizedBox(
                          height: 50.0,
                          child: TextFormField(
                            autovalidateMode: AutovalidateMode.onUserInteraction,
                            keyboardType: TextInputType.phone,
                            validator: (value) {
                               if (value!.isNum || value.length!=8) {
                                return 'Your phone number must be valid !';
                              }
                            },
                            controller: controller.phoneController,
                            decoration:  InputDecoration(
                              focusColor: Colors.blueAccent,
                              fillColor: Colors.blueAccent,
                            prefixIcon: Icon(
                              Icons.phone,
                              size: 20,
                              color: Colours.navy,
                            ),
                            label:  Text(
                              controller.phoneController.text.isNotEmpty ? controller.phoneController.text : UserDataStorage.userData.phone,
                              style: TextStyle(
                                color: Colors.black54,
                              ),
                            ),
                            border: const OutlineInputBorder(),
                          ),
                        ),
                      ),
                        const SizedBox(
                          height: 20.0,
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Center(
                  child: MyElevatedButton(
                    text: 'Update',
                    onPressed: () {
                      controller.updateUser(UserDataStorage.userData.id.toString());
                    },
                  ),
                ),
    ],
                ),
          ),
          ),
      ),
    );
  }
}
