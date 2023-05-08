import 'package:colours/colours.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ocr_projet_pfe/app/modules/sign_up/views/sign_up_view.dart';
import 'package:ocr_projet_pfe/app/modules/widgets/background.dart';
import 'package:ocr_projet_pfe/app/modules/widgets/elevated_button.dart';
import '../../homePage/bindings/home_page_binding.dart';
import '../../homePage/views/home_page_view.dart';
import '../../sign_up/bindings/sign_up_binding.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const MainBackground(text: 'Login',),
            const SizedBox(
              height: 60,
            ),
           Padding(
             padding: const EdgeInsets.symmetric(
                 vertical: 16.0, horizontal: 16.0),
             child: Column(
               children: [
                 TextFormField(
                   autovalidateMode: AutovalidateMode.onUserInteraction,
                   validator: (value) {
                     if (value!.isEmpty) {
                       return 'Please enter your email !';
                     } else if (value.isEmail == false) {
                       return 'Your email must be valid !';
                     }
                   },
                   controller: controller.emailController,
                   decoration:  InputDecoration(
                     focusColor: Colors.blueAccent,
                     fillColor: Colors.blueAccent,
                     prefixIcon: Icon(
                       Icons.email_outlined,
                       size: 20,
                       color: Colours.navy,
                     ),
                     label: const Text(
                       'email',
                       style: TextStyle(
                         color: Colors.grey,
                       ),
                     ),
                     border: const OutlineInputBorder(),
                   ),
                 ),
                 const SizedBox(
                   height: 20,
                 ),
                 TextFormField(
                   controller: controller.passwordController,
                   obscureText: controller.isPasswordHidden.value,
                   decoration: InputDecoration(
                     focusColor: Colors.blueAccent,
                     fillColor: Colors.blueAccent,
                     prefixIcon: Icon(
                       Icons.password,
                       size: 20,
                       color: Colours.navy,
                     ),
                     label: const Text(
                       'password',
                       style: TextStyle(
                         color: Colors.grey,
                       ),
                     ),
                     border: const OutlineInputBorder(),
                     suffix: InkWell(
                       child: Icon(
                         controller.isPasswordHidden.value
                             ? Icons.visibility
                             : Icons.visibility_off,
                         color: Colors.grey,
                       ),
                     ),
                   ),
                   validator: (value) {
                     if (value!.isEmpty) {
                       return 'Please enter a password !';
                     } else if (value!.length < 8) {
                       return 'Your password must contain at least 8 characters !';
                     }
                     return null;
                   },
                 ),
                 Row(
                   mainAxisAlignment: MainAxisAlignment.end,
                   children: [
                     const Text("Don't have an  account"),
                     TextButton(
                       onPressed: () {
                         Get.off(() => SignUpView(), binding: SignUpBinding());
                       },
                       child: Text(
                         "create new account?",
                         style: TextStyle(color: Colours.navy),
                       ),
                     ),
                   ],
                 ),
                 const SizedBox(height: 30,),
                 Center(
                   child: MyElevatedButton(
                     text: 'LOGIN',
                     onPressed: () {
                       Get.off(() => HomePageView(),binding: HomePageBinding());
                      // controller.login();
                     },
                   ),
                 ),
               ],
             ),
           )
          ],
        ),
      ),
    );
  }
}