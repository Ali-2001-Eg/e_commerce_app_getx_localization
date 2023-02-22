import 'package:e_commerce_app_with_firebase/logic/controllers/auth_controller.dart';
import 'package:e_commerce_app_with_firebase/logic/controllers/theme_controller.dart';
import 'package:e_commerce_app_with_firebase/utils/theme.dart';
import 'package:e_commerce_app_with_firebase/view/widgets/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              icon: Icon(
                //to update icons we must use scaffold and background
                Get.isDarkMode
                    ? Icons.brightness_2_outlined
                    : Icons.dark_mode_rounded,
                color: Get.isDarkMode ? Colors.white : Colors.black,
                size: 30,
              ),
              onPressed: () {
                //to toggle between two themes
                ThemeController().changeTheme();
              },
            ),
            const SizedBox(
              height: 40,
            ),
            GetBuilder<AuthController>(builder: (controller) {
              return ElevatedButton(
                  onPressed: () {
                    Get.defaultDialog(
                      backgroundColor: Colors.grey,
                      title: 'Log out From App',
                      titleStyle: const TextStyle(fontSize: 18,color: Colors.white,fontWeight: FontWeight.bold),
                      middleText: 'Are you sure you want to log out',
                       middleTextStyle: const TextStyle(fontSize: 18,color: Colors.black,fontWeight: FontWeight.bold),
                      radius: 10,
                      textCancel: ' No ',
                      cancelTextColor: Colors.white,
                      textConfirm: ' Yes ',
                      confirmTextColor: Colors.white,
                      onCancel: () => Navigator.pop(context),
                      onConfirm: () =>  controller.signOut(),
                      buttonColor: Get.isDarkMode?pinkClr:mainColor,

                    );

                  },
                  style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 20)),
                  child: TextUtils(
                      text: 'Sign out',
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.white));
            })
          ],
        ),
      ),
    );
  }
}
