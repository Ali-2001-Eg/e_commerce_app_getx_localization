import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../routes/app_routes.dart';
import '../../utils/theme.dart';
import '../widgets/text_utils.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Stack(
        children: [
          SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: Image.asset(
              'assets/images/background.png',
              fit: BoxFit.cover,
            ),
          ),
          Container(
            color: Colors.black.withOpacity(0.2),
            width: double.infinity,
            height: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 100,
                ),
                Container(
                  height: 60,
                  width: 190,
                  decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(5)),
                  child: Center(
                    child: TextUtils(
                      fontWeight: FontWeight.bold,
                      fontSize: 36,
                      text: 'Welcome',
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                Container(
                  height: 60,
                  width: 190,
                  decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(5)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextUtils(
                        fontWeight: FontWeight.bold,
                        fontSize: 36,
                        text: 'Ali',
                        color: mainColor,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      TextUtils(
                        fontWeight: FontWeight.bold,
                        fontSize: 36,
                        text: 'Shop',
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 250,
                ),
                ElevatedButton(
                    onPressed: () {
                      Get.offNamed(Routes.login);
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      backgroundColor: mainColor,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 40, vertical: 12),
                    ),
                    child: TextUtils(
                      text: 'Get Started',
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                    )),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextUtils(
                        text: 'Don\'t have an account',
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                    const SizedBox(
                      width: 10,
                    ),
                    TextButton(
                        onPressed: () {
                          Get.offNamed(Routes.register);
                        },
                        child: TextUtils(
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                          text: 'Sign up',
                          fontSize: 25,
                          underlined: true,
                        ))
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    ));
  }
}
