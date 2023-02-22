import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../logic/controllers/auth_controller.dart';
import '../../../routes/app_routes.dart';
import '../../../utils/my_string.dart';
import '../../../utils/theme.dart';
import '../../widgets/auth_text_form_field.dart';
import '../../widgets/text_utils.dart';
import '../../widgets/wave_clipper.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({Key? key}) : super(key: key);
  final formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var confirmPasswordController = TextEditingController();
  var phoneController = TextEditingController();
  var usernameController = TextEditingController();
  final AuthController controller = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey.shade200,
        resizeToAvoidBottomInset: true,
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //curved container
              SizedBox(
                width: double.infinity,
                height: 300,
                child: Stack(
                  children: [
                    ClipPath(
                      clipper: WaveClipper(),
                      child: Container(
                          height: 300,
                          width: double.infinity,
                          padding: EdgeInsets.only(
                              top: 100,
                              left: MediaQuery.of(context).size.width / 3),
                          color: Colors.purple,
                          child: TextUtils(
                            fontSize: 40,
                            text: 'Register',
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          )),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 40, left: 40, right: 40),
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      AuthTextFormField(
                        controller: usernameController,
                        textInputType: TextInputType.name,
                        obscureText: false,
                        validator: (value) {
                          if (value!.length <= 2 ||
                              !RegExp(validationName).hasMatch(value)) {
                            return 'Enter valid number';
                          } else {
                            return null;
                          }
                        },
                        prefixIcon: Icons.person,
                        hint: 'username',
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      AuthTextFormField(
                        controller: emailController,
                        textInputType: TextInputType.emailAddress,
                        obscureText: false,
                        validator: (value) {
                          if (!RegExp(validationEmail).hasMatch(value!)) {
                            return 'Invalid Email';
                          } else {
                            return null;
                          }
                        },
                        prefixIcon: Icons.mail,
                        hint: 'Email Address',
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      AuthTextFormField(
                        controller: phoneController,
                        textInputType: TextInputType.phone,
                        obscureText: false,
                        validator: (value) {
                          if (value!.length < 11) {
                            return 'Invalid phone number, must be longer than 11 characters ';
                          } else {
                            return null;
                          }
                        },
                        prefixIcon: Icons.phone,
                        hint: 'phone number',
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Obx(() => AuthTextFormField(
                            controller: passwordController,
                            textInputType: TextInputType.visiblePassword,
                            obscureText: controller.isPasswordShown.value,
                            validator: (value) {
                              if (value!.length < 6) {
                                return 'Invalid password, must be longer than 6 characters ';
                              } else {
                                return null;
                              }
                            },
                            prefixIcon: Icons.lock,
                            hint: 'Password',
                            hasSuffix: true,
                            onSuffixTap: () => controller.changeSuffixIcon(),
                            suffixIcon: controller.isPasswordShown.value
                                ? Icons.visibility_off
                                : Icons.remove_red_eye,
                          )),
                      const SizedBox(
                        height: 20,
                      ),
                      Obx(() => AuthTextFormField(
                            controller: confirmPasswordController,
                            textInputType: TextInputType.visiblePassword,
                            obscureText: controller.isConfirmedShown.value,
                            validator: (value) {
                              if(passwordController.text.trim()!=confirmPasswordController.text.trim()){
                                return 'No match with password';
                              }else {
                                return null;
                              }
                            },
                            prefixIcon: Icons.lock,
                            hasSuffix: true,
                            hint: 'Confirm Password',
                            suffixIcon: controller.isConfirmedShown.value
                                ? Icons.visibility_off
                                : Icons.remove_red_eye,
                            onSuffixTap: () =>
                                controller.changeSuffixConfirmedIcon(),
                          )),
                      const SizedBox(
                        height: 50,
                      ),
                      Row(
                        children: [
                           ElevatedButton(
                                onPressed: ()  {
                                  if (formKey.currentState!.validate()) {
                                    controller.signUpUsingFirebase(
                                        email: emailController.text.trim(),
                                        password: passwordController.text.trim(),
                                        name: usernameController.text.trim());
                                    Get.snackbar('Success'.capitalize!, 'You have an account now',colorText: Colors.white,barBlur: 160,backgroundColor: notiSettings);

                                  } else {}
                                },
                                style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  backgroundColor: Colors.purple,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 40, vertical: 12),
                                ),
                                child: TextUtils(
                                  text: 'Sign Up',
                                  color: Colors.white,
                                  fontSize: 22,
                                  fontWeight: FontWeight.w700,
                                ))
                          ,
                          SizedBox(
                            width: 15,
                          ),
                          Expanded(
                              child: TextButton(
                                  onPressed: () => Get.toNamed(Routes.login),
                                  child: TextUtils(
                                    text: 'Already have an account?',
                                    color: Colors.purple,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  )))
                        ],
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
