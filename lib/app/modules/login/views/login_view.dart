import 'package:colours/colours.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ocr_projet_pfe/app/modules/sign_up/views/sign_up_view.dart';
import 'package:ocr_projet_pfe/app/modules/widgets/background.dart';
import 'package:ocr_projet_pfe/app/modules/widgets/elevated_button.dart';
import '../../homePage/bindings/home_page_binding.dart';
import '../../homePage/views/home_page_view.dart';
import '../../sign_up/bindings/sign_up_binding.dart';
import '../../widgets/text_field.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SingleChildScrollView(
         physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const MainBackground(text: 'Login',),
              const SizedBox(
                height: 100,
              ),
                const CustomSizedBoxTextFormField(
                labelText: 'Username',
                prefixIconData: Icons.person_outline_outlined,
                height: 50,
                //validator: controller.
               ),
              const SizedBox(
                height: 20,
              ),
              const CustomSizedBoxTextFormField(
                labelText: 'Password',
                prefixIconData: Icons.password,
                height: 50,
                //validator: controller.
                //   suffixIcon: IconButton(
                //       onPressed: null,
                //       icon: Icon(Icons.remove_red_eye_sharp)
                //   ),
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
              const SizedBox(height: 40,),
              Center(
                child: MyElevatedButton(
                  text: 'LOGIN',
                  onPressed: () {
                    Get.off(() => HomePageView(), binding: HomePageBinding());
                    if(_formKey.currentState!.validate()){
                      ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content:
                              Text('Succefully logged in')));
                    }
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