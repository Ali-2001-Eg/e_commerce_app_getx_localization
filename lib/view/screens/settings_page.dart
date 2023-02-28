import 'package:e_commerce_app_with_firebase/logic/controllers/auth_controller.dart';
import 'package:e_commerce_app_with_firebase/logic/controllers/theme_controller.dart';
import 'package:e_commerce_app_with_firebase/utils/theme.dart';
import 'package:e_commerce_app_with_firebase/view/widgets/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/settings/dark_mode_widget.dart';
import '../widgets/settings/image_profile_widget.dart';
import '../widgets/settings/language_widget.dart';
import '../widgets/settings/logout_widget.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        backgroundColor: context.theme.backgroundColor,
        body: ListView(

          padding: const EdgeInsets.all( 25),
          children: [
             ProfileWidget(),
            Divider(
              color: Get.isDarkMode ? Colors.white : Colors.grey,
              thickness: 2,
            ),
            const SizedBox(
              height: 20,
            ),
            TextUtils(
              text: 'general'.toUpperCase(),
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Get.isDarkMode ? pinkClr : mainColor,
            ),
            const SizedBox(
              height: 20,
            ),
             DarkModeWidget(),
            const SizedBox(
              height: 20,
            ),
             LanguageWidget(),
            const SizedBox(
              height: 20,
            ),
             LogoutWidget(),
          ],
        )
        );
  }
}
