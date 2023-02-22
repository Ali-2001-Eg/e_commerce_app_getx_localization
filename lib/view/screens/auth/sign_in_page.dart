import 'package:e_commerce_app_with_firebase/view/widgets/wave_clipper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../logic/controllers/auth_controller.dart';
import '../../../routes/app_routes.dart';
import '../../../utils/my_string.dart';
import '../../widgets/auth_text_form_field.dart';
import '../../widgets/text_utils.dart';

class SignInScreen extends StatelessWidget {
  SignInScreen({Key? key}) : super(key: key);
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final usernameController = TextEditingController();
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
                            left: MediaQuery.of(context).size.width / 2.6),
                        color: Colors.purple,
                        child: TextUtils(
                          fontSize: 50,
                          text: 'Login',
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
                      hint: 'user name',
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
                          return 'Enter valid email address';
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
                    Obx(() => AuthTextFormField(
                          controller: passwordController,
                          textInputType: TextInputType.visiblePassword,
                          obscureText: controller.isPasswordShown.value,
                          validator: (value) {
                            if (value!.length <= 1) {
                              return 'Enter valid number';
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
                    Row(
                      children: [
                        Expanded(child: Container()),
                        TextButton(
                            onPressed: () => Get.toNamed(Routes.forgotPassword),
                            child: TextUtils(
                                text: 'Forgot Password?',
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.purple)),
                      ],
                    ),
                    const SizedBox(height: 10,),
                    TextUtils(text: 'OR SIGN WITH',color: Colors.purple,fontWeight: FontWeight.bold,fontSize: 30),
                    const SizedBox(height: 20,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap:(){
                            controller.facebookSignInUsingFirebase();
                          },
                          child: Container(
                            height: 60,
                            width: 60,
                            decoration: const BoxDecoration(
                              // color: Colors.red,
                              // shape: BoxShape.circle,
                              image: DecorationImage(
                                image: AssetImage('assets/images/facebook.png'),
                                fit: BoxFit.fill
                              )
                            ),
                          ),
                        ),
                        const SizedBox(width: 50,),
                        //google
                        GestureDetector(
                          onTap: (){
                            controller.googleSignInUsingFirebase();
                          },
                          child: Container(
                            height: 60,
                            width: 60,
                            decoration: const BoxDecoration(
                              // color: Colors.red,
                              // shape: BoxShape.circle,
                                image: DecorationImage(
                                    image: AssetImage('assets/images/google.png'),
                                    fit: BoxFit.fitHeight
                                )
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      children: [
                        ElevatedButton(
                            onPressed: () {
                              if(formKey.currentState!.validate()){
                                controller.signInUsingFirebase(email: emailController.text.trim(),password: passwordController.text.trim());
                              }else{}
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
                              text: 'Sign In',
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.w700,
                            )),
                        const SizedBox(
                          width: 15,
                        ),
                        Expanded(
                            child: TextButton(
                                onPressed: () => Get.toNamed(Routes.register),
                                child: TextUtils(
                                  text: 'Don\'t have an account ?',
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
    ));
  }
}




