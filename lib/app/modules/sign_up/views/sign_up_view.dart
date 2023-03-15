import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ocr_projet_pfe/app/modules/widgets/background.dart';
import '../../login/bindings/login_binding.dart';
import '../../login/views/login_view.dart';
import '../../widgets/elevated_button.dart';
import '../../widgets/text_field.dart';
import '../controllers/sign_up_controller.dart';

class SignUpView extends GetView<SignUpController> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          key: _formKey,
          children: [
            Background(
              text: 'Sign Up',
              onpressed:() {
                Get.off(() => LoginView(), binding: LoginBinding());
              },
            ),
            Container(
              padding: const EdgeInsets.symmetric(
                  vertical: 16.0, horizontal: 16.0),
              child: Form(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                     const CustomSizedBoxTextFormField(
                       height: 50,
                       labelText: "Username",
                       prefixIconData: Icons.person_outline_outlined,
                       //validator: controller.,
                     ),
                    SizedBox(
                      height: 20.0,),
                    const CustomSizedBoxTextFormField(
                      height: 50,
                      labelText: "Email",
                      prefixIconData: Icons.email_outlined,
                      //validator: controller.,
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    // DropdownButton(
                    //
                    //   items: list.map((item) => DropdownMenuItem(
                    //     value: item,
                    //       child: Text(item,style:TextStyle(fontSize: 25)
                    //         ,)
                    //   )), onChanged: (Object? value) {  },
                    // ),
                    const CustomSizedBoxTextFormField(
                      height: 50,
                      labelText: "phone",
                      prefixIconData: Icons.phone,
                      //validator: controller.,
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    SizedBox(
                      height: 50,
                      child: TextFormField(
                        // controller.length();
                        obscureText: controller.isPasswordHidden.value,
                        decoration: InputDecoration(
                          hintText: "password",
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
                      ),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    SizedBox(
                      height: 50,
                      child: TextFormField(
                        //controller.length();
                        obscureText: controller.isPasswordHidden.value,
                        decoration: InputDecoration(
                          hintText: "Confirm password",
                          border: const OutlineInputBorder(),
                          suffix: InkWell(
                              child: Icon(
                            controller.isPasswordHidden.value
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: Colors.grey,
                          )),
                        ),
                      ),
                    ),
                    const SizedBox(height: 40.0, width: double.infinity),
                    Align(
                      alignment: Alignment.center,
                      child: MyElevatedButton(
                        text: 'Sign up',
                        onPressed: () {
                          Get.off(() => LoginView(), binding: LoginBinding());
                        },
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
