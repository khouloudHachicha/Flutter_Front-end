import 'package:colours/colours.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ocr_projet_pfe/app/modules/widgets/background.dart';
import '../../login/bindings/login_binding.dart';
import '../../login/views/login_view.dart';
import '../../widgets/elevated_button.dart';
import '../../widgets/text_field.dart';
import '../controllers/sign_up_controller.dart';

class SignUpView extends GetView<SignUpController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          key: controller.formKey,
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
                  SizedBox(
                      height: 50,
                      child: TextFormField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your username !';
                          }
                        },
                        controller: controller.usernameController,
                        decoration:  InputDecoration(
                          focusColor: Colors.blueAccent,
                          fillColor: Colors.blueAccent,
                          prefixIcon: Icon(
                            Icons.person_outline_outlined,
                            size: 20,
                            color: Colours.navy,
                          ),
                          label: const Text(
                            'username',
                            style: TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                          border: const OutlineInputBorder(),
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
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    SizedBox(
                      height: 50,
                      child: TextFormField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        keyboardType: TextInputType.phone,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your ID number !';
                          } else if (!value.isNum || value.length!=8) {
                            return 'Your ID must be valid !';
                          }
                        },
                        controller: controller.cinController,
                        decoration:  InputDecoration(
                          focusColor: Colors.blueAccent,
                          fillColor: Colors.blueAccent,
                          prefixIcon: Icon(
                            Icons.credit_card,
                            size: 20,
                            color: Colours.navy,
                          ),
                          label: const Text(
                            'ID',
                            style: TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                          border: const OutlineInputBorder(),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    SizedBox(
                      height: 50,
                      child: TextFormField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        keyboardType: TextInputType.phone,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your phone number !';
                          } else if (!value.isNum || value.length!=8) {
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
                          label: const Text(
                            'phone',
                            style: TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                          border: const OutlineInputBorder(),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                      Obx(() {
                        return SizedBox(
                          height: 50,
                          child: TextFormField(
                            obscureText: controller.isPasswordVisible.value,
                            controller: controller.passwordController,
                            decoration: InputDecoration(
                              label: const Text(
                                'Password',
                                style: TextStyle(
                                  color: Colors.grey,
                                ),
                              ),
                              border: const OutlineInputBorder(),
                              isDense: true,
                              icon: Icon(Icons.password_outlined),
                              suffix: IconButton(
                                onPressed: () {
                                  controller.isPasswordVisible.value =
                                  !controller.isPasswordVisible.value;
                                },
                                icon: Obx(
                                      () => Icon(
                                    controller.isPasswordVisible.value
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                    size: 20,
                                    color: Colors.grey,
                                  ),
                                ),
                              ),
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter a password !';
                              } else if (value.length < 8 ){
                              return 'Your password must contain at least 8 characters !';
                              }
                              return null;
                              },
                            autovalidateMode: AutovalidateMode.onUserInteraction,
                            onSaved: (String? value) {},
                          ),
                        );
                      }),
                      ],
                    ),
              ),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    const SizedBox(height: 40.0, width: double.infinity),
                    Align(
                      alignment: Alignment.center,
                      child: MyElevatedButton(
                        text: 'Sign up',
                        onPressed: () {
                          controller.register();
                        },
                      ),
                    ),
          ],),
    ),
    );

  }
}
