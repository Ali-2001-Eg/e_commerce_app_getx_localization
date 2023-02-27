import 'package:e_commerce_app_with_firebase/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../logic/controllers/auth_controller.dart';
import '../../../utils/my_string.dart';
import '../../widgets/auth_text_form_field.dart';

class ForgotPasswordScreen extends StatelessWidget {
  ForgotPasswordScreen({Key? key}) : super(key: key);
  final formKey = GlobalKey<FormState>();
  final  emailController = TextEditingController();
  final  AuthController controller = Get.put(AuthController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor:Colors.white,
          title: const Text(
            'Forgot Password',
            style: TextStyle(
              color: mainColor,
            ),
          ),
          leading: IconButton(
              onPressed: () => Get.back(),
              icon: const Icon(
                Icons.arrow_back_ios,
                color: Colors.black,
              )),
          elevation: 0,
          centerTitle: true,
        ),
        backgroundColor: Colors.white,
        body: Form(
          key: formKey,
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.centerRight,
                  child: IconButton(
                      icon: const Icon(
                        Icons.close,
                      ),
                      onPressed: () => Get.back()),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  'If you want to recover your account, then please provide your email ID below..',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.lato(
                      textStyle: const TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.w800)),
                ),
                const SizedBox(
                  height: 50,
                ),
                Image.asset(
                  'assets/images/forgetpass copy.png',
                  width: 350,
                ),
                const SizedBox(
                  height: 50,
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
                  height: 50,
                ),

                   _authButton(onPressed: () {
                   if(formKey.currentState!.validate()){
                     controller.resetPassword(email: emailController.text.trim());

                   }
                  }, text: 'SEND')

              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _authButton({required Function() onPressed, required String text}) =>
      ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.purple,
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 50),
          ),
          child: Text(
            text,
            style: GoogleFonts.lato(
                textStyle: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 30)),
          ));
}
